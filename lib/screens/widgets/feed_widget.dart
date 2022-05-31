import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:projects/constant/app_assets.dart';
import 'package:projects/models/feed_model.dart';
import 'package:projects/screens/home/feed_more_bottomsheet.dart';
import 'package:projects/utils/size_config.dart';

class FeedWidget extends StatelessWidget {
  FeedModel feedList;

  FeedWidget(this.feedList, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        _header(),
        SizedBox(
          child: contentPageList(feedList.feeds!),
          height: SizeConfig.height * 45,
        ),
        const SizedBox(height:8),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            children: <Widget>[
              IconButton(onPressed: (){}, icon: Image.asset(AppAssets.heart)),
              IconButton(onPressed: (){}, icon: Image.asset(AppAssets.comment)),
              IconButton(onPressed: (){}, icon: Image.asset(AppAssets.sendMessage)),
              const Spacer(),
              IconButton(onPressed: (){}, icon: Image.asset(AppAssets.saveIcon)),
            ],
          ),
        ),
        const SizedBox(height:4),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            children: <Widget>[
              Container(
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  decoration: const ShapeDecoration(
                    shape: CircleBorder(
                        side: BorderSide(width: 1, color: Colors.white)),
                  ),
                  alignment: Alignment.center,
                  child: ClipOval(
                    child: SizedBox.fromSize(
                      size: const Size.fromRadius(16),
                      child: CachedNetworkImage(
                        imageUrl: feedList.profileImage!,
                        fit: BoxFit.fill,
                        height: 16,
                        width: 16,
                      ),
                    ),
                  )),
              const SizedBox(width:8),
              const Text(
                "Liked by chirag and 452 others",
                style: TextStyle(fontWeight: FontWeight.w500),
              )
            ],
          ),
        ),
        const SizedBox(height:4),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child:  Text(feedList.caption!,
            style: TextStyle(fontWeight: FontWeight.w400,fontSize: 15),
          ),
        ),
        const SizedBox(height:8),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child:  Text(feedList.dateTime!,
            style: TextStyle(fontWeight: FontWeight.w400,fontSize: 14,color: Colors.grey),
          ),
        ),
        const Divider(height: 26,)
      ],
    );
  }

  Widget _header() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
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
            height: 50,
            width: 50,
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
                    size: const Size.fromRadius(50),
                    child: CachedNetworkImage(
                      imageUrl: feedList.profileImage!,
                      fit: BoxFit.fill,
                      height: 50,
                      width: 50,
                    ),
                  ),
                )),
          ),
          const SizedBox(width: 8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                feedList.username!,
                style:
                    const TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
              ),
              const SizedBox(height: 6),
              Text(
                feedList.location!,
                style: const TextStyle(
                  fontSize: 12,
                ),
              ),
            ],
          ),
          const Spacer(),
          IconButton(
              onPressed: () {
                Get.bottomSheet(FeedMoreBottomSheet(),);
              },
              icon: Image.asset(
                AppAssets.moreIcon,
                height: 16,
                width: 16,
              ))
        ],
      ),
    );
  }

  contentPageList(List<Feed> list) {
    return PageView.builder(
        itemCount: list.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (_, index) => contentPage(list[index]));
  }

  contentPage(Feed list) {
    return Container(
      color: Colors.grey[300],
      child: CachedNetworkImage(
        imageUrl: list.url!,
        height: SizeConfig.height * 40,
        fit: BoxFit.cover,
      ),
    );
  }
}
