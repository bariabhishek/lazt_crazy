
class FeedModel {
  FeedModel({
    this.id,
    this.caption,
    this.username,
    this.profileImage,
    this.feeds,
    this.dateTime,
    this.location,
  });

  int? id;
  String? caption;
  String? dateTime;
  String? location;
  String? username;
  String? profileImage;
  List<Feed>? feeds;

  factory FeedModel.fromJson(Map<String, dynamic> json) => FeedModel(
    id: json["id"],
    caption: json["caption"],
    location: json["location"],
    dateTime: json["dateTime"],
    username: json["username"],
    profileImage: json["profileImage"],
    feeds: List<Feed>.from(json["feedData"].map((x) => Feed.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "caption": caption,
    "username": username,
    "profileImage": profileImage,
    "feeds": List<dynamic>.from(feeds!.map((x) => x.toJson())),
  };
}

class Feed {
  Feed({
    this.url,
    this.type,
  });

  String? url;
  String? type;

  factory Feed.fromJson(Map<String, dynamic> json) => Feed(
    url: json["url"],
    type: json["type"],
  );

  Map<String, dynamic> toJson() => {
    "url": url,
    "type": type,
  };
}
