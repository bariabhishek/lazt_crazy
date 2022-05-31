import 'dart:async';

import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class NoInternet {
  static late StreamSubscription<ConnectivityResult> _connectivitySubscription;

  static ConnectivityResult? connectivityResult;

  static final Connectivity _connectivity = Connectivity();

  static iniNoInternet() async {
    await initConnectivity();
    _connectivitySubscription = _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);

  }

  static Future<void> initConnectivity() async {
    try {
      connectivityResult = await _connectivity.checkConnectivity();
    } on PlatformException catch (e) {
      //print(e.toString());
    }

    return _updateConnectionStatus(connectivityResult!);
  }

  static bool checkInternet({required dynamic onPressed}) {
    if (connectivityResult == ConnectivityResult.none) {
      ScaffoldMessenger.of(Get.context!).clearMaterialBanners();
      ScaffoldMessenger.of(Get.context!).showMaterialBanner(
        MaterialBanner(
          padding: const EdgeInsets.all(20),
          leadingPadding: const EdgeInsets.only(top: 32),
          content: const Padding(
            padding: EdgeInsets.only(top: 32, left: 16),
            child: Text(
              'No Internet Connection',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w600),
            ),
          ),
          leading: const Icon(
            Icons.signal_wifi_off_outlined,
            color: Colors.white,
          ),
          backgroundColor: Colors.red,
          actions: <Widget>[
            TextButton(
              onPressed: () {
                ScaffoldMessenger.of(Get.context!).hideCurrentMaterialBanner();
                onPressed();
              },
              child: const Text(
                'Retry',
                style: TextStyle(color: Colors.white),
              ),
            ),
            TextButton(
              onPressed: () {
                ScaffoldMessenger.of(Get.context!).hideCurrentMaterialBanner();
              },
              child: const Text(
                'Dismiss',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      );
      return false;
    } else {
      ScaffoldMessenger.of(Get.context!).hideCurrentMaterialBanner();
      return true;
    }
  }

  static Future<void> _updateConnectionStatus(ConnectivityResult result) async {
    switch (result) {
      case ConnectivityResult.wifi:
      case ConnectivityResult.mobile:
      case ConnectivityResult.none:
        connectivityResult = result;
        break;
    }
  }
}

