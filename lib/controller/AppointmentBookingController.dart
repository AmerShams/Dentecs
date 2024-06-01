// ignore_for_file: file_names, non_constant_identifier_names, avoid_single_cascade_in_expression_statements, use_build_context_synchronously
import 'dart:convert';

import 'package:Dentecs/core/constant/link_API.dart';
import 'package:Dentecs/data/crud.dart';
import 'package:Dentecs/data/datasource/static/database.dart';
import 'package:Dentecs/data/datasource/static/static.dart';
import 'package:Dentecs/data/model/DoctorsModel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_cupertino_datetime_picker/flutter_cupertino_datetime_picker.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/intl.dart';

import 'package:awesome_dialog/awesome_dialog.dart';

class AppointmentBookingController extends GetxController with Crud {
  int appointmentId = 0;
  DoctorModel? doctormodel;
  bool isloading = false;
  bool vis = true;
  final formState = GlobalKey<FormState>();
  late TextEditingController firstNameController = TextEditingController();
  late TextEditingController lastNameController = TextEditingController();
  late TextEditingController birthDateController = TextEditingController();

  late TextEditingController mobileController = TextEditingController();
  late bool isMale;
  DateTime startDate = DateTime.now();
  String selectedServices = '1';
  String selectedDoctor = '2';
  String selectedPatient = '';
  ToDoDataBase db = ToDoDataBase();
  final _myBox = Hive.box('mybox1');

  List ServicesList = [
    {"title": "Cleaning"},
    {"title": "Fillings"},
    {"title": "Extraction"},
  ];
  List DoctorList = [
    {"username": "doctor_1"},
    {"username": "doctor_2"},
    {"username": "doctor_3"},
  ];
  Map<String, dynamic> AppointmentDetails = {};

  @override
  void onInit() {
    getDoctors();
    getServices();

    if (_myBox.get("BOOKED") == null) {
      db.createInitialData();
    } else {
      db.loadData();
    }

    vis = true;
    // isMale = true;
    firstNameController.clear();
    lastNameController.clear();
    mobileController.clear();
    birthDateController.clear();
    super.onInit();
  }

  void resetFields() {
    vis = true;
    isMale = true;
    firstNameController.clear();
    lastNameController.clear();
    mobileController.clear();
    birthDateController.clear();
    startDate = DateTime.now();
    selectedServices = '1';
    selectedDoctor = '2';
    selectedPatient = patients[0][0].toString();
    update();
  }

  AddAppointment(BuildContext context) async {
    try {
      if (formState.currentState!.validate()) {
        isloading = true;
        update();
        var response = await postRequest(LinkAppointment, {
          "date": birthDateController.text,
          "start_time": DateFormat('HH:mm').format(startDate).toString(),
          "end_time": DateFormat('HH:mm').format(startDate).toString(),
          "patient": selectedPatient,
          "service": selectedServices,
          "doctor": selectedDoctor,
          "confirmed": "false",
        });

        isloading = false;
        update();

        try {
          if (response != null) {
            if (response.statusCode == 201 || response.statusCode == 200) {
              vis = false;
              var responsebody = jsonDecode(response.body);
              appointmentId = responsebody['id'];
              getpatientbyId(appointmentId);
              AwesomeDialog(
                context: context,
                dialogType: DialogType.success,
                animType: AnimType.rightSlide,
                title: 'The appointment has been booked successfully',
                desc: "",
                btnOkOnPress: () {
                  Get.back();
                  resetFields(); // Reset fields to default values
                },
              )..show();
              update();
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
        title: 'Error',
        desc: e.toString(),
        btnCancelOnPress: () {},
        btnOkOnPress: () {},
      )..show();
    }
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

  @override
  void onClose() {
    firstNameController.dispose();
    lastNameController.dispose();
    mobileController.dispose();
    birthDateController.dispose();
    super.onClose();
  }

  startDateTime(BuildContext context) {
    return DatePicker.showDatePicker(
      context,
      dateFormat: 'HH:mm',
      initialDateTime: startDate,
      minDateTime: DateTime(2000),
      maxDateTime: DateTime(3000),
      onMonthChangeStartWithFirstDate: true,
      pickerMode: DateTimePickerMode.time,
      onConfirm: (dateTime, List<int> index) {
        startDate = dateTime;
        update();
      },
    );
  }

  Future getDoctors() async {
    DoctorList.clear();
    DoctorList.addAll(await getRequest(LinkDoctors));
    update();
  }

  Future getServices() async {
    ServicesList.clear();
    ServicesList.addAll(await getRequest(LinkServices));
    update();
  }

  Future<void> getpatientbyId(int id) async {
    AppointmentDetails.clear();
    AppointmentDetails.addAll(
        await getRequest("$LinkAppointment/${id.toString()}"));
    booked.add([
      AppointmentDetails['id'],
      AppointmentDetails['date'],
      AppointmentDetails['start_time'],
      AppointmentDetails['confirmed'],
      AppointmentDetails['patient'],
      AppointmentDetails['service'],
      AppointmentDetails['doctor'],
    ]);

    db.updateDataBase();
  }
}
