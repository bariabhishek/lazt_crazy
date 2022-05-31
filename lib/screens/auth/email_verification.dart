import 'package:flutter/material.dart';
import 'package:projects/constant/app_theme.dart';
import 'package:projects/screens/widgets/custom_button.dart';
import 'package:projects/screens/widgets/custom_text_filed.dart';
import 'package:projects/utils/size_config.dart';

class EmailVerificationScreen extends StatelessWidget {
  const EmailVerificationScreen({Key? key}) : super(key: key);

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
              "Email Verification",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 26),
            Text(
              "Please enter\n4 digit code",
              style: TextStyle(
                fontSize: 48,
                color: AppTheme.accentColor,
                fontWeight: FontWeight.w400,
              ),
            ),
            const SizedBox(height: 60),
            CommonTextField(
              controller: TextEditingController(),
              labelText: " 0 0 0 0 ",
            ),
            const SizedBox(height: 56),
            CustomButton(onPressed: () {}, title: "Sign In"),
            const SizedBox(height: 36),
            Center(
              child: Text(
                "Sent to registered Email",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey[500],
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
           const Spacer(),
            const SizedBox(height: 36),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "Didn't receive the code?",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                Text(
                  "Resend",
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
