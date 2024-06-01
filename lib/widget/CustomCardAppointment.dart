// ignore_for_file: must_be_immutable, file_names

import 'package:Dentecs/core/shared/utils.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class CustomCardAppointment extends StatelessWidget {
  final int id;
  final String date;
  final String starttime;

  final String confirmed;
  final String patient;
  final String service;
  final String doctor;

  final void Function()? editTask;

  final void Function(BuildContext)? deleteFunc;

  const CustomCardAppointment({
    super.key,
    required this.deleteFunc,
    this.editTask,
    required this.id,
    required this.date,
    required this.starttime,
    required this.confirmed,
    required this.patient,
    required this.service,
    required this.doctor,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: screenWidth(20)),
      child: Slidable(
        endActionPane: ActionPane(
          motion: const StretchMotion(),
          children: [
            SlidableAction(
                onPressed: deleteFunc,
                icon: Icons.delete,
                backgroundColor: Colors.red.shade300,
                borderRadius: BorderRadius.circular(20))
          ],
        ),
        child: Card(
          color: Colors.white,
          elevation: 2.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: screenWidth(40)),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                InkWell(
                  onTap: () {
                    // Get.to(UpComing());
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                          left: screenWidth(18),
                          right: screenWidth(20),
                        ),
                        child: Icon(
                          FontAwesomeIcons.idCard,
                          size: screenWidth(18),
                          color: const Color.fromARGB(170, 0, 0, 0),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                "Patient ID :  ",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontFamily: "roboto",
                                  fontSize: screenWidth(27),
                                  color: const Color.fromARGB(170, 0, 0, 0),
                                ),
                              ),
                              Text(
                                " $patient",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontFamily: "roboto",
                                    fontSize: screenWidth(27),
                                    color:
                                        const Color.fromARGB(220, 12, 64, 101)),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                "Appointment ID : ",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: screenWidth(27),
                                  fontFamily: "roboto",
                                  color: const Color.fromARGB(170, 0, 0, 0),
                                ),
                              ),
                              Text(
                                " $id",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: screenWidth(27),
                                    fontFamily: "roboto",
                                    color:
                                        const Color.fromARGB(220, 12, 64, 101)),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.start,
                //   children: [
                //     SizedBox(
                //       width: screenWidth(6),
                //     ),
                //   ],
                // ),
                const Divider(
                  endIndent: 20,
                  indent: 20,
                  color: Color.fromARGB(44, 19, 51, 56),
                ),
                InkWell(
                  onTap: () {
                    // Get.to(UpComing());
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 18),
                        child: Icon(
                          Icons.date_range,
                          size: screenWidth(18),
                          color: const Color.fromARGB(170, 0, 0, 0),
                        ),
                      ),
                      Text(
                        "Date  : ",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: screenWidth(27),
                          fontFamily: "roboto",
                          color: const Color.fromARGB(170, 0, 0, 0),
                        ),
                      ),
                      Text(
                        " $date |  ${starttime.substring(0, 5)}",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: screenWidth(27),
                            fontFamily: "roboto",
                            color: const Color.fromARGB(220, 12, 64, 101)),
                      ),
                    ],
                  ),
                ),
                const Divider(
                  endIndent: 20,
                  indent: 20,
                  color: Color.fromARGB(44, 19, 51, 56),
                ),
                InkWell(
                  onTap: () {
                    // Get.to(const ImportantPage());
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 18),
                        child: Icon(
                          FontAwesomeIcons.userDoctor,
                          size: screenWidth(20),
                          color: const Color.fromARGB(170, 0, 0, 0),
                        ),
                      ),
                      Text(
                        "DoctorID :",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontFamily: "roboto",
                          fontSize: screenWidth(27),
                          color: const Color.fromARGB(170, 0, 0, 0),
                        ),
                      ),
                      Text(
                        "  $doctor      ",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontFamily: "roboto",
                            fontSize: screenWidth(27),
                            color: const Color.fromARGB(220, 12, 64, 101)),
                      ),
                      Text(
                        "|   ServicesID  :",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: screenWidth(27),
                          fontFamily: "roboto",
                          color: const Color.fromARGB(170, 0, 0, 0),
                        ),
                      ),
                      Text(
                        "  $service",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: screenWidth(27),
                            fontFamily: "roboto",
                            color: const Color.fromARGB(220, 12, 64, 101)),
                      ),
                    ],
                  ),
                ),

                const Divider(
                  endIndent: 20,
                  indent: 20,
                  color: Color.fromARGB(44, 19, 51, 56),
                ),
                InkWell(
                  onTap: () {
                    // Get.to(const ImportantPage());
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 18),
                        child: Icon(
                          FontAwesomeIcons.squareCheck,
                          size: screenWidth(20),
                          color: const Color.fromARGB(170, 0, 0, 0),
                        ),
                      ),
                      Text(
                        "Is Confirmed  :",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontFamily: "roboto",
                          fontSize: screenWidth(27),
                          color: const Color.fromARGB(170, 0, 0, 0),
                        ),
                      ),
                      Text(
                        "  $confirmed",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontFamily: "roboto",
                            fontSize: screenWidth(27),
                            color: const Color.fromARGB(220, 12, 64, 101)),
                      ),
                      Padding(
                          padding: EdgeInsets.only(
                              left: screenWidth(20), top: screenWidth(200)),
                          child: Container(
                            width: screenWidth(20) + 1, // إضافة سماكة الإطار
                            height: screenWidth(20) + 1, // إضافة سماكة الإطار
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: confirmed == 'true'
                                    ? const Color.fromARGB(255, 27, 109, 31)
                                    : const Color.fromARGB(
                                        171, 231, 18, 3), // اللون الأخضر الغامق
                                width: 2.0, // سماكة الإطار
                              ),
                            ),
                            child: Center(
                              child: Icon(
                                Icons.circle,
                                size: screenWidth(27),
                                color: confirmed == 'true'
                                    ? const Color.fromARGB(171, 4, 118, 6)
                                    : const Color.fromARGB(171, 231, 18, 3),
                              ),
                            ),
                          )),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
