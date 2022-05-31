import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projects/constant/app_theme.dart';
import 'package:projects/screens/widgets/custom_button.dart';
import 'package:projects/screens/widgets/custom_text_filed.dart';
import 'package:projects/utils/size_config.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
          child: Container(
        width: SizeConfig.width * 100,
        height: SizeConfig.height*100,
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const SizedBox(height: 120),
            const Text(
              "Forgot Password",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 26),
            Text(
              "Enter your\nEmail",
              style: TextStyle(
                fontSize: 48,
                color: AppTheme.accentColor,
                fontWeight: FontWeight.w400,
              ),
            ),
            const SizedBox(height: 60),
            CommonTextField(
              controller: TextEditingController(),
              labelText: "Enter your registered Email",
            ),

            const SizedBox(height: 56),
            CustomButton(onPressed: () {
              Get.toNamed("email_verification");

            }, title: "Submit"),
          ],
        ),
      )),
    );
  }
}
