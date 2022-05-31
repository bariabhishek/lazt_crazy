import 'package:flutter/material.dart';
class FeedMoreBottomSheet extends StatelessWidget {
  const FeedMoreBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
      ),
      child: Column(mainAxisSize: MainAxisSize.min,children: <Widget>[const SizedBox(height:16),
        ListTile(
          onTap: (){},
          title: const Center(
            child: Text(
                "Report",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
          )
        ),
       const  Divider(),
        ListTile(
            onTap: (){},
            title: const Center(
              child: Text(
                "Hide",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            )
        ),
        const Divider(),
        ListTile(
            onTap: (){},
            title: const Center(
              child: Text(
                "Copy Link",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            )
        ),
        const Divider(),
        ListTile(
            onTap: (){},
            title: const Center(
              child: Text(
                "Share to",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            )
        ),
        const Divider(),
        ListTile(
            onTap: (){},
            title: const Center(
              child: Text(
                "Unfollow",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            )
        ),
        const SizedBox(height:16),
      ],),

    );
  }
}
