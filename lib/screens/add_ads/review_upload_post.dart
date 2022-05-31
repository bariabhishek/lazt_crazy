import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:projects/controllers/create_ad_controller.dart';
import 'package:projects/controllers/main_page_controller.dart';
import 'package:projects/screens/widgets/custom_button.dart';

class ReviewNUpload extends StatelessWidget {
  ReviewNUpload({Key? key}) : super(key: key);

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
          "Review you details",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: <Widget>[
                Image.asset(
                  "assets/images/lg_phone.png",
                  height: 100,
                  width: 100,
                  fit: BoxFit.cover,
                ),
                SizedBox(
                  width: 16,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      const Text(
                        "LG-flap 2031",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 16),
                      const Text(
                        "3 months old, touch screen, foldable",
                        style: TextStyle(),
                      ),
                    ],
                  ),
                )
              ],
            ),
            const SizedBox(height: 16),
            const Text(
              "LG-flap mobile in very good condition with all accessories",
              style: TextStyle(),
            ),
            ListTile(
              leading: Icon(
                FontAwesomeIcons.rupeeSign,
                color: Colors.red,
              ),
              contentPadding: EdgeInsets.symmetric(horizontal: 0),
              title: Text(
                "5,00,00",
                style: TextStyle(),
              ),
            ),

            ListTile(
              leading: Icon(CupertinoIcons.location,
                color: Colors.blue,
              ),
              contentPadding: EdgeInsets.symmetric(horizontal: 0),
              title: Text(
                "Narayan Nagar, Jaipur, Near SDMH Hospital.",
                style: TextStyle(),
              ),
            ),
            const Spacer(),
            CustomButton(onPressed: () {


              Get.offAndToNamed("main_page");
              Future.delayed(Duration(milliseconds: 100)).then((value) => Get.put(MainPageController()).selectedIndex=2);

            }, title: "Post")
          ],
        ),
      ),
    );
  }
}
