// ignore_for_file: avoid_print

import 'package:Dentecs/data/datasource/static/database.dart';
import 'package:Dentecs/data/datasource/static/static.dart';
import 'package:Dentecs/views/patients/BookedAppointment.dart';
// import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:hive_flutter/hive_flutter.dart';

class LocaleController extends GetxController {
  // Locale? language;
  // MyServices myServices = Get.find();
  final myBox = Hive.box('mybox1');

  ToDoDataBase db = ToDoDataBase();
  // late Box myBox;
  // تعريف الصندوق كمتغير داخل الفئة

  // changeLang(String langcode) {
  //   Locale locale = Locale(langcode);
  //   myServices.sharedPreferences.setString("lang", langcode);
  //   Get.updateLocale(locale);
  // }

  // requestPerLocation() async {
  //   bool serviceEnabled;
  //   LocationPermission permission;
  //   serviceEnabled = await Geolocator.isLocationServiceEnabled();
  //   if (!serviceEnabled) {
  //     return Get.snackbar("تنبيه", "الرجاء تشغيل خدمو تحديد الموقع");
  //   }
  //   permission = await Geolocator.checkPermission();
  //   if (permission == LocationPermission.denied) {
  //     permission = await Geolocator.requestPermission();
  //     if (permission == LocationPermission.denied) {
  //       return Get.snackbar("تنبيه", "الرجاء اعطاء صلاحية الموقع للتطبيق");
  //     }
  //   }

  //   if (permission == LocationPermission.deniedForever) {
  //     // Permissions are denied forever, handle appropriately.
  //     return Get.snackbar("تنبيه", "لا يمكن استعمال التطبيق من دون اللوكيشين");
  //   }
  // }

  @override
  void onInit() {
    // openBox();

    if (myBox.get("BOOKED") == null) {
      db.createInitialData();
    } else {
      db.loadData();
    }

    // FirebaseMessaging.instance.unsubscribeFromTopic('amer');
    FirebaseMessaging.onMessageOpenedApp.listen((event) {
      Get.to(const BookedAppointment());
    });

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      if (message.notification != null) {
        int appointmentId = int.parse(message.data['id']);
        changeConfirmed(appointmentId);
      }
    });

    // // requestPerLocation();
    // String? sharedPrefLang = myServices.sharedPreferences.getString("lang");
    // if (sharedPrefLang == "ar") {
    //   language = const Locale("en");
    // } else if (sharedPrefLang == "en") {
    //   language = const Locale("en");
    // } else {
    //   language = Locale(Get.deviceLocale!.languageCode);
    // }
    super.onInit();
  }

  // void openBox() async {
  //   // فتح الصندوق وتخزينه في المتغير myBox
  //   myBox = await Hive.openBox('mybox1');
  // }

  void changeConfirmed(int id) {
    try {
      var appointment =
          booked.firstWhere((appointment) => appointment[0] == id);
      appointment[3] = true;
      db.updateDataBase();
    } catch (e) {
      print('Appointment with id $id not found');
    }
  }
}
