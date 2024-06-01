// ignore_for_file: file_names

import 'package:Dentecs/data/datasource/static/database.dart';
import 'package:Dentecs/data/datasource/static/static.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';

// ignore: camel_case_types
class ServicesController extends GetxController {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  ToDoDataBase db = ToDoDataBase();
  final _myBox = Hive.box('mybox1');

  @override
  void onInit() {
    if (_myBox.get("PATIENTS") == null) {
      db.createInitialData();
    } else {
      db.loadData();
    }
    super.onInit();
  }

  deletepaatient(i) {
    patients.removeAt(i);
    db.updateDataBase();
    update();
  }

  deleteappointment(i) {
    booked.removeAt(i);
    db.updateDataBase();
    update();
  }
}
