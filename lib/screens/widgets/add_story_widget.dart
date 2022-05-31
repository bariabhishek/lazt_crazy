import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddStoryWidget extends StatelessWidget {
  const AddStoryWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: const ShapeDecoration(
            shape: CircleBorder(
              side: BorderSide(
                color: Colors.grey,
                width: 1.4,
              ),
            ),
          ),
          height: 80,
          width: 80,
          alignment: Alignment.center,
          child: const Icon(
            CupertinoIcons.add,
            size: 26,
          ),
        ),
        const SizedBox(height:8),
        const Text(
          "My Story",
          style: TextStyle(),
        )
      ],
    );
  }
}
