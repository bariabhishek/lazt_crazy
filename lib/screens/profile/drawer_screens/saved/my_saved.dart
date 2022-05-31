import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projects/constant/app_assets.dart';
import 'package:projects/constant/app_theme.dart';
import 'package:projects/screens/profile/profile_posts.dart';
import 'package:projects/screens/widgets/my_store_item.dart';
import 'package:projects/utils/size_config.dart';

class SavedScreen extends StatelessWidget {
  const SavedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
        elevation: 0,
        backgroundColor: Colors.white,
        title: const Text(
          "Saved",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body:Container(
        height: SizeConfig.height*100,
        width: SizeConfig.width*100,
        child:DefaultTabController(
          initialIndex: 0,
          length: 2,
          child: Column(
            children: <Widget>[
              TabBar(
                tabs: [
                  Tab(
                    icon: Image.asset(AppAssets.grid,height:28,),
                  ),
                  Tab(
                    icon: Image.asset(AppAssets.reel,height:58,),
                  ),
                ],
                indicatorColor: AppTheme.accentColor,
                padding: EdgeInsets.all(8),
              ),
              Expanded(child: TabBarView(children: [
                ProfilePosts(),
                Container(child: null,height: SizeConfig.height*100,width: SizeConfig.width*100,color: Colors.blue,),
              ],))
            ],
          ),
        ),
      ) ,
    );
  }
}
