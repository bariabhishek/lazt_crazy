import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:projects/constant/app_assets.dart';
import 'package:projects/constant/app_theme.dart';
import 'package:projects/controllers/main_page_controller.dart';

class CustomBottomNavigation extends StatelessWidget {
  CustomBottomNavigation({Key? key}) : super(key: key);
  var mpc = Get.find<MainPageController>();

  @override
  Widget build(BuildContext context) {
    return PhysicalModel(
      color: Colors.white,
      elevation: 5,
      child: SizedBox(
        height: 72,

        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            _home(),
            _reel(),
            _market(),
            _myliked(),
            _myProfile()
          ],
        ),
      ),
    );
  }

  Widget _home() {
    return InkWell(
      onTap: () {
        mpc.selectedIndex = 0;
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: 501),
        padding: EdgeInsets.all(8),
        child: Image.asset(
          AppAssets.home,
          height: 30,
          color: mpc.selectedIndex == 0 ? AppTheme.primaryColor : Colors.grey,
        ),
      ),
    );
  }

  Widget _reel() {
    return InkWell(
      onTap: () {
        mpc.selectedIndex = 1;
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: 501),
        padding: EdgeInsets.all(8),
        child: Image.asset(
          AppAssets.reel,
          fit: BoxFit.cover,
          height: 90,
          width: 30,
          color: mpc.selectedIndex == 1 ? AppTheme.primaryColor : Colors.grey,
        ),
      ),
    );
  }

  Widget _market() {
    return InkWell(
      onTap: () {
        mpc.selectedIndex = 2;
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: 501),
        padding: EdgeInsets.all(8),
        child: Image.asset(
          AppAssets.store,
          fit: BoxFit.cover,
          height: 90,
          width: 30,
          color: mpc.selectedIndex == 2 ? AppTheme.primaryColor : Colors.grey,
        ),
      ),
    );
  }

  Widget _myliked() {
    return InkWell(
      onTap: () {
        mpc.selectedIndex = 3;
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: 501),
        padding: EdgeInsets.all(8),
        child: Icon(
          CupertinoIcons.heart,
          size: 32,
          color: mpc.selectedIndex == 3 ? AppTheme.primaryColor : Colors.grey,
        ),
      ),
    );
  }

  Widget _myProfile() {
    return InkWell(
      onTap: () {
        mpc.selectedIndex = 4;
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: 501),
        padding: EdgeInsets.all(8),
        child: ClipOval(
          child: SizedBox.fromSize(
            size: const Size.fromRadius(14),
            child: CachedNetworkImage(
              imageUrl: "https://picsum.photos/200/300?random=3",
              fit: BoxFit.fill,
            ),
          ),
        ),
      ),
    );
  }
}
