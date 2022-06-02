import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:lzycrazy/constant/app_assets.dart';
import 'package:lzycrazy/constant/app_theme.dart';
import 'package:lzycrazy/controllers/main_page_controller.dart';
import 'package:lzycrazy/screens/mainPages/bottom_navigation.dart';
import 'package:lzycrazy/utils/size_config.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return GetX<MainPageController>(
      init: MainPageController(),
      builder: (controller)=>Scaffold(
          body: SafeArea(
            child: SizedBox(
                height: SizeConfig.height * 100,
                width: SizeConfig.width * 100,
                child: controller.screen),
          ),
          bottomNavigationBar: CustomBottomNavigation()
      ),
    );
  }


}
