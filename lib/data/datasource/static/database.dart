import 'package:hive_flutter/hive_flutter.dart';
import 'package:Dentecs/data/datasource/static/static.dart';

class ToDoDataBase {
  // reference our box

  final _myBox = Hive.box('mybox1');

  void createInitialData() {
    patients = [];
    booked = [];
    allbooked = [];
    notifications = [];
  }

  // load the data from database
  void loadData() {
    patients = _myBox.get("PATIENTS");
    booked = _myBox.get("BOOKED", defaultValue: []);
    allbooked = _myBox.get("ALLBOOKED", defaultValue: []);
    notifications = _myBox.get("NOT", defaultValue: []);
  }

  // update the database
  void updateDataBase() {
    _myBox.put("PATIENTS", patients);
    _myBox.put("BOOKED", booked);
    _myBox.put("ALLBOOKED", allbooked);
    _myBox.put("NOT", notifications);
  }
}
