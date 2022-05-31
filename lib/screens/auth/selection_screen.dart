import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projects/constant/app_assets.dart';
import 'package:projects/screens/widgets/custom_button.dart';
import 'package:projects/screens/widgets/custom_outlined_button.dart';
import 'package:projects/utils/size_config.dart';

class SelectionScreen extends StatelessWidget {
  const SelectionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SizedBox(
          width: SizeConfig.width * 100,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: SizeConfig.height * 18,
                width: SizeConfig.width * 72,
                child: Image.asset(
                  AppAssets.appLogo,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 36),
              const Text(
                "By Typing create Account or Sign In,\nyou agree to our Terms.",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 76),
              CustomButton(
                onPressed: () {
                  Get.toNamed("login");
                },
                title: "Sign In",
              ),
              const SizedBox(height: 36),
              CustomOutlinedButton(
                onPressed: () {
                  Get.toNamed("register");
                },
                title: "Create Account",
              ),
              const SizedBox(height: 60),
            ],
          )),
    );
  }
}
