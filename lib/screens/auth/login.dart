import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lzycrazy/constant/app_theme.dart';
import 'package:lzycrazy/controllers/user_controller.dart';
import 'package:lzycrazy/screens/widgets/custom_button.dart';
import 'package:lzycrazy/screens/widgets/custom_text_filed.dart';
import 'package:lzycrazy/utils/size_config.dart';
import 'package:flutter_progress_hud/flutter_progress_hud.dart';

class LoginScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return LoginScreenState();
  }

}

class LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
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
                height: SizeConfig.height*100,
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Form(
                  key: _formKey,
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
                        controller: emailController,
                        labelText: "Enter your email id",
                        onValidate: (val){
                          if(val!.isEmpty){
                            return "Please enter email Id !";
                          }
                        },
                      ),
                      const SizedBox(height: 26),
                      CommonTextField(
                        controller: passwordController,
                        labelText: "Password",
                        onValidate: (val){
                          if(val!.isEmpty){
                            return "Please enter password !";
                          }
                        },
                        isPassword: true,
                      ),
                      const SizedBox(height: 56),
                      CustomButton(onPressed: () {
                        FocusScope.of(context).unfocus();
                        if(_validate()){
                          final progress = ProgressHUD.of(context);
                          progress?.show();
                          UserController().login(
                              {
                                'email': emailController.text,
                                'password': passwordController.text
                              }
                          ).whenComplete((){
                            progress?.dismiss();
                          });
                        }
                        //Get.toNamed("main_page");
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
                          InkWell(
                            onTap: (){
                              Get.offAndToNamed("register");
                            },
                            child: Text(
                              "Sign up",
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
}
