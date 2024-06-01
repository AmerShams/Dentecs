import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:Dentecs/core/constant/color.dart';
import 'package:Dentecs/core/shared/utils.dart';
import 'package:Dentecs/controller/organise_controller.dart';
import 'package:Dentecs/data/datasource/static/static.dart';
import 'package:Dentecs/widget/CustomDrawer.dart';

// ignore: must_be_immutable, camel_case_types
class Organise_view extends StatelessWidget {
  Organise_view({super.key});

  // ignore: non_constant_identifier_names
  Organise_Controller O_Conroller = Get.put(Organise_Controller());
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
            Text('key_organise'.tr),
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
          SizedBox(
            height: screenHeight(27),
          ),
          GetBuilder<Organise_Controller>(builder: (oConroller) {
            return Column(
              children: [
                SizedBox(
                  width: double.infinity,
                  height: screenHeight(9.5),
                  child: ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      itemCount: organiseList.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (ctx, index) {
                        return Column(
                          children: [
                            GestureDetector(
                              onTap: () {
                                oConroller.current = index;
                                oConroller.cur();
                              },
                              child: AnimatedContainer(
                                duration: const Duration(milliseconds: 300),
                                margin: EdgeInsets.all(screenWidth(100)),
                                width: screenWidth(2),
                                height: screenHeight(13),
                                decoration: BoxDecoration(
                                  color: oConroller.current == index
                                      ? Colors.white70
                                      : Colors.white54,
                                  borderRadius: oConroller.current == index
                                      ? BorderRadius.circular(screenHeight(35))
                                      : BorderRadius.circular(screenHeight(60)),
                                  border: oConroller.current == index
                                      ? Border.all(
                                          color: Colors.blue.shade300,
                                          width: screenWidth(120))
                                      : null,
                                ),
                                child: Center(
                                  child: Text(
                                    organiseList[index].title!,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: oConroller.current == index
                                            ? AppColor.black
                                            : Colors.grey[700]),
                                  ),
                                ),
                              ),
                            ),
                            //
                            Visibility(
                                visible: oConroller.current == index,
                                child: Container(
                                  width: screenWidth(10),
                                  height: screenHeight(100),
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.blue.shade300),
                                )),
                          ],
                        );
                      }),
                ),
                SizedBox(
                  height: screenHeight(1.6),
                  child: Stack(
                    children: [
                      Positioned(
                        top: screenHeight(18),
                        left: screenHeight(40),
                        child: Center(
                            child: Container(
                          decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.circular(screenWidth(30)),
                            color: AppColor.backgroundcolor,
                          ),
                          height: screenHeight(1.4),
                          width: screenWidth(1.12),
                          child: Padding(
                              padding: EdgeInsets.all(screenWidth(18.5)),
                              child: ListView(
                                children: [
                                  SizedBox(
                                    height: screenHeight(30),
                                  ),
                                  Text(organiseList[oConroller.current].body!)
                                ],
                              )),
                        )),
                      ),
                      Positioned(
                        top: screenHeight(50),
                        left: screenHeight(18.5),
                        child: Center(
                            child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            gradient: const LinearGradient(
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter,
                              colors: [Color(0xFFE3F2FD), Color(0xFF0D47A1)],
                            ),
                          ),
                          height: screenHeight(13.5),
                          width: screenWidth(1.3),
                          child: Center(
                              child: Text(
                            organiseList[oConroller.current].title!,
                            style: const TextStyle(
                                color: AppColor.black,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Cairo'),
                          )),
                        )),
                      ),
                    ],
                  ),
                ),
              ],
            );
          }),
        ]),
      )),
    );
  }
}
