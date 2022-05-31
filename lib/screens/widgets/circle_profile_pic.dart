


import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CircleProfilePic extends StatelessWidget {
  String imageUrl;
  double? size;
  bool? isStoryAvailable;

   CircleProfilePic(this.imageUrl,{Key? key,this.size=80,this.isStoryAvailable=false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return isStoryAvailable!?Container(
      decoration: BoxDecoration(
          gradient: const LinearGradient(colors: [
            Colors.pink,
            Colors.red,
            Colors.orange,
            Colors.yellow
          ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
          borderRadius: BorderRadius.circular(size!)),
      height: size!,
      width: size!,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      alignment: Alignment.center,
      padding: const EdgeInsets.all(3),
      child: Container(
          clipBehavior: Clip.antiAliasWithSaveLayer,
          decoration: const ShapeDecoration(
            shape: CircleBorder(
                side: BorderSide(width: 1, color: Colors.white)),
          ),
          alignment: Alignment.center,
          child: ClipOval(
            child: SizedBox.fromSize(
              size:  Size.fromRadius(size!),
              child: CachedNetworkImage(
                imageUrl: imageUrl,
                fit: BoxFit.fill,
                height: size!,
                width: size!,
              ),
            ),
          )),
    ):Container(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        decoration: const ShapeDecoration(
          shape: CircleBorder(
              side: BorderSide(width: 1, color: Colors.white)),
        ),
        alignment: Alignment.center,
        child: ClipOval(
          child: SizedBox.fromSize(
            size: Size.fromRadius(size!),
            child: CachedNetworkImage(
              imageUrl: imageUrl,
              fit: BoxFit.fill,
              height: size!,
              width: size!,
            ),
          ),
        ));
  }
}
