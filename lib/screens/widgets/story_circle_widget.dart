import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projects/models/story_model.dart';
import 'package:projects/screens/widgets/add_story_widget.dart';

class StoryCircleWidget extends StatelessWidget {
  StoryModel storyList;

  StoryCircleWidget(this.storyList, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (storyList.isMyStory! && !storyList.isStoryAvailable!) {
      return const AddStoryWidget();
    } else {
      return Column(
        children: <Widget>[
          InkWell(
            onTap: (){
              Get.toNamed("story_view",);
            },
            child: Container(
              decoration: BoxDecoration(
                  gradient: const LinearGradient(colors: [
                    Colors.pink,
                    Colors.red,
                    Colors.orange,
                    Colors.yellow
                  ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
                  borderRadius: BorderRadius.circular(80)),
              height: 80,
              width: 80,
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
                      size: const Size.fromRadius(80),
                      child: CachedNetworkImage(
                        imageUrl: storyList.image!,
                        fit: BoxFit.fill,
                        height: 80,
                        width: 80,
                      ),
                    ),
                  )),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            storyList.name!,
          )
        ],
      );
    }
  }
}
