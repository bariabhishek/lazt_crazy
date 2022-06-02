import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:http/http.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
// import 'package:device_info_plus/device_info_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import '../screens/models/user_model.dart';

List bannersList = [];
ValueNotifier<ResponseData>? user = ValueNotifier(ResponseData());
class UserController extends ControllerMVC {
  Future<SharedPreferences> sharedPrefs = SharedPreferences.getInstance();
  // List<Category> categories = <Category>[];

  // UserController() {
  //   setValue();
  // }

  Future<bool> login(Map<String, String> body) async {
    bool returnValue = false;
    final prefs = await sharedPrefs;
    Map<String, dynamic> resp = Map();
    var request = http.MultipartRequest('POST', Uri.parse('https://beta.lzycrazy.com/api/login-api'));
    request.fields.addAll(body);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      resp = jsonDecode(await response.stream.bytesToString());
      if(resp['success']){
        LoginResponseModel responseModel = LoginResponseModel.fromJson(resp);
        returnValue = true;
        user!.value = responseModel.data!;
        print("<><><>"+user!.value.user['name'].toString());
        prefs.setString("userData", jsonEncode(responseModel.data!.toJson()));
        Get.offAndToNamed("main_page");
      }else{
        Fluttertoast.showToast(msg: resp['message'] + " !", textColor: Colors.red);
      }
    }
    else {
      Fluttertoast.showToast(msg: response.reasonPhrase! + " !", textColor: Colors.red);
      print(response.reasonPhrase);
    }

    return returnValue;
  }

  Future<bool> register(Map<String, String> body) async {
    bool returnValue = false;
    final prefs = await sharedPrefs;
    Map<String, dynamic> resp = Map();
    var request = http.MultipartRequest('POST', Uri.parse('https://beta.lzycrazy.com/api/user-registration'));
    request.fields.addAll(body);
    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      //returnValue = true;
      resp = jsonDecode(await response.stream.bytesToString());
      LoginResponseModel responseModel = LoginResponseModel.fromJson(resp);
      if(responseModel.success!){
        returnValue = true;
        user!.value = responseModel.data!;
        prefs.setString("userData", jsonEncode(responseModel.data));
        Get.offAndToNamed("main_page");
      }else{
        Fluttertoast.showToast(msg: responseModel.message + " !", );
      }
    }
    else {
      Fluttertoast.showToast(msg: response.reasonPhrase! + " !", textColor: Colors.red);
      print(response.reasonPhrase);
    }
    return returnValue;
  }

  // void setValue() async {
  //   DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
  //   AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
  //   if (user.value.token == null || user.value.token!.isEmpty)
  //     user.value.token = androidInfo.id;
  // }
}

