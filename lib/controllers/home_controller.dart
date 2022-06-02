
import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:lzycrazy/models/feed_model.dart';
import 'package:lzycrazy/models/story_model.dart';

class HomeController extends GetxController {
  List<StoryModel>storyList =[];
  List<FeedModel>feedList =[];

    RxBool isDataLoading = false.obs;

  @override
  void onInit() {
    setData();
    super.onInit();
  }

  void setData()async {
      isDataLoading.value=true;
    var jsonData = await rootBundle.loadString("assets/story.json");
    var feedData = await rootBundle.loadString("assets/feeds.json");
    var dataResult = jsonDecode(jsonData);
    var feedResult = jsonDecode(feedData);
    storyList=List<StoryModel>.from(dataResult["data"].map((x) => StoryModel.fromJson(x)));
    feedList=List<FeedModel>.from(feedResult["data"].map((x) => FeedModel.fromJson(x)));
    isDataLoading.value=false;
  }




}