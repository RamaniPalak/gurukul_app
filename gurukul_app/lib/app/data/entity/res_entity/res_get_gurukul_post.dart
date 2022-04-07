
import 'package:gurukul_app/app/data/data_service/server_configs.dart';

class ResGurukulPost {
  ResGurukulPost({
    this.status,
    this.message,
    this.data,
  });

  int? status;
  String? message;
  ResGurukulPostData? data;

  factory ResGurukulPost.fromJson(Map<String, dynamic> json) => ResGurukulPost(
    status: json["status"] == null ? null : json["status"],
    message: json["message"] == null ? null : json["message"],
    data: json["data"] == null ? null : ResGurukulPostData.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status == null ? null : status,
    "message": message == null ? null : message,
    "data": data == null ? null : data!.toJson(),
  };
}

class ResGurukulPostData {
  ResGurukulPostData({
    this.list,
    this.totalPage,
  });

  List<ListPosts>? list;
  int? totalPage;

  factory ResGurukulPostData.fromJson(Map<String, dynamic> json) => ResGurukulPostData(
    list: json["list"] == null ? null : List<ListPosts>.from(json["list"].map((x) => ListPosts.fromJson(x))),
    totalPage: json["total_page"] == null ? null : json["total_page"],
  );

  Map<String, dynamic> toJson() => {
    "list": list == null ? null : List<dynamic>.from(list!.map((x) => x.toJson())),
    "total_page": totalPage == null ? null : totalPage,
  };
}

class ListPosts {
  ListPosts({
    this.wallId,
    this.gurukulId,
    this.wallImage,
    this.postTypeTerm,
    this.postTitle,
    this.postDescription,
    this.publishedOn,
    this.gurukulName,
    this.postType,
  });

  int? wallId;
  int? gurukulId;
  String? wallImage;
  String? postTypeTerm;
  String? postTitle;
  String? postDescription;
  DateTime? publishedOn;
  String? gurukulName;
  String? postType;

  String? get userImage{
    if(wallImage != null){
      return ServerConfigs.imageBaseURL + wallImage!;
    }
  }

  factory ListPosts.fromJson(Map<String, dynamic> json) => ListPosts(
    wallId: json["wall_id"] == null ? null : json["wall_id"],
    gurukulId: json["gurukul_id"] == null ? null : json["gurukul_id"],
    wallImage: json["wall_image"] == null ? null : json["wall_image"],
    postTypeTerm: json["post_type_term"] == null ? null : json["post_type_term"],
    postTitle: json["post_title"] == null ? null : json["post_title"],
    postDescription: json["post_description"] == null ? null : json["post_description"],
    publishedOn: json["published_on"] == null ? null : DateTime.parse(json["published_on"]),
    gurukulName: json["GurukulName"] == null ? null : json["GurukulName"],
    postType: json["post_type"] == null ? null : json["post_type"],
  );

  Map<String, dynamic> toJson() => {
    "wall_id": wallId == null ? null : wallId,
    "gurukul_id": gurukulId == null ? null : gurukulId,
    "wall_image": wallImage == null ? null : wallImage,
    "post_type_term": postTypeTerm == null ? null : postTypeTerm,
    "post_title": postTitle == null ? null : postTitle,
    "post_description": postDescription == null ? null : postDescription,
    "published_on": publishedOn == null ? null : "${publishedOn?.year.toString().padLeft(4, '0')}-${publishedOn?.month.toString().padLeft(2, '0')}-${publishedOn?.day.toString().padLeft(2, '0')}",
    "GurukulName": gurukulName == null ? null : gurukulName,
    "post_type": postType == null ? null : postType,
  };
}
