import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:projects/models/activity_model.dart';

import 'circle_profile_pic.dart';

class ActivityWidget extends StatelessWidget {
  Activity activity;

  ActivityWidget(this.activity, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    switch (activity.action) {
      case UserAction.FOLLOWED:
        return followActivity();
      case UserAction.LIKE:
        return likeTile();
      case UserAction.COMMENT:
        return commentTile();
      default:
        {
          return Container(
            child: null,
          );
        }
    }
  }

  Widget commentTile() {
    return Row(
      children: <Widget>[
        CircleProfilePic(
          activity.actionBy!.profileImage!,
          size: 30,
        ),
        const SizedBox(width: 16),
        Expanded(
            child: RichText(
          text: TextSpan(
              text: activity.actionBy!.username! + " ",
              style: const TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
              children: [
                const TextSpan(
                  text: "is comment on your photo. ",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.normal),
                ),
                TextSpan(
                  text: activity.actionTime!,
                  style: const TextStyle(
                      color: Colors.grey,
                      fontSize: 15,
                      fontWeight: FontWeight.normal),
                ),
              ]),
        )),
        const SizedBox(width: 16),
        CachedNetworkImage(
          imageUrl: activity.postImage!,
          fit: BoxFit.fill,
          height: 60,
          width: 60,
        ),
      ],
    );
  }

  Widget likeTile() {
    return Row(
      children: <Widget>[
        CircleProfilePic(
          activity.actionBy!.profileImage!,
          size: 30,
        ),
        const SizedBox(width: 16),
        Expanded(
            child: RichText(
          text: TextSpan(
              text: activity.actionBy!.username! + " ",
              style: const TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
              children: [
                const TextSpan(
                  text: "liked your photo. ",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.normal),
                ),
                TextSpan(
                  text: activity.actionTime!,
                  style: const TextStyle(
                      color: Colors.grey,
                      fontSize: 15,
                      fontWeight: FontWeight.normal),
                ),
              ]),
        )),
        const SizedBox(width: 16),
        CachedNetworkImage(
          imageUrl: activity.postImage!,
          fit: BoxFit.fill,
          height: 60,
          width: 60,
        ),
      ],
    );
  }

  Widget followActivity() {
    return Row(
      children: <Widget>[
        CircleProfilePic(
          activity.actionBy!.profileImage!,
          size: 30,
        ),
        const SizedBox(width: 16),
        Expanded(
            child: RichText(
          text: TextSpan(
              text: activity.actionBy!.username! + " ",
              style: const TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
              children: [
                const TextSpan(
                  text: "started following you. ",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.normal),
                ),
                TextSpan(
                  text: activity.actionTime!,
                  style: const TextStyle(
                      color: Colors.grey,
                      fontSize: 15,
                      fontWeight: FontWeight.normal),
                ),
              ]),
        )),
        const SizedBox(width: 16),
        !activity.actionBy!.isFollowing!
            ? MaterialButton(
                onPressed: () {},
                color: Colors.blue,
                child: const Text(
                  "Follow",
                  style: TextStyle(color: Colors.white),
                ),
              )
            : MaterialButton(
                onPressed: () {},
                color: Colors.white,
                child: const Text(
                  "Message",
                  style: TextStyle(color: Colors.black),
                ),
              )
      ],
    );
  }
}
