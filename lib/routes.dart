import 'package:Dentecs/views/BookNow/BooknowPage.dart';
import 'package:Dentecs/views/Home_view/Home_screen.dart';
import 'package:Dentecs/views/ProfilePage/ProfilePage.dart';
import 'package:Dentecs/views/ServicesPage/ServicesPage.dart';
import 'package:Dentecs/views/auth/Login_Page.dart';
import 'package:Dentecs/views/auth/Signup_page.dart';
import 'package:Dentecs/views/screen/language.dart';
import 'package:Dentecs/views/success/SuccessPage.dart';
import 'package:flutter/material.dart';
import 'package:Dentecs/core/constant/routes.dart';
import 'package:Dentecs/views/Contactus/contact_view.dart';
import 'package:Dentecs/views/Home_view/Home_view.dart';
import 'package:Dentecs/views/Organisation/organise_view.dart';
import 'package:Dentecs/views/Roles/role_view.dart';
import 'package:Dentecs/views/about_syndicate/about_syndicate_v.dart';
import 'package:Dentecs/views/main_views/main_view.dart';
import 'package:Dentecs/views/screen/onboarding.dart';

Map<String, Widget Function(BuildContext)> routes = {
  AppRoute.onBoarding: (context) => const OnBoarding(),
  AppRoute.homeView: (context) => const Home_view(),
  AppRoute.homescreen: (context) => const HomeScreen(),
  AppRoute.contactUs: (context) => Contact_view(),
  AppRoute.aboutSyn: (context) => About_syndicate(),
  AppRoute.language: (context) => const Language(),
  AppRoute.mainView: (context) => MainView(),
  AppRoute.organization: (context) => Organise_view(),
  AppRoute.role: (context) => Role_View(),
  AppRoute.login: (context) => const Login(),
  AppRoute.signup: (context) => SignUp(),
  AppRoute.book: (context) => const BookNow(),
  AppRoute.success: (context) => const Success(),
  AppRoute.profile: (context) => const ProfilePage(),
  AppRoute.services: (context) => const ServicesPage(),
};
