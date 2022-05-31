import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:photo_gallery/photo_gallery.dart';
import 'package:projects/controllers/create_ad_controller.dart';
import 'package:projects/screens/widgets/custom_button.dart';
import 'package:projects/screens/widgets/custom_text_filed.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:video_player/video_player.dart';

class AddProduct extends StatelessWidget {
  AddProduct({Key? key}) : super(key: key);

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
          "Include some details",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [




            CommonTextField(
              labelText: 'Brand*',
              controller: TextEditingController(),
            ),
            const SizedBox(height: 16,),
            CommonTextField(
              labelText: 'Ad title *',
              controller: TextEditingController(),
            ),
            const Text(
              "Mention the key features of your item (e.g. brand, model, how old, type)",
              style: TextStyle(),
            ),
            const SizedBox(height: 16,),
            CommonTextField(
              labelText: 'Describe what you are selling *',
              controller: TextEditingController(),
            ),
            const Text(
              "Include condition, features and reason for selling",
              style: TextStyle(),
            ),
           const Spacer(),
            CustomButton(onPressed: () {
              Get.toNamed('add_images');
            }, title: "Next")
          ],
        ),
      ),
    );
  }






}


