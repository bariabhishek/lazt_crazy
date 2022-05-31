import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projects/constant/app_assets.dart';
import 'package:projects/screens/widgets/circle_profile_pic.dart';
import 'package:projects/utils/size_config.dart';

class DrawerScreen extends StatelessWidget {
  const DrawerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: SizeConfig.width * 70,
      color: Colors.white,
      child: Column(
        children: <Widget>[
          const SizedBox(
            height: 16,
          ),
          Row(
            children: [
              IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: const Icon(Icons.close, color: Colors.black, size: 30)),
              const Spacer(),
              CircleProfilePic(
                "https://picsum.photos/200/300?random=48",
                size: 26,
              ),
              const SizedBox(
                width: 8,
              ),
              const Text(
                "_my_profile_154",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
              const SizedBox(
                width: 16,
              ),
            ],
          ),
          const SizedBox(
            height: 16,
          ),
          _tiltleContraier(title: "MY SOCIAL"),
          _menuTile(icon: AppAssets.saveIcon, title: "Saved", onTap: () {
            Get.toNamed("saved_screen");
          }),
          _menuTile(icon: AppAssets.ads, title: "My Ads", onTap: () {
            Get.toNamed("my_ads");
          }),
          _menuTile(icon: AppAssets.myActivity, title: "My Activity", onTap: () {
            Get.toNamed("my_activity");
          }),
          _tiltleContraier(title: "My Shop online"),
          _menuTile(
              icon: AppAssets.shoppingBag, title: "My Orders", onTap: () {}),
          _menuTile(icon: AppAssets.heart, title: "My Wishlist", onTap: () {}),
          _menuTile(
              icon: AppAssets.chekListCart,
              title: "My Purchases",
              onTap: () {}),
          _tiltleContraier(title: "My Account"),
          _menuTile(
              icon: AppAssets.shoppingBag,
              title: "Payment Opptions",
              onTap: () {}),
          _menuTile(
              icon: AppAssets.heart, title: "Privacy Policy", onTap: () {}),
          _menuTile(icon: AppAssets.help, title: "Help Center", onTap: () {}),
          const Divider(
            height: 16,
          ),
          ListTile(
            leading: Image.asset(
              AppAssets.settings,
              height: 30,
              width: 30,
            ),
            title: const Text("Settings", style: TextStyle(fontSize: 16)),
            onTap: () {},
          )
        ],
      ),
    );
  }

  Widget _tiltleContraier({required String title}) {
    return Container(
        width: SizeConfig.width * 100,
        padding: const EdgeInsets.all(16),
        color: Colors.grey[300],
        child: Text(title, style: TextStyle(color: Colors.grey, fontSize: 16)));
  }

  Widget _menuTile({
    required String icon,
    required String title,
    VoidCallback? onTap,
  }) {
    return ListTile(
      leading: Image.asset(
        icon,
        height: 30,
        width: 30,
      ),
      title: Text(title, style: TextStyle(fontSize: 16)),
      onTap: onTap,
      trailing: Icon(
        Icons.arrow_forward_ios,
        color: Colors.black,
        size: 20,
      ),
    );
  }
}
