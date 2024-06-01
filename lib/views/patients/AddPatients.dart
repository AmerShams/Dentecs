// ignore_for_file: deprecated_member_use, file_names, unused_local_variable, depend_on_referenced_packages, must_be_immutable

import 'package:Dentecs/controller/AddPatientcontroller.dart';
import 'package:Dentecs/core/constant/color.dart';
import 'package:Dentecs/core/constant/valid.dart';
import 'package:Dentecs/core/shared/utils.dart';
import 'package:Dentecs/data/datasource/static/database.dart';

import 'package:Dentecs/widget/booknow/bookNowTextForm.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class AddPatients extends StatelessWidget {
  AddPatients({super.key});

  ToDoDataBase db = ToDoDataBase();

  @override
  Widget build(BuildContext context) {
    AddPatientController controller = Get.put(AddPatientController());
    return Center(
      child: SizedBox(
        height: screenHeight(1.37),
        child: Stack(
          children: [
            Card(
              elevation: 4,
              color: Colors.white,
              child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(screenWidth(30)),
                    color: const Color.fromARGB(122, 238, 238, 238),
                  ),
                  height: screenHeight(1.4),
                  width: screenWidth(1.12),
                  child: SingleChildScrollView(
                    child: GetBuilder<AddPatientController>(
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
                              children: [
                                SizedBox(
                                  height: screenHeight(40),
                                ),
                                BookForm(
                                  hinttext: 'Enter first name',
                                  iconData: Icons.person,
                                  mycontroller: controller.firstNameController,
                                  valid: (val) {
                                    return vaildInput(val, 2, 50);
                                  },
                                  isNumber: false,
                                ),
                                BookForm(
                                  hinttext: 'Enter last name',
                                  iconData: Icons.person_2,
                                  mycontroller: controller.lastNameController,
                                  valid: (val) {
                                    return vaildInput(val, 2, 50);
                                  },
                                  isNumber: false,
                                ),
                                BookForm(
                                  hinttext: 'Enter mobile number',
                                  iconData: FontAwesomeIcons.mobileScreen,
                                  mycontroller: controller.mobileController,
                                  valid: (val) {
                                    return vaildInput(val, 2, 50);
                                  },
                                  isNumber: true,
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      vertical: screenWidth(29)),
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
                                        // تنسيق التاريخ المحدد حسب الاحتياج
                                        String formattedDate =
                                            "${selectedDate.year}-${selectedDate.month.toString().padLeft(2, '0')}-${selectedDate.day.toString().padLeft(2, '0')}";
                                        controller.birthDateController.text =
                                            formattedDate;
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
                                    controller: controller.birthDateController,
                                    decoration: InputDecoration(
                                        hintText: 'Choose birth date',
                                        hintStyle: const TextStyle(
                                            fontSize: 14, color: AppColor.grey),
                                        filled: true,
                                        floatingLabelBehavior:
                                            FloatingLabelBehavior.always,
                                        contentPadding: EdgeInsets.symmetric(
                                            vertical: screenHeight(55),
                                            horizontal: screenWidth(20)),
                                        suffixIcon:
                                            const Icon(Icons.calendar_month),
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(18),
                                            borderSide: const BorderSide(
                                                color: Colors.white)),
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          borderSide: const BorderSide(
                                              color: Colors.black12, width: 1),
                                        ),
                                        fillColor: Colors.white),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      EdgeInsets.only(left: screenWidth(12)),
                                  child: Row(
                                    children: [
                                      Text(
                                        "Male",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontSize: screenWidth(22),
                                            fontWeight: FontWeight.bold,
                                            color: !controller.isMale
                                                ? const Color.fromARGB(
                                                    123, 0, 0, 0)
                                                : const Color.fromARGB(
                                                    255, 0, 0, 0),
                                            fontFamily: 'cairo'),
                                      ),
                                      Expanded(
                                        child: RadioListTile<bool>(
                                          activeColor: const Color.fromARGB(
                                              193, 9, 9, 9),
                                          contentPadding:
                                              const EdgeInsets.symmetric(
                                                  horizontal: 5),
                                          value: true,
                                          groupValue: controller.isMale,
                                          onChanged: (value) {
                                            controller.changegender(value!);
                                          },
                                        ),
                                      ),
                                      Text(
                                        "Female",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontSize: screenWidth(22),
                                            fontWeight: FontWeight.bold,
                                            color: controller.isMale
                                                ? const Color.fromARGB(
                                                    123, 0, 0, 0)
                                                : const Color.fromARGB(
                                                    255, 0, 0, 0),
                                            fontFamily: 'cairo'),
                                      ),
                                      Expanded(
                                        child: RadioListTile<bool>(
                                          activeColor: const Color.fromARGB(
                                              210, 9, 9, 9),
                                          contentPadding:
                                              const EdgeInsets.symmetric(
                                                  horizontal: 5),
                                          value: false,
                                          groupValue: controller.isMale,
                                          onChanged: (value) {
                                            controller.changegender(value!);
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: screenWidth(5),
                                  ),
                                  child: controller.vis
                                      ? Container(
                                          margin:
                                              const EdgeInsets.only(top: 10),
                                          child: MaterialButton(
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        screenWidth(30))),
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 10),
                                            onPressed: () {
                                              controller.AddPatient(context);
                                            },
                                            color: controller.vis
                                                ? const Color.fromARGB(
                                                    249, 97, 122, 152)
                                                : const Color.fromARGB(
                                                    249, 111, 127, 147),
                                            textColor: Colors.white,
                                            child: !controller.isloading
                                                ? const Text('Save',
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 16))
                                                : const CircularProgressIndicator(
                                                    strokeWidth: 3,
                                                    color: Color.fromARGB(
                                                        228, 0, 0, 0)),
                                          ),
                                        )
                                      : Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 4),
                                          child: Container(
                                            width: 60,
                                            height: 60,
                                            decoration: BoxDecoration(
                                                color: const Color.fromARGB(
                                                    72, 136, 202, 136),
                                                borderRadius:
                                                    BorderRadius.circular(30)),
                                            child: const Icon(
                                              Icons.check,
                                              color:
                                                  Color.fromARGB(255, 0, 81, 5),
                                              size: 50,
                                            ),
                                          ),
                                        ),
                                ),
                                const SizedBox(height: 20),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  )),
            ),

            // Positioned(
            // top: screenHeight(17),
            // left: screenHeight(18.5),
            //   child: Center(
            //       child: Container(
            //     decoration: BoxDecoration(
            //       borderRadius: BorderRadius.circular(15),
            //       gradient: const LinearGradient(
            //         begin: Alignment.bottomCenter,
            //         end: Alignment.topCenter,
            //         colors: [
            //           Color.fromARGB(255, 255, 255, 255),
            //           Color.fromARGB(255, 133, 125, 114),
            //         ],
            //       ),
            //     ),
            //     height: screenHeight(13.5),
            //     width: screenWidth(1.3),
            //     child: const Center(
            //         child: Text(
            //       "Patient Details",
            //       style: TextStyle(
            //           color: Color.fromARGB(168, 0, 0, 0),
            //           fontSize: 18,
            //           fontWeight: FontWeight.bold,
            //           fontFamily: 'Cairo'),
            //     )),
            //   )),
            // ),
          ],
        ),
      ),
    );
  }
}
