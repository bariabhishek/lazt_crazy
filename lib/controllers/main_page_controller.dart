

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lzycrazy/screens/activity/activity_screen.dart';
import 'package:lzycrazy/screens/home/home_screen.dart';
import 'package:lzycrazy/screens/profile/user_profile.dart';
import 'package:lzycrazy/screens/reel/reels_screen.dart';
import 'package:lzycrazy/screens/store/store_screen.dart';

class MainPageController extends GetxController{


  RxInt _selectedScreenIndex = 0.obs;

  Widget get screen => screens[_selectedScreenIndex.value];

  set selectedIndex(index) => _selectedScreenIndex.value=index;
  get selectedIndex => _selectedScreenIndex.value;

  List<Widget> screens=[
    HomeScreen(),
    ReelsScreen(),
    const StoreScreen(),
     ActivityScreen(),
     UserProfile(),
  ];

}