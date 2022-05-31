import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projects/controllers/home_controller.dart';
import 'package:projects/screens/widgets/story_circle_widget.dart';
import 'package:projects/utils/size_config.dart';

class StoryContainer extends StatelessWidget {
   StoryContainer({Key? key}) : super(key: key);
  var hmc= Get.find<HomeController>();
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 110,
      width: SizeConfig.width*100,
      child: ListView.builder(
        shrinkWrap: true,
        padding:const EdgeInsets.only(right: 16),
        scrollDirection: Axis.horizontal,
        itemCount: hmc.storyList.length, itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: const EdgeInsets.only(left: 16),
          child: StoryCircleWidget(hmc.storyList[index]),
        );
      },),
    );
  }
}
