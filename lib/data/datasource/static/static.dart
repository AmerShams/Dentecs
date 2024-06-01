// ignore_for_file: non_constant_identifier_names

import 'package:Dentecs/views/patients/AddPatients.dart';
import 'package:Dentecs/views/patients/Appointment%20Booking.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:Dentecs/core/constant/image_asset.dart';
import 'package:Dentecs/data/model/about_model.dart';
import 'package:Dentecs/data/model/drawer_model.dart';
import 'package:Dentecs/data/model/onboarding_model.dart';
import 'package:Dentecs/data/model/organise_model.dart';
import 'package:Dentecs/data/model/role_model.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

List<OnBooardingModel> onBoardingList = [
  OnBooardingModel(
      title: "أهدافنا",
      body:
          "تشجيع المبادرات الخلاقة والمواهب الهندسية والكفاءات بين المهندسين ودعم الدراسات العليا.",
      image: AppImageAsset.onBoardingImageOne),
  OnBooardingModel(
      title: "الرؤى والمهام",
      body:
          "تشجيع البحث العلمي الهندسي، وحماية حقوق المؤلفين والمخترعين من العاملين في حقل الهندسة وفق القوانين والانظمة النافذة.",
      image: AppImageAsset.onBoardingImageTwo),
  OnBooardingModel(
      title: "أهدافنا",
      body:
          "إقامة المؤتمرات والندوات والمحاضرات والاشتراك بالمؤتمرات والندوات والمحاضرات الهندسية والعلمية داخل الجمهورية العربية السورية وخارجها.",
      image: AppImageAsset.onBoardingImageThree),
];

List<OrganiseModel> organiseList = [
  OrganiseModel(
    title: "org_1".tr,
    body:
        "Deputy Sheriff Profession: Reasons for ChoosingWe live in uncertain times. Gone are the days when one could walk the streets any time of the day or night with the confidence that no harm would be put upon your person or belongings. These days, we look at each other with anxiety because of the continuing rise...",
  ),
  OrganiseModel(
    title: "org_2".tr,
    body:
        "Gone are the days when one could walk the streets any time of the day or night with the confidence that no harm would be put upon your person or belongings. These days, we look at each other with anxiety because of the continuing riseDeputy Sheriff Profession: Reasons for ChoosingWe live in uncertain times. Gone are the days when one could walk the streets any time of the day or night with the confidence that no harm would be put upon your person or belongings. These days, we look at each other with anxiety because of the continuing rise...",
  ),
  OrganiseModel(
    title: "org_3".tr,
    body:
        "Deputy Sheriff Profession: Reasons for ChoosingWe live in uncertain times. Gone are the days when one could walk the streets any time of the day or night with the confidence that no harm would be put upon your person or belongings. These days, we look at each other with anxiety because of the continuing rise...",
  ),
  OrganiseModel(
    title: "org_4".tr,
    body:
        "Gone are the days when one could walk the streets any time of the day or night with the confidence that no harm would be put upon your person or belongings. These days, we look at each other with anxiety because of the continuing rise Deputy Sheriff Profession: Reasons for ChoosingWe live in uncertain times. Gone are the days when one could walk the streets any time of the day or night with the confidence that no harm would be put upon your person or belongings. These days, we look at each other with anxiety because of the continuing rise...",
  ),
  OrganiseModel(
    title: "org_5".tr,
    body:
        "Deputy Sheriff Profession: Reasons for ChoosingWe live in uncertain times. Gone are the days when one could walk the streets any time of the day or night with the confidence that no harm would be put upon your person or belongings. These days, we look at each other with anxiety because of the continuing rise...",
  ),
];

List<RoleModel> roleList = [
  RoleModel(
    title: "org_1".tr,
    body:
        "Deputy Sheriff Profession: Reasons for ChoosingWe live in uncertain times. Gone are the days when one could walk the streets any time of the day or night with the confidence that no harm would be put upon your person or belongings. These days, we look at each other with anxiety because of the continuing rise...",
  ),
  RoleModel(
    title: "org_2".tr,
    body:
        "Gone are the days when one could walk the streets any time of the day or night with the confidence that no harm would be put upon your person or belongings. These days, we look at each other with anxiety because of the continuing riseDeputy Sheriff Profession: Reasons for ChoosingWe live in uncertain times. Gone are the days when one could walk the streets any time of the day or night with the confidence that no harm would be put upon your person or belongings. These days, we look at each other with anxiety because of the continuing rise...",
  ),
  RoleModel(
    title: "org_3".tr,
    body:
        "Deputy Sheriff Profession: Reasons for ChoosingWe live in uncertain times. Gone are the days when one could walk the streets any time of the day or night with the confidence that no harm would be put upon your person or belongings. These days, we look at each other with anxiety because of the continuing rise...",
  ),
  RoleModel(
    title: "org_4".tr,
    body:
        "Gone are the days when one could walk the streets any time of the day or night with the confidence that no harm would be put upon your person or belongings. These days, we look at each other with anxiety because of the continuing rise Deputy Sheriff Profession: Reasons for ChoosingWe live in uncertain times. Gone are the days when one could walk the streets any time of the day or night with the confidence that no harm would be put upon your person or belongings. These days, we look at each other with anxiety because of the continuing rise...",
  ),
  RoleModel(
    title: "org_5".tr,
    body:
        "Deputy Sheriff Profession: Reasons for ChoosingWe live in uncertain times. Gone are the days when one could walk the streets any time of the day or night with the confidence that no harm would be put upon your person or belongings. These days, we look at each other with anxiety because of the continuing rise...",
  ),
];

List<AboutModel> aboutModel = [
  AboutModel(
    title: "about_1".tr,
    body:
        "Deputy Sheriff Profession: Reasons for ChoosingWe live in uncertain times. Gone are the days when one could walk the streets any time of the day or night with the confidence that no harm would be put upon your person or belongings. These days, we look at each other with anxiety because of the continuing rise...",
  ),
  AboutModel(
    title: "about_2".tr,
    body:
        "Gone are the days when one could walk the streets any time of the day or night with the confidence that no harm would be put upon your person or belongings. These days, we look at each other with anxiety because of the continuing riseDeputy Sheriff Profession: Reasons for ChoosingWe live in uncertain times. Gone are the days when one could walk the streets any time of the day or night with the confidence that no harm would be put upon your person or belongings. These days, we look at each other with anxiety because of the continuing rise...",
  ),
  AboutModel(
    title: "about_3".tr,
    body:
        "Deputy Sheriff Profession: Reasons for ChoosingWe live in uncertain times. Gone are the days when one could walk the streets any time of the day or night with the confidence that no harm would be put upon your person or belongings. These days, we look at each other with anxiety because of the continuing rise...",
  ),
];

List<Widget> PagesViews = [AddPatients(), AppointmentBooking()];
List<DrawerModel> drawerModel = [
  DrawerModel(
    title: "key_home".tr,
  ),
  DrawerModel(
    title: "key_ourservices".tr,
  ),
  DrawerModel(
    title: "key_ourshams_v1s".tr,
  ),
  DrawerModel(
    title: "key_contactus".tr,
  ),
  DrawerModel(
    title: "key_ourdoctors".tr,
  ),
  DrawerModel(
    title: "Administrator",
  ),
  DrawerModel(
    title: "key_ourpremiumdevices".tr,
  ),
];
List patients = [];
List booked = [];
List allbooked = [];
List isAdmin = [];
List notifications = [];

List categories1 = ['All Patients', 'Booked'];
List categoryIcon = [
  const Icon(Icons.person_2_rounded,
      size: 29, color: Color.fromARGB(181, 255, 255, 255)),
  const Icon(Icons.edit_sharp,
      size: 28, color: Color.fromARGB(181, 255, 255, 255)),
  const Icon(FontAwesomeIcons.userCheck,
      size: 25, color: Color.fromARGB(181, 255, 255, 255)),
  Image.asset('assets/images/pngs/handbag.png',
      scale: 18, color: const Color.fromARGB(181, 255, 255, 255)),
  const Icon(FontAwesomeIcons.odnoklassniki,
      size: 28, color: Color.fromARGB(181, 255, 255, 255)),
];

List<List<Color>> grad = [
  [
    const Color.fromARGB(187, 117, 165, 220),
    const Color.fromARGB(189, 51, 109, 176),
    const Color.fromARGB(200, 9, 65, 130)
  ],
  [
    const Color.fromARGB(93, 140, 74, 176),
    const Color.fromARGB(188, 71, 49, 116),
    const Color.fromARGB(187, 104, 73, 167),
  ],
  [
    const Color.fromARGB(187, 61, 188, 139),
    const Color.fromARGB(185, 2, 90, 90),
    const Color.fromARGB(198, 2, 64, 110)
  ],
  [
    const Color.fromARGB(161, 221, 145, 97),
    const Color.fromARGB(186, 169, 68, 9),
    const Color.fromARGB(200, 136, 44, 1),
  ],
];
