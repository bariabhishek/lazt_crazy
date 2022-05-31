import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projects/controllers/home_controller.dart';
import 'package:projects/screens/widgets/feed_widget.dart';
class FeedsContainer extends StatelessWidget {
   FeedsContainer({Key? key}) : super(key: key);
  var hmc= Get.find<HomeController>();
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      primary: false,
      padding: const EdgeInsets.only(bottom: 50),
      itemCount: hmc.feedList.length, itemBuilder: (BuildContext context, int index) {
      return FeedWidget(hmc.feedList[index]);
    },);
  }
}
