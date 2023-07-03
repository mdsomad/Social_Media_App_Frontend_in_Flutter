



class UserProfileDetelsModel {
  Avater? avater;
  String? sId;
  String? name;
  String? email;
  List<String>? posts;
  List<String>? followers;
  List<String>? following;
  bool? userverify;
  String? createdAt;

  UserProfileDetelsModel(
      {this.avater,
      this.sId,
      this.name,
      this.email,
      this.posts,
      this.followers,
      this.following,
      this.userverify,
      this.createdAt});

  UserProfileDetelsModel.fromJson(Map<String, dynamic> json) {
    avater =
        json['avater'] != null ? new Avater.fromJson(json['avater']) : null;
    sId = json['_id'];
    name = json['name'];
    email = json['email'];
    posts = json['posts'].cast<String>();
    followers = json['followers'].cast<String>();
    following = json['following'].cast<String>();
    userverify = json['userverify'];
    createdAt = json['createdAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.avater != null) {
      data['avater'] = this.avater!.toJson();
    }
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['email'] = this.email;
    data['posts'] = this.posts;
    data['followers'] = this.followers;
    data['following'] = this.following;
    data['userverify'] = this.userverify;
    data['createdAt'] = this.createdAt;
    return data;
  }
}



class Avater {
  String? publicId;
  String? url;

  Avater({this.publicId, this.url});

  Avater.fromJson(Map<String, dynamic> json) {
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