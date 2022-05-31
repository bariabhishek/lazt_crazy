import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projects/constant/app_assets.dart';
import 'package:projects/utils/size_config.dart';

class ReelPage extends StatelessWidget {
  const ReelPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: SizeConfig.height * 100,
      width: SizeConfig.width * 100,
      child: Stack(
        children: [
          CachedNetworkImage(
              imageUrl: "https://picsum.photos/200/300?random=4",
              fit: BoxFit.fill,
              height: SizeConfig.height * 100,
              width: SizeConfig.width * 100),
          Container(
            height: 56,
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                    colors: [Colors.black, Colors.transparent],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter)),
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                const Text(
                  "Reels",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      CupertinoIcons.camera,
                      color: Colors.white,
                    ))
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: SizedBox(
              child: Row(
                children: <Widget>[
                  Expanded(child: _userDetails()),
                  SizedBox(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        _buttonWitnNumbers(
                            icon: AppAssets.heart, value: "256k", onTap: () {}),
                        _buttonWitnNumbers(
                            icon: AppAssets.comment,
                            value: "56k",
                            onTap: () {}),
                        _buttonWitnNumbers(
                            icon: AppAssets.sendMessage,
                            value: "",
                            onTap: () {}),
                        const Icon(
                          Icons.more_vert,
                          color: Colors.white,
                        ),
                        Container(
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10)),
                          child: CachedNetworkImage(
                            imageUrl: "https://picsum.photos/200/300?random=2",
                            fit: BoxFit.fill,
                            height: 40,
                            width: 40,
                          ),
                        )
                      ],
                    ),
                    width: 90,
                  )
                ],
              ),
              height: SizeConfig.height * 32,
            ),
          )
        ],
      ),
    );
  }

  _buttonWitnNumbers({String? icon, String? value, VoidCallback? onTap}) {
    return InkWell(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Image.asset(
            icon!,
            color: Colors.white,
            height: 36,
            width: 36,
          ),
          const SizedBox(height: 4),
          if (value!.isNotEmpty)
            Text(
              value,
              style: const TextStyle(color: Colors.white),
            )
        ],
      ),
      onTap: onTap,
    );
  }

  Widget _userDetails() {
    return Container(
      child: Row(
        children: <Widget>[

          Container(
            decoration: BoxDecoration(
                gradient: const LinearGradient(colors: [
                  Colors.pink,
                  Colors.red,
                  Colors.orange,
                  Colors.yellow
                ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
                borderRadius: BorderRadius.circular(50)),
            height: 68,
            width: 68,
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
                    size: const Size.fromRadius(68),
                    child: CachedNetworkImage(
                      imageUrl:"https://picsum.photos/200/300?random=9",
                      fit: BoxFit.fill,
                      height: 68,
                      width: 68,
                    ),
                  ),
                )),
          ),
          const SizedBox(width: 8),
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children:const  [
              Text(
               "Ram Lal",
                style:
                 TextStyle(fontWeight: FontWeight.w600, fontSize: 18,color: Colors.white),
              ),
               SizedBox(height: 6),
              Text(
                "song is nothing",
                style:  TextStyle(
                  fontSize: 16,color: Colors.white
                ),
              ),
            ],
          ),


        ],
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 16),
      alignment: Alignment.bottomLeft,
    );
  }


}
