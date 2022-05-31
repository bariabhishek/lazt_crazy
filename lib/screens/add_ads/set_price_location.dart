import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:photo_gallery/photo_gallery.dart';
import 'package:projects/controllers/create_ad_controller.dart';
import 'package:projects/screens/widgets/custom_button.dart';
import 'package:projects/screens/widgets/custom_text_filed.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:video_player/video_player.dart';

class SetPriceLocation extends StatelessWidget {
  SetPriceLocation({Key? key}) : super(key: key);

  CreateAdController cpc = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
        elevation: 0,
        backgroundColor: Colors.white,
        title: const Text(
          "Set a price & location",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CommonTextField(
              labelText: 'Price*',
              controller: TextEditingController(),
            ),
            const SizedBox(height: 16,),
            CommonTextField(
              labelText: 'Location*',
              controller: TextEditingController(),
            ),
            const Text(
              "Mention the Landmark with your location",
              style: TextStyle(),
            ),

           const Spacer(),
            CustomButton(onPressed: () {
              Get.toNamed('review_n_upload');
            }, title: "Next")
          ],
        ),
      ),
    );
  }






}


