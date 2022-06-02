


import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:lzycrazy/models/activity_model.dart';
import 'package:lzycrazy/models/feed_model.dart';
import 'package:lzycrazy/models/story_model.dart';

class ActivityController extends GetxController {
  List<ActivityModel>activityList =[];


    RxBool isDataLoading = false.obs;

  @override
  void onInit() {
    setData();
    super.onInit();
  }

  void setData()async {
      isDataLoading.value=true;
    var jsonData = await rootBundle.loadString("assets/activity.json");
    var dataResult = jsonDecode(jsonData);
    activityList=List<ActivityModel>.from(dataResult["data"].map((x) => ActivityModel.fromJson(x)));

    isDataLoading.value=false;
  }




}