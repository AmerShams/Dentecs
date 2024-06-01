import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:Dentecs/core/shared/utils.dart';
import 'package:Dentecs/widget/CustomDrawer.dart';

// ignore: camel_case_types
class Contact_view extends StatelessWidget {
  Contact_view({super.key});
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      key: _scaffoldKey,
      appBar: AppBar(
        title: Row(
          children: [
            Image.asset(
              "assets/images/pngs/logo1.png",
              height: screenHeight(12),
            ),
            SizedBox(
              width: screenWidth(15),
            ),
            Text('key_contact'.tr),
          ],
        ),
        backgroundColor: Colors.transparent,
        leading: IconButton(
            onPressed: () {
              _scaffoldKey.currentState!.openDrawer();
            },
            icon: const Icon(Icons.menu)),
      ),
      drawer: const CustomDrawer(),
      body: Center(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Colors.blue.shade100, Colors.blue.shade300],
            ),
          ),
          child: ListView(children: [
            Image.asset(
              "assets/images/pngs/logo.png",
              height: screenHeight(9),
              opacity: const AlwaysStoppedAnimation(1),
            ),
          ]),
        ),
      ),
    );
  }
}
