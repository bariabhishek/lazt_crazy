// To parse this JSON data, do
//
//     final actitvityModel = actitvityModelFromJson(jsonString);

import 'dart:convert';

List<ActivityModel> actitvityModelFromJson(String str) => List<ActivityModel>.from(json.decode(str).map((x) => ActivityModel.fromJson(x)));

String actitvityModelToJson(List<ActivityModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ActivityModel {
  ActivityModel({
    this.time,
    this.isGrouped,
    this.activities,
  });

  String? time;
  bool? isGrouped;
  List<Activity>? activities;

  factory ActivityModel.fromJson(Map<String, dynamic> json) => ActivityModel(
    time: json["time"],
    isGrouped: json["is_grouped"],
    activities: List<Activity>.from(json["activities"].map((x) => Activity.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "time": time,
    "is_grouped": isGrouped,
    "activities": List<dynamic>.from(activities!.map((x) => x.toJson())),
  };
}

class Activity {
  Activity({
    this.postId,
    this.postImage,
    this.action,
    this.actionBy,
    this.actionTime,
  });

  int? postId;
  String? postImage;
  UserAction? action;
  ActionBy? actionBy;
  String? actionTime;

  factory Activity.fromJson(Map<String, dynamic> json) => Activity(
    postId: json["post_id"] == null ? null : json["post_id"],
    postImage: json["post_image"] == null ? null : json["post_image"],
    action: actionValues.map![json["action"]],
    actionBy: ActionBy.fromJson(json["action_by"]),
    actionTime: json["action_time"],
  );

  Map<String, dynamic> toJson() => {
    "post_id": postId == null ? null : postId,
    "post_image": postImage == null ? null : postImage,
    "action": actionValues.reverse[action],
    "action_by": actionBy!.toJson(),
    "action_time": actionTimeValues.reverse[actionTime],
  };
}

enum UserAction { LIKE, COMMENT, FOLLOWED }

final actionValues = EnumValues({
  "comment": UserAction.COMMENT,
  "followed": UserAction.FOLLOWED,
  "like": UserAction.LIKE
});

class ActionBy {
  ActionBy({
    this.username,
    this.userId,
    this.profileImage,
    this.isFollowing,
  });

  String? username;
  int? userId;
  bool? isFollowing;
  String? profileImage;

  factory ActionBy.fromJson(Map<String, dynamic> json) => ActionBy(
    username: json["username"],
    userId: json["user_id"],
    isFollowing: json["isFollowing"]??false,
    profileImage: json["profileImage"],
  );

  Map<String, dynamic> toJson() => {
    "username": username,
    "user_id": userId,
    "profileImage": profileImage,
  };
}

enum ActionTime { THE_3_H }

final actionTimeValues = EnumValues({
  "3h": ActionTime.THE_3_H
});

class EnumValues<T> {
  Map<String, T>? map;
  Map<T, String> ?reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map!.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap!;
  }
}
