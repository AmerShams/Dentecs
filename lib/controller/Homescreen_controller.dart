// ignore_for_file: file_names

import 'package:Dentecs/views/Admin/AdminView.dart';
import 'package:Dentecs/views/ProfilePage/ProfilePage.dart';
import 'package:Dentecs/views/ServicesPage/ServicesPage.dart';
import 'package:Dentecs/views/main_views/main_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreenController extends GetxController {
  int currentPage = 0;
  List<Widget> listPage = [
    MainView(),
    const ServicesPage(),
    const ProfilePage(),
    const AdminView(),
  ];
  void changepage(int i) {
    currentPage = i;
    update();
  }
}
