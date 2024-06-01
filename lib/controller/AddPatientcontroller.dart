// ignore_for_file: file_names, non_constant_identifier_names, avoid_single_cascade_in_expression_statements, use_build_context_synchronously, avoid_print

import 'dart:convert';

import 'package:Dentecs/core/constant/link_API.dart';
import 'package:Dentecs/data/crud.dart';
import 'package:Dentecs/data/datasource/static/database.dart';
import 'package:Dentecs/data/datasource/static/static.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class AddPatientController extends GetxController with Crud {
  String? mytoken;
  int patientID = 0;
  bool isloading = false;
  bool vis = true;
  final formState = GlobalKey<FormState>();
  late TextEditingController firstNameController = TextEditingController();
  late TextEditingController lastNameController = TextEditingController();
  late TextEditingController birthDateController = TextEditingController();
  late TextEditingController mobileController = TextEditingController();
  late bool isMale;
  ToDoDataBase db = ToDoDataBase();
  final _myBox = Hive.box('mybox1');

  Map<String, dynamic> patientdetails = {};

  void resetFields() {
    vis = true;
    isMale = true;
    firstNameController.clear();
    lastNameController.clear();
    mobileController.clear();
    birthDateController.clear();
    update();
  }

  AddPatient(BuildContext context) async {
    try {
      if (formState.currentState!.validate()) {
        isloading = true;
        update();
        var response = await postRequest(LinkPatients, {
          "first_name": firstNameController.text,
          "last_name": lastNameController.text,
          "birth_date": birthDateController.text,
          "gender": isMale.toString(),
          "contacts_mobile": mobileController.text,
          "token": mytoken.toString()
        });

        isloading = false;
        update();

        try {
          if (response != null) {
            if (response.statusCode == 201 || response.statusCode == 200) {
              vis = false;
              var responsebody = jsonDecode(response.body);
              patientID = responsebody['patient_id'];
              getpatientbyId(patientID);

              AwesomeDialog(
                context: context,
                dialogType: DialogType.success,
                animType: AnimType.rightSlide,
                title: 'A patient has been added successfully',
                desc: "",
                btnOkOnPress: () {
                  resetFields(); // Reset fields to default values
                },
              )..show();
              update();

              // Get.offAllNamed(AppRoute.success);
            } else if (response.statusCode == 404) {
              AwesomeDialog(
                context: context,
                dialogType: DialogType.error,
                animType: AnimType.rightSlide,
                title: 'Error 404',
                desc: "Resource not found",
                btnCancelOnPress: () {},
                btnOkOnPress: () {},
              )..show();
            } else {
              AwesomeDialog(
                context: context,
                dialogType: DialogType.warning,
                animType: AnimType.rightSlide,
                title: 'Error',
                desc: "Ensure credentials",
                btnCancelOnPress: () {},
                btnOkOnPress: () {},
              )..show();
            }
          } else {
            // Handle null response
            AwesomeDialog(
              context: context,
              dialogType: DialogType.warning,
              animType: AnimType.rightSlide,
              title: 'Error',
              desc: "No response from server",
              btnCancelOnPress: () {},
              btnOkOnPress: () {},
            )..show();
          }
        } catch (e) {
          update();
          AwesomeDialog(
            context: context,
            dialogType: DialogType.warning,
            animType: AnimType.rightSlide,
            title: e.toString(),
            desc: "Ensure credentials",
            btnCancelOnPress: () {},
            btnOkOnPress: () {},
          )..show();
        }
      }
    } catch (e) {
      AwesomeDialog(
        context: context,
        dialogType: DialogType.warning,
        animType: AnimType.rightSlide,
        title: 'Error ',
        // desc: e.toString(),
        btnCancelOnPress: () {},
        btnOkOnPress: () {},
      )..show();
    }
  }

  @override
  void onInit() {
    RequestPermission();

    gettoken();

    if (_myBox.get("PATIENTS") == null) {
      db.createInitialData();
    } else {
      db.loadData();
    }
    vis = true;
    isMale = true;
    firstNameController.clear();
    lastNameController.clear();
    mobileController.clear();
    birthDateController.clear();
    super.onInit();
  }

  changegender(bool i) {
    isMale = i;
    update();
  }

  changebirth(date) {
    birthDateController.text =
        "${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}";
    update();
  }

  changevisible() {}

  @override
  void onClose() {
    firstNameController.clear();
    lastNameController.clear();
    mobileController.clear();
    birthDateController.clear();

    super.onClose();
  }

  Future<void> getpatientbyId(int id) async {
    patientdetails.clear();
    patientdetails.addAll(await getRequest("$LinkPatients/${id.toString()}"));
    debugPrint(patientdetails['first_name']);
    patients.add([
      patientdetails['id'],
      patientdetails['first_name'],
      patientdetails['birth_date'],
      patientdetails['contacts_mobile'],
      patientdetails['date_created'],
      patientdetails['gender'],
      patientdetails['last_name'],
    ]);

    db.updateDataBase();
  }

  RequestPermission() async {
    FirebaseMessaging messaging = FirebaseMessaging.instance;

    NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      print('User granted permission');
    } else if (settings.authorizationStatus ==
        AuthorizationStatus.provisional) {
      print('User granted provisional permission');
    } else {
      print('User declined or has not accepted permission');
    }
  }

  gettoken() async {
    mytoken = await FirebaseMessaging.instance.getToken();
    print(mytoken);
  }
}
