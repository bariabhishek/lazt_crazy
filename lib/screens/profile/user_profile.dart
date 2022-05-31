import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projects/constant/app_assets.dart';
import 'package:projects/constant/app_theme.dart';
import 'package:projects/screens/widgets/circle_profile_pic.dart';
import 'package:projects/utils/size_config.dart';

import 'drawer_screen.dart';
import 'profile_posts.dart';

class UserProfile extends StatelessWidget {
  UserProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          iconTheme: const IconThemeData(
            color: Colors.black,
          ),
          elevation: 0,
          backgroundColor: Colors.white,
          title: const Text(
            "_my_profile_154",
            style: TextStyle(color: Colors.black),
          ),
        ),
        endDrawer: DrawerScreen(),
        body: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              const SizedBox(height: 26),
              CircleProfilePic(
                "https://picsum.photos/200/300?random=48",
                size: 70,
              ),
              const SizedBox(height: 12),
              const Text(
                "Ravish",
                style: TextStyle(fontWeight: FontWeight.w900, fontSize: 30),
              ),
              const SizedBox(height: 4),
              const Text(
                "Designer",
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                    color: Colors.grey),
              ),
              const SizedBox(height: 16),
              const Text(
                "Digital goodies designer @pixitute\nEverything is designed.",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 20,
                    color: Colors.grey),
              ),
              const SizedBox(height: 36),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  counts(title: "Posts", value: "82"),
                  Image.asset(
                    AppAssets.divider,
                    height: 36,
                    width: 50,
                  ),
                  counts(title: "Followers", value: "64"),
                  Image.asset(
                    AppAssets.divider,
                    height: 36,
                    width: 50,
                  ),
                  counts(title: "Following", value: "185"),
                ],
              ),
              const SizedBox(height: 36),
              MaterialButton(
                color: AppTheme.primaryColor,
                height: SizeConfig.height * 6,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
                onPressed: () {
                  Get.toNamed("edit_profile");
                },
                child: const Text(
                  "Edit Profile",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16),
                ),
              ),
              const SizedBox(height: 26),
              const Divider(
                height: 16,
              ),
              Flexible(
                fit: FlexFit.loose,
                child: DefaultTabController(
                  initialIndex: 0,
                  length: 4,
                  child: tabBar(),
                ),
              )
            ],
          ),
        ));
  }

  Widget counts({String? title, String? value}) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Text(
          value!,
          style: TextStyle(
              fontSize: 30,
              color: Colors.red[900],
              fontWeight: FontWeight.w900),
        ),
        Text(
          title!,
          style: const TextStyle(
              fontSize: 16, color: Colors.grey, fontWeight: FontWeight.bold),
        )
      ],
    );
  }

  Widget tabBar() {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        TabBar(
          tabs: [
            Tab(
              icon: Image.asset(AppAssets.grid,height:28,),
            ),
            Tab(
              icon: Image.asset(AppAssets.reel,height:58,),
            ),
            Tab(
              icon:Icon(CupertinoIcons.play,color: Colors.black,size: 30,),
            ),
            Tab(
              icon: Image.asset(AppAssets.mention,height:28,),
            ),
          ],
          indicatorColor: AppTheme.accentColor,
          padding: EdgeInsets.all(8),
        ),
        Container(
          height: SizeConfig.height*100,width: SizeConfig.width*100,
          child: TabBarView(children: [

            ProfilePosts(),
            Container(child: null,height: SizeConfig.height*100,width: SizeConfig.width*100,color: Colors.blue,),
            Container(child: null,height: SizeConfig.height*100,width: SizeConfig.width*100,color: Colors.yellow,),
            Container(child: null,height: SizeConfig.height*100,width: SizeConfig.width*100,color: Colors.grey,)

          ],),
        )
      ],
    );
  }
}
