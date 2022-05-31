import 'package:flutter/material.dart';

class ProfilePosts extends StatelessWidget {
  ProfilePosts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        primary: true,
        shrinkWrap: true,
        padding: EdgeInsets.only(top: 8, bottom: 8, left: 8, right: 8),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: 1 / 1,
            crossAxisCount: 3,
            mainAxisSpacing: 8,
            crossAxisSpacing: 8),
        itemCount: 13,
        itemBuilder: (con, index) => Container(
            clipBehavior: Clip.antiAliasWithSaveLayer,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(4)),
            child: Image.asset("assets/images/lg_phone.png")));
  }
}
