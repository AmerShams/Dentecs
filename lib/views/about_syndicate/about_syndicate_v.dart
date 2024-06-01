// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:Dentecs/core/shared/utils.dart';
import 'package:Dentecs/data/datasource/static/static.dart';
import 'package:Dentecs/widget/CustomDrawer.dart';
import 'package:Dentecs/widget/custom_stack.dart';

// ignore: camel_case_types
class About_syndicate extends StatelessWidget {
  About_syndicate({super.key});
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
            Text('key_about'.tr),
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
            CustomStack(
              title: aboutModel[0].title!,
              body: aboutModel[0].body!,
            ),
            CustomStack(
              title: aboutModel[1].title!,
              body: aboutModel[1].body!,
            ),
            CustomStack(
              title: aboutModel[2].title!,
              body: aboutModel[2].body!,
            ),
          ]),
        ),
      ),
    );
  }
}
