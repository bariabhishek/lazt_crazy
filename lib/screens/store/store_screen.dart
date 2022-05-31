import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projects/screens/widgets/custom_text_filed.dart';
import 'package:projects/screens/widgets/store_item.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: <Widget>[
            const ListTile(
              leading: Icon(
                CupertinoIcons.location,
                color: Colors.blue,
              ),
              contentPadding: EdgeInsets.symmetric(horizontal: 0),
              title: Text(
                "Narayan Nagar, Jaipur, Near SDMH Hospital.",
                style: TextStyle(),
              ),
            ),
            CommonTextField(
              labelText: 'Search',
              prefix: Icon(CupertinoIcons.search),
              controller: TextEditingController(),
            ),
            const SizedBox(height:8),
            Expanded(
                child: GridView.builder(
                  padding: EdgeInsets.only(top: 8,bottom: 16),
                    gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
                        childAspectRatio: MediaQuery.of(context).size.width /
                            (MediaQuery.of(context).size.height / 1.5),
                        crossAxisCount: 2,mainAxisSpacing: 8,crossAxisSpacing: 8),

                    itemCount: 13,
                    itemBuilder: (con, index) => StoreItem()))
          ],
        ),
      ),
    );
  }
}
