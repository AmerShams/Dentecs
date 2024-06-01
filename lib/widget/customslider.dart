import 'package:carousel_slider/carousel_slider.dart';
import 'package:Dentecs/core/shared/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:Dentecs/controller/Home_controller.dart';

// ignore: must_be_immutable
class CustomSlider extends StatelessWidget {
  CustomSlider({super.key});
  Home_Controller con = Get.put(Home_Controller());

  @override
  Widget build(BuildContext context) {
    return Container(
      // clipBehavior: Clip.hardEdge,
      margin: EdgeInsets.symmetric(
          horizontal: screenWidth(1000), vertical: screenHeight(40)),
      // decoration: BoxDecoration(borderRadius: BorderRadius.circular(30)),
      child: CarouselSlider.builder(
        itemCount: 4,
        itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) =>
            Container(
          height: screenHeight(3),
          width: screenWidth(1),
          margin: EdgeInsets.symmetric(horizontal: screenWidth(20)),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(screenHeight(20)),
              image: DecorationImage(
                image: AssetImage(
                  con.imgslider[itemIndex],
                ),
                fit: BoxFit.cover,
              )),
        ),
        options: CarouselOptions(
          height: screenHeight(4.4),
          aspectRatio: 16 / 9,
          viewportFraction: 1,
          initialPage: 0,
          enableInfiniteScroll: true,
          reverse: false,
          autoPlay: true,
          autoPlayInterval: const Duration(seconds: 2),
          autoPlayAnimationDuration: const Duration(milliseconds: 5000),
          autoPlayCurve: Curves.linear,
          onPageChanged: (index, reason) {},
          scrollDirection: Axis.horizontal,
        ),
      ),
    );
  }
}
