import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projects/constant/app_theme.dart';
import 'package:projects/screens/widgets/custom_button.dart';
import 'package:projects/screens/widgets/custom_text_filed.dart';
import 'package:projects/utils/size_config.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

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
              "Hello Again!",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 26),
            Text(
              "Welcome\nback",
              style: TextStyle(
                fontSize: 48,
                color: AppTheme.accentColor,
                fontWeight: FontWeight.w400,
              ),
            ),
            const SizedBox(height: 60),
            CommonTextField(
              controller: TextEditingController(),
              labelText: "Enter your email id",
            ),
            const SizedBox(height: 26),
            CommonTextField(
              controller: TextEditingController(),
              labelText: "Password",
              isPassword: true,
            ),
            const SizedBox(height: 56),
            CustomButton(onPressed: () {
              Get.toNamed("main_page");
            }, title: "Sign In"),
            const SizedBox(height: 36),
            Center(
              child: InkWell(
                onTap: (){
                  Get.toNamed("forgot_password");
                },
                child: Text(
                  "Forgot Password?",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey[500],
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
           const Spacer(),
            const SizedBox(height: 36),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "New User? ",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                Text(
                  "Sign up",
                  style: TextStyle(
                      decoration: TextDecoration.underline,
                      color: AppTheme.accentColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
              ],
            ),
            const SizedBox(height: 36),
          ],
        ),
      )),
    );
  }
}
