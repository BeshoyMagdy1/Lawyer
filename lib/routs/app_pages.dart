// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../model/profile/views/profile_view.dart';
import '../view/chat_room.dart';
import '../view/chat_screen.dart';
import '../view/login.dart';
import '../view/search_view.dart';



part 'app_routes.dart';

class AppPages {
  AppPages._();

  static final routes = [
    GetPage(
      name: Paths.LOGIN,
      page: () => Login(),
    ),
    GetPage(name: Paths.CHAT_ROOM, page: () => Chat_room_vieww()),
    GetPage(name: Paths.PROFILE, page: ()=>ProfileView()),
    GetPage(name: Paths.SEARCH, page:()=> SearchView()),
    GetPage(name: Paths.HOME, page: ()=>Chat_Screen())
  //  GetPage(name: Paths.ForgetPasword, page: () => ForgetPasword()),
   // GetPage(name: Paths.ForgetPasword, page: () => ForgetPasword()),

    // GetPage(name: Paths.CHAT_ROOM, page: () => ())
  ];
}
