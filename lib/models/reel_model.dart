class ReelModel{
  int? id;
  String?  reel;
  String? reel_path;
  String? caption;
  int? user_id;
  String? createdAt;
  String?updatedAt;
  List? likes;
  List? comments;

  ReelModel({
    this.id,
    this.reel,
    this.reel_path,
    this.caption,
    this.user_id,
    this.createdAt,
    this.updatedAt,
    this.likes,
    this.comments
  });

  factory ReelModel.fromJson(Map<String, dynamic> json) => ReelModel(
    id: json["id"],
    reel: json["reel"],
    reel_path: json["reel_path"],
    caption: json["caption"],
    user_id: json["user_id"],
    createdAt: json["created_at"],
    updatedAt: json["updated_at"],
    likes: json["likes"],
    comments: json["comments"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "reel": reel,
    "reel_path": reel_path,
    "caption": caption,
    "user_id": user_id,
    "created_at": createdAt,
    "updated_at": updatedAt,
    "likes": likes,
    "comments": comments,
  };
}