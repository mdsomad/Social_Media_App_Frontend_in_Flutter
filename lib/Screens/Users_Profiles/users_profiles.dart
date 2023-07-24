import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_media_app_frontend_in_flutter/Models/Post_Model.dart';
import 'package:social_media_app_frontend_in_flutter/Models/Use_profiledetels_model.dart';
import 'package:social_media_app_frontend_in_flutter/Screens/Auth/Login_Screen.dart';
import 'package:social_media_app_frontend_in_flutter/Screens/followers_following/followers_screen.dart';
import 'package:social_media_app_frontend_in_flutter/Screens/followers_following/following_Screen.dart';
import 'package:social_media_app_frontend_in_flutter/Screens/user_posts/user_posts_screen.dart';
import 'package:social_media_app_frontend_in_flutter/Services/session_manager.dart';
import 'package:social_media_app_frontend_in_flutter/logic/cubits/post_cubit/post_cubit.dart';
import 'package:social_media_app_frontend_in_flutter/logic/cubits/post_cubit/post_state.dart';
import 'package:social_media_app_frontend_in_flutter/logic/cubits/user_details/user_details_cubit.dart';
import 'package:social_media_app_frontend_in_flutter/logic/cubits/user_details/user_details_state.dart';
import 'package:social_media_app_frontend_in_flutter/logic/cubits/user_details/user_get_by_id_cubit.dart';
import 'package:social_media_app_frontend_in_flutter/logic/cubits/user_details/user_to_follow_cubit.dart';




class UsersProfiles extends StatelessWidget {
  dynamic data;
  static const String routeName = "usersProfiles";
  UsersProfiles({super.key, required this.data});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        BlocBuilder<UserGetByIdCubit, UserProfileState>(
          builder: (context, state) {
            if (state is UserProfileDetelsLoadingState) {
              return Expanded(
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            }

            if (state is UserProfileDetelsErrorState) {
              return Expanded(
                child: Center(
                  child: Text(state.message),
                ),
              );
            }

            if (state is UserProfileDetelsLoadedState) {
              return Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 35),
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                            onTap: () {
                              Navigator.of(context).pop();
                            },
                            child: Icon(Icons.arrow_back_ios)),
                      ],
                    ),
                  ),
                  Hero(
                    tag: "",
                    child: Container(
                      margin: EdgeInsets.only(top: 35),
                      height: 80,
                      width: 80,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            spreadRadius: 5,
                            blurRadius: 20,
                          )
                        ],
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(
                              state.userProfileDetels.avater!.url!),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        state.userProfileDetels.name!,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        width:
                            state.userProfileDetels.userverify == true ? 5 : 0,
                      ),
                      state.userProfileDetels.userverify == true
                          ? Icon(
                              Icons.verified_user,
                              size: 20,
                              color: Colors.green,
                            )
                          : SizedBox()
                    ],
                  ),
                  Text(
                    "London, England",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[400],
                    ),
                  ),

                   SizedBox(
                    height: data['sId'].toString() != SessionController().userid ? 20 :0,
                  ),

                  data['sId'].toString() != SessionController().userid ?  InkWell(
                    onTap: (){
                       BlocProvider.of<UserGetByIdCubit>(context).UserToFollow(data['sId'].toString());
                      log("Clicl");
                    },
                    child: buildStatFollowColumn(state.userProfileDetels.followers!.contains(SessionController().userid) ? "UnFollow" : "Follow")):SizedBox(),

                  const SizedBox(
                    height: 20,
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      buildStatColumn(
                          state.userProfileDetels.posts!.length.toString(),"Photos"), //* <-- Call buildStatColumn Function
                      InkWell(
                        onTap: () {
                          log("click");
                          UserProfileDetelsModel user = state.userProfileDetels;
                          Navigator.pushNamed(
                              context, FollowersScreen.routeName,
                              arguments: user);
                        },
                        child: buildStatColumn(
                            state.userProfileDetels.followers!.length
                                .toString(),
                            "Followers"),
                      ),
                      InkWell(
                        onTap: () {
                          UserProfileDetelsModel user = state.userProfileDetels;
                          Navigator.pushNamed(
                              context, FollowingScreen.routeName,
                              arguments: user);
                        },
                        child: buildStatColumn(
                            state.userProfileDetels.following!.length
                                .toString(),
                            "Following"),
                      ),
                    ],
                  ),
                ],
              );
            }

            return Text("No Data");
          },
        ),

        
        BlocBuilder<PostCubit, PostState>(
          builder: (context, state) {
            List<PostModel> filterPost = state.post
                .where(((element) => element.owner!.sId.toString() == data['sId'].toString()))
                .toList();

            return Expanded(
              child: Container(
                margin: EdgeInsets.only(left: 8, right: 8, top: 8),
                decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.15),
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(25))),
                child: GridView.builder(
                    itemCount: filterPost.length,
                    padding: EdgeInsets.symmetric(horizontal: 5, vertical: 8),
                    gridDelegate:
                        const SliverGridDelegateWithMaxCrossAxisExtent(
                            maxCrossAxisExtent: 200,
                            childAspectRatio: 3 / 2,
                            crossAxisSpacing: 20,
                            mainAxisSpacing: 20),
                    itemBuilder: (BuildContext context, int index) {
                      return InkWell(
                          onTap: () {
                            Navigator.pushNamed(context, UserPostScreen.routeName,arguments: {"sId":data['sId']});
                            log(index.toString());
                          },
                          child: buildPictureCard(
                              filterPost[index].images!.url.toString()));
                    }),
              ),
            );
          },
        )
      ],
    ));
  }







Material buildStatFollowColumn(String value,) {
    return Material(
      color: Colors.pink,
      borderRadius: BorderRadius.circular(20),
      child: Container(
         
         height: 40, 
         width: 130,
        child: Center(
          child: Text(
              value,
              style: TextStyle(
                fontSize: 16,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
        ),
      ),
    );
    
  }
















  // TODO Create buildPictureCard Function
  Card buildPictureCard(String url) {
    return Card(
      elevation: 10,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(url),
            )),
      ),
    );
  } 







// TODO Create buildStatColumn Function
  Column buildStatColumn(String value, String title) {
    return Column(
      children: [
        Text(
          value,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          title,
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.bold,
            color: Colors.grey[400],
          ),
        ),
      ],
    );
  }





  
}