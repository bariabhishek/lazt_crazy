import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:lzycrazy/utils/size_config.dart';

import '../../constant/app_theme.dart';
import '../../controllers/reel_controller.dart';
import 'reel_page.dart';

class ReelsScreen extends StatelessWidget {
  ReelsScreen({Key? key}) : super(key: key);

  var rc = Get.put(ReelController());

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Scaffold(
      backgroundColor: Colors.black,
      body: Obx(() => rc.isDataLoading.value
        ? Center(
      child: SpinKitCircle(
        color: AppTheme.accentColor,
      ),
    )
        :
      PageView.builder(
          scrollDirection: Axis.vertical,
          itemCount: rc.reelList.length,
          itemBuilder: (con, index) => ReelPage(rc.reelList[index])),
      )
    );
  }
}
