import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projects/controllers/create_ad_controller.dart';

class SelectAdCategory extends StatelessWidget {
  SelectAdCategory({Key? key}) : super(key: key);

  final title = Get.arguments as String;
  var cac = Get.put(CreateAdController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text(
          title,
          style: const TextStyle(color: Colors.black),
        ),
      ),
      body: ListView(
        children: [
          ListTile(
            onTap: () {
              Get.toNamed("add_product");
            },
            title: const Text(
              "Phones",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            contentPadding: const EdgeInsets.only(top: 4, bottom: 4, left: 36),
          ),
          const Divider(
            height: 0,
          ),
          ListTile(
            onTap: () {
              Get.toNamed("add_product");
            },
            title: const Text(
              "SmartPhones",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            contentPadding: const EdgeInsets.only(top: 4, bottom: 4, left: 36),
          ),
          const Divider(
            height: 0,
          ),
          ListTile(
            onTap: () {
              Get.toNamed("add_product");
            },
            title: const Text(
              "Tablet",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            contentPadding: const EdgeInsets.only(top: 4, bottom: 4, left: 36),
          ),
          const Divider(
            height: 0,
          ),
          ListTile(
            onTap: () {
              Get.toNamed("add_product");
            },
            title: const Text(
              "Chairs",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            contentPadding: const EdgeInsets.only(top: 4, bottom: 4, left: 36),
          ),
          const Divider(
            height: 0,
          ),
          ListTile(
            onTap: () {
              Get.toNamed("add_product");
            },
            title: const Text(
              "Bed",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            contentPadding: const EdgeInsets.only(top: 4, bottom: 4, left: 36),
          ),
          const Divider(
            height: 0,
          ),
          ListTile(
            onTap: () {
              Get.toNamed("add_product");
            },
            title: const Text(
              "Washing Machines",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            contentPadding: const EdgeInsets.only(top: 4, bottom: 4, left: 36),
          ),
          const Divider(
            height: 0,
          ),
        ],
      ),
    );
  }
}
