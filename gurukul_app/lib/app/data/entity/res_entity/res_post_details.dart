// To parse this JSON data, do
//
//     final listPost = listPostFromJson(jsonString);

import 'dart:convert';

import 'package:gurukul_app/app/data/data_service/server_configs.dart';


class PostDetail {
  PostDetail({
    this.status,
    this.message,
    this.data,
  });

  int? status;
  String? message;
  Data? data;

  factory PostDetail.fromJson(Map<String, dynamic> json) => PostDetail(
    status: json["status"] == null ? null : json["status"],
    message: json["message"] == null ? null : json["message"],
    data: json["data"] == null ? null : Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status == null ? null : status,
    "message": message == null ? null : message,
    "data": data == null ? null : data!.toJson(),
  };
}

class Data {
  Data({
    this.wallId,
    this.gurukulId,
    this.wallImage,
    this.wallName,
    this.createdBy,
    this.statusTerm,
    this.orderNo,
    this.isActive,
    this.updatedLog,
    this.createdAt,
    this.updatedAt,
    this.postId,
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
  String? wallName;
  int? createdBy;
  dynamic? statusTerm;
  int? orderNo;
  int? isActive;
  dynamic? updatedLog;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? postId;
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

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    wallId: json["wall_id"] == null ? null : json["wall_id"],
    gurukulId: json["gurukul_id"] == null ? null : json["gurukul_id"],
    wallImage: json["wall_image"] == null ? null : json["wall_image"],
    wallName: json["wall_name"] == null ? null : json["wall_name"],
    createdBy: json["created_by"] == null ? null : json["created_by"],
    statusTerm: json["status_term"],
    orderNo: json["order_no"] == null ? null : json["order_no"],
    isActive: json["is_active"] == null ? null : json["is_active"],
    updatedLog: json["updated_log"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    postId: json["post_id"] == null ? null : json["post_id"],
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
    "wall_name": wallName == null ? null : wallName,
    "created_by": createdBy == null ? null : createdBy,
    "status_term": statusTerm,
    "order_no": orderNo == null ? null : orderNo,
    "is_active": isActive == null ? null : isActive,
    "updated_log": updatedLog,
    "created_at": createdAt == null ? null : createdAt!.toIso8601String(),
    "updated_at": updatedAt == null ? null : updatedAt!.toIso8601String(),
    "post_id": postId == null ? null : postId,
    "post_type_term": postTypeTerm == null ? null : postTypeTerm,
    "post_title": postTitle == null ? null : postTitle,
    "post_description": postDescription == null ? null : postDescription,
    "published_on": publishedOn == null ? null : "${publishedOn?.year.toString().padLeft(4, '0')}-${publishedOn?.month.toString().padLeft(2, '0')}-${publishedOn?.day.toString().padLeft(2, '0')}",
    "GurukulName": gurukulName == null ? null : gurukulName,
    "post_type": postType == null ? null : postType,
  };
}
