// To parse this JSON data, do
//
//     final storyModel = storyModelFromJson(jsonString);

import 'dart:convert';


/*data: List<StoryModel>.from(json["data"].map((x) => StoryModel.fromJson(x))),*/

class StoryModel {
  StoryModel({
    this.name,
    this.image,
    this.isStorySeen,
    this.isMyStory,
    this.isStoryAvailable,
  });

  String? name;
  String? image;
  bool? isStorySeen;
  bool? isMyStory;
  bool? isStoryAvailable;

  factory StoryModel.fromJson(Map<String, dynamic> json) => StoryModel(
    name: json["name"],
    image: json["image"],
    isMyStory: json["isMyStory"]??false,
    isStoryAvailable: json["isStoryAvailable"]??false,
    isStorySeen: json["isStorySeen"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "image": image,
    "isStorySeen": isStorySeen,
  };
}