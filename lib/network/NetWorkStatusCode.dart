import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';



class NetWorkStatusCode{
 static getDioException(int? status, String? msg) {

    switch (status) {
      case 400:
        Get.snackbar("Alert", msg.toString());
        break;
      case 401:
        Get.snackbar("Alert", msg.toString());
        break;
      case 403:
        Get.snackbar("Alert", msg.toString());
        break;
      case 404:
        Get.snackbar("Alert", msg.toString());
        break;
      case 409:
        Get.snackbar("Alert", msg.toString());
        break;
      case 408:
        Get.snackbar("Alert", msg.toString());
        break;
      case 500:
        Get.snackbar("Alert", msg.toString());
        break;
      case 503:
        Get.snackbar("Alert", msg.toString());
        break;
      case 502:
           // Get.offAll(()=>const BadGateway());
        break;
      default:
        // Get.offAll(()=>const BadGateway());
        break;
    }
  }
}
