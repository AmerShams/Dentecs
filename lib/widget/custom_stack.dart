import 'package:flutter/material.dart';
import 'package:Dentecs/core/shared/utils.dart';

class CustomStack extends StatelessWidget {
  final String title;
  final String body;

  const CustomStack({super.key, required this.title, required this.body});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: screenHeight(1.45),
      child: Stack(
        children: [
          Center(
              child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(screenWidth(30)),
              color: Colors.grey[400],
            ),
            height: screenHeight(1.8),
            width: screenWidth(1.12),
            child: Padding(
                padding: EdgeInsets.all(screenWidth(18.5)),
                child: ListView(
                  children: [
                    SizedBox(
                      height: screenHeight(30),
                    ),
                    Text(body),
                  ],
                )),
          )),
          Positioned(
            top: screenHeight(50),
            left: screenHeight(18.5),
            child: Center(
                child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.amber,
              ),
              height: screenHeight(13.5),
              width: screenWidth(1.3),
              child: Center(
                  child: Text(
                title,
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              )),
            )),
          ),
        ],
      ),
    );
  }
}
