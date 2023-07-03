import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:social_media_app_frontend_in_flutter/Models/Post_Model.dart';
import 'package:social_media_app_frontend_in_flutter/Screens/Users_Profiles/users_profiles.dart';
import 'package:social_media_app_frontend_in_flutter/logic/cubits/comment_cubits/comment_cubits.dart';

class HomeListView extends StatelessWidget {
  final PostModel post;
  final String userName;
  final String caption;
  final String urlPost;
  final String urlProfilePhoto;
  final bool userverify;
  final String likes;
  final VoidCallback onPreass;
  final bool likecolor;
  final VoidCallback commentonPress;
  HomeListView(
      {super.key,
      required this.post,
      required this.userName,
      required this.caption,
      required this.urlPost,
      required this.urlProfilePhoto,
      required this.userverify,
      required this.likes,
      required this.onPreass,
      required this.likecolor,
      required this.commentonPress});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 15),
      padding: EdgeInsets.symmetric(horizontal: 18, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.1),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildPostFirstRow(post,userName, caption, urlProfilePhoto, userverify,context),
          SizedBox(
            height: 10,
          ),
          GestureDetector(
              onLongPress: () {
                print("Lond press");
              },
              child: buildPostPicture(urlPost, onPreass, likecolor, context)),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Text(
                "$likes likes",
                style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[800]),
              ),
              SizedBox(
                width: 15,
              ),
              GestureDetector(
                  onTap: commentonPress,
                  child: FaIcon(
                    FontAwesomeIcons.comment,
                    size: 25,
                    color: Colors.black,
                  )),
            ],
          ),
          SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}

Row buildPostFirstRow(
  PostModel post,
  String userName,
  String caption,
  String urlProfilePhoto,
  bool userverify,
  BuildContext context
) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () {
              log("Clicked profile");
              // Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => ProfilPage( url: urlProfilePhoto)));
            },
            child: CircleAvatar(
              radius: 15,
              backgroundImage: NetworkImage(urlProfilePhoto),
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: (){
                  log("Clicked name");
                  Navigator.pushNamed(context, UsersProfiles.routeName,arguments:{"sId":post.owner!.sId!} );
                },
                child: Row(
                  children: [
                    Text(
                      userName,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(width: 5),
                    userverify
                        ? Icon(
                            Icons.verified_user,
                            size: 18,
                            color: Color(0xff0C9C28),
                          )
                        : SizedBox()
                  ],
                ),
              ),
              Text(
                caption,
                style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[500]),
              ),
            ],
          ),
        ],
      ),
      Icon(Icons.more_vert)
    ],
  );
}

Stack buildPostPicture(String urlPost, VoidCallback onPreass, bool likecolor,
    BuildContext context) {
  print(likecolor);
  return Stack(
    children: [
      Hero(
        tag: new Text(urlPost),
        child: GestureDetector(
          onLongPress: () {
            //  Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => FullScreenShowImage(urlPost: urlPost)));
          },
          child: Container(
            height: MediaQuery.of(context).size.width
            // - 70
            ,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.3),
                    spreadRadius: 2,
                    blurRadius: 20,
                    offset: Offset(0, 10),
                  ),
                ],
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: NetworkImage(urlPost),
                )),
          ),
        ),
      ),
      Positioned(
        bottom: 20,
        right: 20,
        child: InkWell(
          onTap: onPreass,
          child: Icon(Icons.favorite,
              size: 35,
              color: likecolor
                  ? Color.fromARGB(255, 255, 1, 1).withOpacity(0.7)
                  : Colors.white.withOpacity(0.7)),
        ),
      )
    ],
  );
}

Container buildStoryAvatar(String url) {
  return Container(
    margin: EdgeInsets.only(left: 18),
    height: 60,
    width: 60,
    padding: EdgeInsets.all(3),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30), color: Colors.red),
    child: CircleAvatar(
      radius: 18,
      backgroundImage: NetworkImage(url),
    ),
  );
}









