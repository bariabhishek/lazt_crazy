import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projects/constant/app_assets.dart';
import 'package:projects/controllers/splash_controller.dart';
import 'package:projects/utils/size_config.dart';

class SplashScreen extends StatelessWidget {
   SplashScreen({Key? key}) : super(key: key);

 var splash= Get.put(SplashController());

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Scaffold(
      body: Container(
        color: Colors.white,
        padding: const EdgeInsets.all(16),
        height: SizeConfig.height * 100,
        width: SizeConfig.width * 100,
        child: Center(
          child: Image.asset(AppAssets.appLogo),
        ),
      ),
    );
  }
}
