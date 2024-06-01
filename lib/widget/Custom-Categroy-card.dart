// ignore_for_file: must_be_immutable, file_names

import 'package:Dentecs/controller/ServicesController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomCategoryCard extends StatelessWidget {
  final String title;
  final String count;
  final Widget iconcard;
  final List<Color> colors;
  CustomCategoryCard(
      {super.key,
      required this.title,
      required this.colors,
      required this.iconcard,
      required this.count});

  ServicesController controller = Get.put(ServicesController());

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Container(
        height: 130,
        width: 130,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: colors,
          ),
          borderRadius: BorderRadius.circular(15.0), // حواف دائرية للخلفية
        ),
        child: Padding(
          padding:
              const EdgeInsets.only(top: 20, left: 20, right: 20), // هامش داخلي
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              iconcard,
              const SizedBox(height: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        color: Colors.white), // النص
                  ),
                  GetBuilder<ServicesController>(builder: (controller) {
                    return Text(
                      '$count patient',
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                          color: Color.fromARGB(248, 191, 189, 189)), // النص
                    );
                  }),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
