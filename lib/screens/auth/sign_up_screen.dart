import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projects/constant/app_theme.dart';
import 'package:projects/screens/widgets/custom_button.dart';
import 'package:projects/screens/widgets/custom_text_filed.dart';
import 'package:projects/utils/size_config.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({Key? key}) : super(key: key);

  RxString gender = "Male".obs;

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
          child: Container(
        width: SizeConfig.width * 100,
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const SizedBox(height: 56),
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Hello!",
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        "Sign Up",
                        style: TextStyle(
                          fontSize: 48,
                          color: AppTheme.accentColor,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
                cameraCircle()
              ],
            ),
            const SizedBox(height: 30),
            CommonTextField(
              controller: TextEditingController(),
              labelText: "First Name",
            ),
            const SizedBox(height: 20),
            CommonTextField(
              controller: TextEditingController(),
              labelText: "Last Name",
            ),
            const SizedBox(height: 20),
            CommonTextField(
              controller: TextEditingController(),
              labelText: "Email Id",
            ),
            const SizedBox(height: 20),
            CommonTextField(
              controller: TextEditingController(),
              labelText: "Phone number",
            ),
            const SizedBox(height: 20),
            CommonTextField(
              controller: TextEditingController(),
              labelText: "Password",
              isPassword: true,
            ),
            const Divider(
              height: 26,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "I'm",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: AppTheme.accentColor,
                  ),
                ),
                Text(
                  "(Select your gender)",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: AppTheme.accentColor,
                  ),
                ),
              ],
            ),
            genderSelection(),
            const Divider(
              height: 26,
            ),
            CustomButton(
                onPressed: () {
                  Get.toNamed("main_page");
                },
                title: "Sign Up"),
            const SizedBox(height: 36),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text(
                  "Already have an account? ",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                Text(
                  "Sign In",
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

  Widget cameraCircle() {
    return Container(
      padding: const EdgeInsets.all(4),
      child: Container(
        padding: const EdgeInsets.all(12),
        child: Container(
          child: const Icon(
            CupertinoIcons.camera,
            color: Colors.white,
            size: 40,
          ),
          decoration: ShapeDecoration(
            shape: const CircleBorder(),
            color: AppTheme.accentColor,
          ),
        ),
        decoration: const ShapeDecoration(
          shape: CircleBorder(),
          color: Color(0xffe14138),
        ),
      ),
      height: 110,
      width: 110,
      decoration: ShapeDecoration(
        shape: CircleBorder(
            side: BorderSide(color: AppTheme.accentColor, width: 1.5)),
        color: Colors.white,
      ),
    );
  }

  Widget genderSelection() {
    return Theme(
      data: Theme.of(Get.context!).copyWith(
        unselectedWidgetColor: AppTheme.accentColor,
      ),
      child: Obx(() => Column(
            children: <Widget>[
              RadioListTile(
                activeColor: AppTheme.accentColor,
                value: "Male",
                selectedTileColor: Colors.red,
                groupValue: gender.value,
                onChanged: (String? value) {
                  gender.value = value!;
                },
                title: const Text(
                  "Male",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
                controlAffinity: ListTileControlAffinity.trailing,
              ),
              RadioListTile(
                value: "Female",
                activeColor: AppTheme.accentColor,
                groupValue: gender.value,
                onChanged: (String? value) {
                  gender.value = value!;
                },
                title: const Text(
                  "Female",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
                controlAffinity: ListTileControlAffinity.trailing,
              ),
              RadioListTile(
                value: "Other",
                activeColor: AppTheme.accentColor,
                groupValue: gender.value,
                onChanged: (String? value) {
                  gender.value = value!;
                },
                title: const Text(
                  "Other",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
                controlAffinity: ListTileControlAffinity.trailing,
              ),
            ],
          )),
    );
  }
}
