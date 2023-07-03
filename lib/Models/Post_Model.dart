
import 'package:equatable/equatable.dart';
import 'package:social_media_app_frontend_in_flutter/Models/user_profile_detels.dart';

class PostModel extends Equatable {
  Images? images;
  String? sId;
  String? caption;
  UserProfileDetels? owner;
  List<String>? likes;
  String? createdAt;
  List<String>? comments;

  PostModel(
      {this.images,
      this.sId,
      this.caption,
      this.owner,
      this.likes,
      this.createdAt,
      this.comments});

  PostModel.fromJson(Map<String, dynamic> json) {
    images = json['images'] != null ? new Images.fromJson(json['images']) : null;
    sId = json['_id'];
    caption = json['caption'];
    owner = UserProfileDetels.fromJson(json["owner"]);
    likes = json['likes'].cast<String>();
    createdAt = json['createdAt'];
    comments = json['comments'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.images != null) {
      data['images'] = this.images!.toJson();
    }
    data['_id'] = this.sId;
    data['caption'] = this.caption;
    data['owner'] = this.toJson();
    data['likes'] = this.likes;
    data['createdAt'] = this.createdAt;
    data['comments'] = this.comments;
    return data;
  }


  
   @override
  List<Object?> get props => [ sId ];
}

class Images {
  String? publicId;
  String? url;

  Images({this.publicId, this.url});

  Images.fromJson(Map<String, dynamic> json) {
    publicId = json['public_id'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['public_id'] = this.publicId;
    data['url'] = this.url;
    return data;
  }
}










class OrderModel extends Equatable {
  String? sId;
  String? status;
  double? totalAmount;
  String? razorPayOrderId;
  DateTime? updatedOn;
  DateTime? createdOn;

  OrderModel({this.sId, this.status, this.totalAmount, this.razorPayOrderId, this.updatedOn, this.createdOn});

  OrderModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    status = json['status'];
    razorPayOrderId = json['razorPayOrderId'];
    totalAmount = double.tryParse(json['totalAmount'].toString());
    updatedOn = DateTime.tryParse(json['updatedOn']);
    createdOn = DateTime.tryParse(json['createdOn']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['status'] = this.status;
    data['razorPayOrderId'] = this.razorPayOrderId;
    data['totalAmount'] = this.totalAmount;
    data['updatedOn'] = this.updatedOn?.toIso8601String();
    data['createdOn'] = this.createdOn?.toIso8601String();
    return data;
  }


  @override
  List<Object?> get props => [ sId ];

}






