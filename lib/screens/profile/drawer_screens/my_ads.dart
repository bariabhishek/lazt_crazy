import 'package:flutter/material.dart';
import 'package:projects/screens/widgets/my_store_item.dart';
import 'package:projects/utils/size_config.dart';

class MyAdsScreen extends StatelessWidget {
  const MyAdsScreen({Key? key}) : super(key: key);

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
          "My Ads",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Container(
        height: SizeConfig.height*100,
        width: SizeConfig.width*100,
        child: ListView.builder(
          itemCount: 2,
          shrinkWrap: true,
          itemBuilder: (BuildContext context, int index) {
            return MyStoreItem();
          },
        ),
      ),
    );
  }
}
