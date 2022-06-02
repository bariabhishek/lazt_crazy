import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:lzycrazy/constant/app_assets.dart';
import 'package:lzycrazy/constant/app_theme.dart';
import 'package:lzycrazy/controllers/home_controller.dart';
import 'package:lzycrazy/screens/home/feeds_container.dart';
import 'package:lzycrazy/screens/home/story_container.dart';
import 'package:lzycrazy/utils/size_config.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  var hmc = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Scaffold(
      body: Obx(() => hmc.isDataLoading.value
          ? Center(
              child: SpinKitCircle(
                color: AppTheme.accentColor,
              ),
            )
          : SingleChildScrollView(
              child: SizedBox(
                  width: SizeConfig.width * 100,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      appBar(),
                      StoryContainer(),
                      const SizedBox(height: 16),
                      Flexible(fit: FlexFit.loose, child: FeedsContainer())
                    ],
                  )))),
    );
  }

  Widget appBar() {
    return Container(
      child: Row(
        children: <Widget>[
          const SizedBox(width: 16),
          Image.asset(
            AppAssets.appLogo,
            fit: BoxFit.cover,
            height: 100,
            width: 140,
          ),
          const Spacer(),
          IconButton(onPressed: () {}, icon: Image.asset(AppAssets.search)),
          PopupMenuButton(
            icon: Image.asset(AppAssets.addButton),
              itemBuilder: (context) => [
                PopupMenuItem(
                  child:
                  Row(
                    children: <Widget>[
                      const Text(
                        "Post",
                        style: TextStyle(),
                      ),
                     const Spacer(),
                      Image.asset(AppAssets.addpost,height: 26,width: 26)
                    ],
                  ),
                  value: 1,
                ),
                PopupMenuItem(
                  child:
                  Row(
                    children: <Widget>[
                      const Text(
                        "Story",
                        style: TextStyle(),
                      ),
                     const Spacer(),
                      Image.asset(AppAssets.addstory,height: 26,width: 26)
                    ],
                  ),
                  value: 2,
                ), PopupMenuItem(
                  child:
                  Row(
                    children: <Widget>[
                      const Text(
                        "Reels",
                        style: TextStyle(),
                      ),
                     const Spacer(),
                      Image.asset(AppAssets.addstory,height: 26,width: 26)
                    ],
                  ),
                  value:3,
                ),


              ]
          ),
          PopupMenuButton(

              icon: Image.asset(AppAssets.ads),
              itemBuilder: (context) => [
                PopupMenuItem(

                  child:
                  Row(
                    children:const  <Widget>[
                       Text(
                        "All",
                        style: TextStyle(),
                      ),
                       Spacer(),
                      Icon(Icons.add_circle_outline)
                    ],
                  ),
                  value: 1,
                ),
                PopupMenuItem(

                  child:
                  Row(
                    children:const  <Widget>[
                      Text(
                        "Phones",
                        style: TextStyle(),
                      ),
                      Spacer(),
                      Icon(Icons.add_circle_outline)
                    ],
                  ),
                  value: 2,
                ),
                PopupMenuItem(

                  child:
                  Row(
                    children:const  <Widget>[
                      Text(
                        "Furniture",
                        style: TextStyle(),
                      ),
                      Spacer(),
                      Icon(Icons.add_circle_outline)
                    ],
                  ),
                  value: 3,
                ),


              ],
            onSelected: (value){
             switch(value){
               case 1: Get.toNamed('select_ad_category',arguments: "All");break;
               case 2: Get.toNamed('select_ad_category',arguments: "Phones");break;
               case 3: Get.toNamed('select_ad_category',arguments: "Furniture");break;
             }
            },
          ),
          IconButton(onPressed: () {}, icon: Image.asset(AppAssets.messenger)),
          const SizedBox(width: 16),
        ],
      ),
      height: 72,
      color: Colors.white,
    );
  }
}
