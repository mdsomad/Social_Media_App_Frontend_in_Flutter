class UserModel {
  bool? status;
  String? message;
  String? token;
  String? userId;

  UserModel({this.status, this.message, this.token, this.userId});

  UserModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    token = json['token'];
    userId = json['userId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    data['token'] = this.token;
    data['userId'] = this.userId;
    return data;
  }
}
