import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:lzycrazy/models/feed_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/reel_model.dart';

class ReelController extends GetxController {
  Future<SharedPreferences> sharedPrefs = SharedPreferences.getInstance();

  List<ReelModel>reelList =[];

  RxBool isDataLoading = false.obs;

  @override
  void onInit() {
    setData();
    super.onInit();
  }

  void setData()async {
    isDataLoading.value=true;
    await getMyReels();
    isDataLoading.value=false;
  }

  getMyReels()async{
    final prefs = await sharedPrefs;
    var userData = jsonDecode(prefs.getString('userData')??"");
    var headers = {
      'Authorization': 'Bearer ${userData['token']}'};
    var request = http.MultipartRequest('POST', Uri.parse('https://beta.lzycrazy.com/api/get-my-reels'));
    request.fields.addAll({
      'user_id': userData['user']['id'].toString()
    });
    print(headers);
    print(userData['user']['id'].toString());
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      reelList=List<ReelModel>.from(jsonDecode(await response.stream.bytesToString())['data']
          .map((x) => ReelModel.fromJson(x)));
      //print(await response.stream.bytesToString());
      print(reelList.length);
    }
    else {
      print(response.reasonPhrase);
    }

  }
}