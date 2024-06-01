// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:Dentecs/views/Home_view/Home_view.dart';
import 'package:Dentecs/views/Notifications/Notifications.dart';
import 'package:flutter/material.dart';
import 'package:Dentecs/core/shared/utils.dart';

import 'package:Dentecs/widget/CustomDrawer.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class MainView extends StatelessWidget {
  MainView({super.key});

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        drawer: CustomDrawer(),
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          leading: Padding(
            padding: EdgeInsets.only(bottom: screenWidth(40)),
            child: IconButton(
              onPressed: () {
                _scaffoldKey.currentState!
                    .openDrawer(); // فتح الـ Drawer عند الضغط على الأيقونة
              },
              icon: Icon(Icons.menu),
            ),
          ),
          actions: [
            Padding(
              padding: EdgeInsets.only(
                  left: screenWidth(2222), top: screenWidth(1000)),
              child: IconButton(
                  onPressed: () {
                    Get.to(NotificationsPage());
                  },
                  icon: Container(
                    width: screenWidth(10),
                    height: screenWidth(10),
                    decoration: BoxDecoration(
                        color: const Color.fromARGB(155, 0, 0, 0),
                        border: Border.all(),
                        shape: BoxShape.circle),
                    child: Icon(
                      FontAwesomeIcons.bell,
                      fill: 1,
                      size: screenWidth(15),
                      color: Colors.white,
                    ),
                  )),
            ),
            Padding(
                padding: EdgeInsets.only(
                    left: screenWidth(22), top: screenWidth(10)),
                child: Container()),
          ],
          title: Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Image.asset(
              "assets/images/pngs/dentecs.png",
              height: screenHeight(18),
            ),
          ),
        ),
        body: Home_view());
  }
}
