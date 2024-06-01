// ignore_for_file: deprecated_member_use, file_names, unused_local_variable, depend_on_referenced_packages, must_be_immutable

import 'package:Dentecs/controller/AddPatientcontroller.dart';
import 'package:Dentecs/controller/AppointmentBookingController.dart';
import 'package:Dentecs/controller/Booknow_controller.dart';
import 'package:Dentecs/core/shared/utils.dart';
import 'package:Dentecs/data/datasource/static/database.dart';
import 'package:Dentecs/data/datasource/static/static.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class AppointmentBooking extends StatelessWidget {
  AppointmentBooking({super.key});

  ToDoDataBase db = ToDoDataBase();
  BooknowControllerImp control = Get.put(BooknowControllerImp());
  AddPatientController add = Get.put(AddPatientController());

  @override
  Widget build(BuildContext context) {
    AppointmentBookingController controller =
        Get.put(AppointmentBookingController());
    return Center(
      child: SizedBox(
        height: screenHeight(1.37),
        child: Stack(
          children: [
            Card(
              color: Colors.white,
              elevation: 2,
              child: patients.isEmpty
                  ? Center(
                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 70),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text("No patient Registered"),
                            MaterialButton(
                              color: const Color.fromARGB(169, 0, 0, 0),
                              onPressed: () {
                                control.pageController.previousPage(
                                  duration: const Duration(milliseconds: 500),
                                  curve: Curves.linear,
                                );
                              },
                              child: const Text(
                                "Click",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  : Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(screenWidth(30)),
                        color: const Color.fromARGB(122, 238, 238, 238),
                      ),
                      height: screenHeight(1.4),
                      width: screenWidth(1.12),
                      child: SingleChildScrollView(
                        child: GetBuilder<AppointmentBookingController>(
                          builder: (controller) {
                            return Padding(
                              padding: EdgeInsets.only(
                                left: screenWidth(28),
                                right: screenWidth(28),
                                top: screenWidth(44),
                              ),
                              child: Form(
                                key: controller.formState,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height: screenWidth(30),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                        bottom: screenWidth(29),
                                        top: screenWidth(70),
                                      ),
                                      child: TextFormField(
                                        onTap: () async {
                                          DateTime? selectedDate =
                                              await showDatePicker(
                                            context: context,
                                            initialDate: DateTime.now(),
                                            firstDate: DateTime(1900),
                                            lastDate: DateTime.now(),
                                          );
                                          if (selectedDate != null) {
                                            String formattedDate =
                                                "${selectedDate.year}-${selectedDate.month.toString().padLeft(2, '0')}-${selectedDate.day.toString().padLeft(2, '0')}";
                                            controller.birthDateController
                                                .text = formattedDate;
                                          }
                                        },
                                        keyboardType: TextInputType.none,
                                        readOnly: true,
                                        validator: (value) {
                                          if (value!.isEmpty) {
                                            return 'Please enter your birth date';
                                          }
                                          return null;
                                        },
                                        controller:
                                            controller.birthDateController,
                                        decoration: InputDecoration(
                                            label: const Text(
                                              "Date",
                                              style: TextStyle(
                                                  fontFamily: "roboto"),
                                            ),
                                            hintText: 'Choose date',
                                            filled: true,
                                            floatingLabelBehavior:
                                                FloatingLabelBehavior.always,
                                            contentPadding:
                                                EdgeInsets.symmetric(
                                                    vertical: screenHeight(55),
                                                    horizontal:
                                                        screenWidth(20)),
                                            suffixIcon: const Icon(
                                                Icons.calendar_month),
                                            border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(18),
                                                borderSide: const BorderSide(
                                                    color: Colors.white)),
                                            enabledBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              borderSide: const BorderSide(
                                                  color: Colors.black12,
                                                  width: 1),
                                            ),
                                            fillColor: Colors.white),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                        bottom: screenWidth(29),
                                        top: screenWidth(70),
                                      ),
                                      child: TextFormField(
                                        onTap: () async {
                                          controller.startDateTime(context);
                                          controller.update();
                                        },
                                        keyboardType: TextInputType.none,
                                        readOnly: true,
                                        decoration: InputDecoration(
                                            label: const Text(
                                              "Start Time",
                                              style: TextStyle(
                                                  fontFamily: "roboto"),
                                            ),
                                            hintText: DateFormat('HH:mm')
                                                .format(controller.startDate)
                                                .toString(),
                                            filled: true,
                                            floatingLabelBehavior:
                                                FloatingLabelBehavior.always,
                                            contentPadding:
                                                EdgeInsets.symmetric(
                                                    vertical: screenHeight(55),
                                                    horizontal:
                                                        screenWidth(20)),
                                            suffixIcon: const Icon(
                                                Icons.watch_later_outlined),
                                            border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(18),
                                                borderSide: const BorderSide(
                                                    color: Colors.white)),
                                            enabledBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              borderSide: const BorderSide(
                                                  color: Colors.black12,
                                                  width: 1),
                                            ),
                                            fillColor: Colors.white),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                        right: screenWidth(100),
                                        left: screenWidth(50),
                                        top: screenWidth(80),
                                        bottom: screenWidth(29),
                                      ),
                                      child: DropdownButtonFormField(
                                        value: patients[0][0].toString(),
                                        decoration: InputDecoration(
                                          fillColor: Colors.white,
                                          filled: true,
                                          contentPadding: EdgeInsets.symmetric(
                                              vertical: screenWidth(22),
                                              horizontal: screenWidth(30)),
                                          labelText: 'Patients',
                                          border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                        ),
                                        items: patients
                                            .map<DropdownMenuItem<String>>(
                                          (patient) {
                                            return DropdownMenuItem<String>(
                                              value: patient[0].toString(),
                                              child:
                                                  Text(patient[1].toString()),
                                            );
                                          },
                                        ).toList(),
                                        onChanged: (value) {
                                          controller.selectedPatient =
                                              value.toString();
                                          controller.update();
                                        },
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                        right: screenWidth(100),
                                        left: screenWidth(50),
                                        top: screenWidth(70),
                                        bottom: screenWidth(29),
                                      ),
                                      child: Expanded(
                                        child: DropdownButtonFormField(
                                          value: controller.selectedServices,
                                          decoration: InputDecoration(
                                            fillColor: Colors.white,
                                            filled: true,
                                            contentPadding:
                                                EdgeInsets.symmetric(
                                                    vertical: screenWidth(22),
                                                    horizontal:
                                                        screenWidth(30)),
                                            labelText: 'Services',
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                          ),
                                          items: controller.ServicesList.map<
                                              DropdownMenuItem<String>>(
                                            (service) {
                                              return DropdownMenuItem<String>(
                                                value: service['id']
                                                    .toString(), // استخدام "username"
                                                child: Text(service[
                                                    'title']), // استخدام "username"
                                              );
                                            },
                                          ).toList(),
                                          onChanged: (value) {
                                            controller.selectedServices =
                                                value.toString();
                                            controller.update();
                                          },
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                        right: screenWidth(100),
                                        left: screenWidth(50),
                                        top: screenWidth(70),
                                        bottom: screenWidth(29),
                                      ),
                                      child: DropdownButtonFormField(
                                        value: controller.selectedDoctor,
                                        decoration: InputDecoration(
                                          fillColor: Colors.white,
                                          filled: true,
                                          contentPadding: EdgeInsets.symmetric(
                                              vertical: screenWidth(22),
                                              horizontal: screenWidth(30)),
                                          labelText: 'Doctors',
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                        ),
                                        items: controller.DoctorList.map<
                                            DropdownMenuItem<String>>(
                                          (doctor) {
                                            return DropdownMenuItem<String>(
                                              value: doctor['id'].toString(),
                                              child: Text(doctor['username']),
                                            );
                                          },
                                        ).toList(),
                                        onChanged: (value) {
                                          controller.selectedDoctor =
                                              value.toString();
                                          controller.update();
                                        },
                                      ),
                                    ),
                                    Padding(
                                        padding: EdgeInsets.only(
                                            left: screenWidth(5)),
                                        child: controller.vis
                                            ? Container(
                                                margin: const EdgeInsets.only(
                                                    top: 10, left: 23),
                                                child: MaterialButton(
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10)),
                                                  padding: const EdgeInsets
                                                      .symmetric(vertical: 10),
                                                  onPressed: () {
                                                    controller.AddAppointment(
                                                        context);
                                                    control.reset();
                                                    add.resetFields();
                                                  },
                                                  color: controller.vis
                                                      ? const Color.fromARGB(
                                                          249, 97, 122, 152)
                                                      : const Color.fromARGB(
                                                          227, 109, 125, 144),
                                                  textColor: Colors.white,
                                                  child: !controller.isloading
                                                      ? const Text('Submit',
                                                          style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              fontSize: 16))
                                                      : const CircularProgressIndicator(
                                                          strokeWidth: 3,
                                                          color: Color.fromARGB(
                                                              228, 0, 0, 0)),
                                                ),
                                              )
                                            : const SizedBox()),
                                    const SizedBox(height: 20),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      )),
            ),
          ],
        ),
      ),
    );
  }
}
