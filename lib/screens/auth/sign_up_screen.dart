import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_progress_hud/flutter_progress_hud.dart';
import 'package:get/get.dart';
import 'package:lzycrazy/constant/app_theme.dart';
import 'package:lzycrazy/controllers/user_controller.dart';
import 'package:lzycrazy/screens/widgets/custom_button.dart';
import 'package:lzycrazy/screens/widgets/custom_text_filed.dart';
import 'package:lzycrazy/utils/size_config.dart';

class SignUpScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return SignUpScreenState();
  }

}

class SignUpScreenState extends State<SignUpScreen> {
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final dobController = TextEditingController();
  final phoneController = TextEditingController();
  final cityController = TextEditingController();
  RxString gender = "male".obs;
  DateTime selectedDate = DateTime.now();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  _validate(){
    return _formKey.currentState!.validate();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: ProgressHUD(
        child: Builder(
          builder: (context) => SingleChildScrollView(
              child: Container(
                width: SizeConfig.width * 100,
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Form(
                  key: _formKey,
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
                        controller: firstNameController,
                        labelText: "First Name",
                        onValidate: (val){
                          if(val!.isEmpty){
                            return "Please enter first name !";
                          }
                        },
                      ),
                      const SizedBox(height: 20),
                      CommonTextField(
                        controller: lastNameController,
                        labelText: "Last Name",
                        onValidate: (val){
                          if(val!.isEmpty){
                            return "Please enter last name !";
                          }
                        },
                      ),
                      const SizedBox(height: 20),
                      CommonTextField(
                        controller: emailController,
                        labelText: "Email Id",
                        onValidate: (val){
                          if(val!.isEmpty){
                            return "Please enter email id !";
                          }
                        },
                      ),
                      const SizedBox(height: 20),
                      CommonTextField(
                        controller: dobController,
                        keyboardType: TextInputType.none,
                        labelText: "Date of Birth",
                        onValidate: (val){
                          if(val!.isEmpty){
                            return "Please enter date of birth !";
                          }
                        },
                        onTap: (){
                          _selectDate(context);
                        },
                      ),
                      const SizedBox(height: 20),
                      CommonTextField(
                        controller: cityController,
                        labelText: "City",
                        onValidate: (val){
                          if(val!.isEmpty){
                            return "Please enter city !";
                          }
                        },
                      ),
                      const SizedBox(height: 20),
                      CommonTextField(
                        controller: passwordController,
                        labelText: "Password",
                        isPassword: true,
                        onValidate: (val){
                          if(val!.isEmpty){
                            return "Please enter password !";
                          }
                        },
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
                            if(_validate()){
                              final progress = ProgressHUD.of(context);
                              progress?.show();
                              UserController().register({
                                "name": firstNameController.text + " " + lastNameController.text,
                                "email": emailController.text,
                                "password": passwordController.text,
                                "dob": dobController.text,
                                "gender": gender.value,
                                "city": cityController.text
                              }).whenComplete((){
                                progress?.dismiss();
                              });
                            }
                            //Get.toNamed("main_page");
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
                          InkWell(
                            onTap: (){
                              Get.offAndToNamed("login");
                            },
                            child: Text(
                              "Sign In",
                              style: TextStyle(
                                  decoration: TextDecoration.underline,
                                  color: AppTheme.accentColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 36),
                    ],
                  ),
                ),
              )),
        ),
      ),
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

  _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate, // Refer step 1
      firstDate: DateTime(1925),
      lastDate: DateTime.now(),
      initialEntryMode: DatePickerEntryMode.inputOnly,
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        dobController.text = selectedDate.toString().split(' ')[0];
        print(selectedDate.toString());
      });
    }
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
                value: "male",
                //selectedTileColor: Colors.red,
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
                value: "female",
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
                value: "other",
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
