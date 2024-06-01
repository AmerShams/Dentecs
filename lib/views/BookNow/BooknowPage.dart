// ignore_for_file: file_names, use_key_in_widget_constructors

import 'package:Dentecs/controller/Booknow_controller.dart';
import 'package:Dentecs/core/shared/utils.dart';
import 'package:Dentecs/data/datasource/static/static.dart';
import 'package:Dentecs/views/patients/AddPatients.dart';
import 'package:Dentecs/views/patients/Appointment%20Booking.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class BookNow extends StatelessWidget {
  const BookNow({Key? key});

  @override
  Widget build(BuildContext context) {
    BooknowControllerImp controller = Get.put(BooknowControllerImp());
    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        actions: [
          Padding(
            padding: EdgeInsets.only(
                left: screenWidth(2222), top: screenWidth(1000)),
            child: IconButton(
                onPressed: () {},
                icon: Container(
                  width: screenWidth(11),
                  height: screenWidth(11),
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(126, 0, 0, 0),
                      border: Border.all(),
                      shape: BoxShape.circle),
                  child: Icon(
                    FontAwesomeIcons.bell,
                    fill: 1,
                    size: screenWidth(16),
                    color: Colors.white,
                  ),
                )),
          ),
          Padding(
              padding:
                  EdgeInsets.only(left: screenWidth(22), top: screenWidth(10)),
              child: Container()),
        ],
        title: Text(
          'Appointment Booking',
          style: TextStyle(fontFamily: 'Roboto', fontSize: screenWidth(21)),
        ),
        elevation: 3,
        backgroundColor: const Color.fromARGB(248, 177, 206, 216),
        leading: Padding(
          padding: const EdgeInsets.only(bottom: 5),
          child: IconButton(
            onPressed: () {
              controller.reset();

              Get.back();
            },
            icon: const Icon(Icons.arrow_back),
          ),
        ),
      ),
      body: Container(
        height: double.infinity,
        decoration: const BoxDecoration(color: Colors.white
            // gradient: LinearGradient(
            //   begin: Alignment.topLeft,
            //   end: Alignment.bottomRight,
            //   colors: [
            //     Color.fromARGB(255, 255, 255, 255),
            //     Color.fromARGB(72, 255, 255, 255),
            //   ],
            // ),
            ),
        child: Column(
          children: [
            Expanded(
              child: Stack(
                children: [
                  SizedBox(height: screenWidth(10)),
                  GetBuilder<BooknowControllerImp>(
                    builder: (controller) {
                      return PageView.builder(
                        controller: controller.pageController,
                        itemCount: PagesViews.length,
                        onPageChanged: (int page) {
                          controller.onchaged(page);
                        },
                        itemBuilder: (BuildContext context, int index) {
                          switch (index) {
                            case 0:
                              return AddPatients();
                            case 1:
                              return AppointmentBooking();
                            default:
                              return Container();
                          }
                        },
                      );
                    },
                  ),
                  GetBuilder<BooknowControllerImp>(
                    builder: (control) {
                      return Positioned(
                        bottom: screenHeight(20),
                        left: screenWidth(9),
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width,
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              ElevatedButton(
                                onPressed: () {
                                  if (controller.currentPage > 0) {
                                    control.pageController.previousPage(
                                      duration:
                                          const Duration(milliseconds: 500),
                                      curve: Curves.linear,
                                    );
                                  }
                                },
                                style: ElevatedButton.styleFrom(
                                  fixedSize:
                                      Size(screenWidth(2.7), screenWidth(8)),
                                  backgroundColor: control.currentPage == 0
                                      ? const Color.fromARGB(60, 122, 122, 122)
                                      : const Color.fromARGB(
                                          255, 122, 122, 122),
                                ),
                                child: Text(
                                  "Previous",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: screenWidth(20),
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: screenWidth(10),
                                ),
                                child: ElevatedButton(
                                  onPressed: () {
                                    if (controller.currentPage < 1) {
                                      controller.pageController.nextPage(
                                        duration:
                                            const Duration(milliseconds: 500),
                                        curve: Curves.linear,
                                      );
                                    }
                                  },
                                  style: ElevatedButton.styleFrom(
                                    fixedSize:
                                        Size(screenWidth(3), screenWidth(8)),
                                    backgroundColor: control.currentPage == 0
                                        ? const Color.fromARGB(
                                            255, 122, 122, 122)
                                        : const Color.fromARGB(
                                            60, 122, 122, 122),
                                  ),
                                  child: Text(
                                    "Next",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: screenWidth(20),
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
