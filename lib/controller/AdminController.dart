// ignore_for_file: file_names

import 'package:Dentecs/core/constant/link_API.dart';
import 'package:Dentecs/data/crud.dart';
import 'package:Dentecs/data/datasource/static/database.dart';
import 'package:Dentecs/data/datasource/static/static.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';

// ignore: camel_case_types
class AdminController extends GetxController with Crud {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  ToDoDataBase db = ToDoDataBase();
  final _myBox = Hive.box('mybox1');

  @override
  void onInit() {
    if (_myBox.get("ALLBOOKED") == null) {
      db.createInitialData();
    } else {
      db.loadData();
    }
    getallappoint();

    super.onInit();
  }

  Future getallappoint() async {
    allbooked.clear();
    allbooked = await getRequest(LinkAppointment);
    // print(AllBookedList[0]);
    // allbooked.addAll([AllBookedList]);
    db.updateDataBase();

    update();
  }

  deleteappointment(i) {
    allbooked.removeAt(i);
    db.updateDataBase();
    update();
  }
}
