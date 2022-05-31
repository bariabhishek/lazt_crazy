import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:projects/constant/app_theme.dart';
import 'package:projects/controllers/activity_controller.dart';
import 'package:projects/models/activity_model.dart';
import 'package:projects/screens/widgets/activity_widget.dart';
import 'package:projects/utils/size_config.dart';

class MyActivitiesScreen extends StatelessWidget {
  MyActivitiesScreen({Key? key}) : super(key: key);
  var act = Get.put(ActivityController());

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
          "My Activities",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Obx(
        () => act.isDataLoading.value
            ? Center(
                child: SpinKitCircle(
                  color: AppTheme.accentColor,
                ),
              )
            : Container(
                width: SizeConfig.width * 100,
                height: SizeConfig.height * 100,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: ListView.builder(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  itemCount: act.activityList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return activiyContainer(act.activityList[index]);
                  },
                ),
              ),
      ),
    );
  }

  Widget activiyContainer(ActivityModel activityList) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          activityList.time!,
          style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 24),
        ),
        const SizedBox(height: 16),
        if (!activityList.isGrouped!) ...[
          for (var activ in activityList.activities!) ...[
            ActivityWidget(activ),
            const Divider(
              height: 16,
            ),
          ]
        ] else ...[
          for (var activ in activityList.activities!) ...[
            ActivityWidget(activ),
            const Divider(),
          ]
        ],
        const SizedBox(height: 16),
      ],
    );
  }
}
