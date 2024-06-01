// ignore_for_file: unused_local_variable, no_leading_underscores_for_local_identifiers, avoid_print

import 'package:Dentecs/data/datasource/static/database.dart';
import 'package:Dentecs/data/datasource/static/static.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:Dentecs/app/my_app.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:Dentecs/core/services/services.dart';
import 'dart:io';
import 'package:firebase_core/firebase_core.dart';

// Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
//   await Hive.initFlutter();
//   await Hive.openBox("mybox1");

//   ToDoDataBase db = ToDoDataBase();
//   final _myBox = Hive.box('mybox1');

//   if (_myBox.get("BOOKED") == null) {
//     db.createInitialData();
//   } else {
//     db.loadData();
//   }
//   if (message.notification != null) {
//     int appointmentId = int.parse(message.data['id']);
//     try {
//       var appointment =
//           booked.firstWhere((appointment) => appointment[0] == appointmentId);
//       appointment[3] = true;
//       db.updateDataBase();
//     } catch (e) {
//       print('Appointment with id $appointmentId not found $e');
//     }
//   }
// }

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  try {
    await Hive.initFlutter();
    var box = await Hive.openBox("mybox1");

    ToDoDataBase db = ToDoDataBase();
    final _myBox = Hive.box('mybox1');

    if (_myBox.get("BOOKED") == null) {
      db.createInitialData();
    } else {
      db.loadData();
    }

    if (message.notification != null) {
      int appointmentId = int.parse(message.data['id']);
      try {
        var appointment =
            booked.firstWhere((appointment) => appointment[0] == appointmentId);
        appointment[3] = true;
        db.updateDataBase();
      } catch (e) {
        print('Appointment with id $appointmentId not found: $e');
      }
    }
  } catch (e) {
    print('Error in background handler: $e');
  }
}

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Platform.isAndroid
      ? await Firebase.initializeApp(
          options: const FirebaseOptions(
          apiKey: "AIzaSyAYoW8rdCQSalJLk-uycbv-NseI9YJZyhI",
          appId: "1:853211700669:android:2c465d4b9470f3c8fa86d4",
          messagingSenderId: "853211700669",
          projectId: "shams-8e7d7",
          storageBucket: "shams-8e7d7.appspot.com",
        ))
      : await Firebase.initializeApp();

  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  await initialServices();
  await Hive.initFlutter();
  await Hive.openBox("mybox1");

  runApp(const MyApp());
}
