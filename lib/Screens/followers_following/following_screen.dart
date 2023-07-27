import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_media_app_frontend_in_flutter/Models/Post_Model.dart';
import 'package:social_media_app_frontend_in_flutter/Models/Use_profiledetels_model.dart';
import 'package:social_media_app_frontend_in_flutter/Screens/Users_Profiles/users_profiles.dart';
import 'package:social_media_app_frontend_in_flutter/Screens/followers_following/followers_screen.dart';
import 'package:social_media_app_frontend_in_flutter/Services/session_manager.dart';
import 'package:social_media_app_frontend_in_flutter/logic/cubits/followers_following_cubits/followers_cubits.dart';
import 'package:social_media_app_frontend_in_flutter/logic/cubits/followers_following_cubits/followers_following_state.dart';
import 'package:social_media_app_frontend_in_flutter/logic/cubits/followers_following_cubits/following_cubits.dart';
import 'package:social_media_app_frontend_in_flutter/logic/cubits/user_details/user_get_by_id_cubit.dart';
import 'package:social_media_app_frontend_in_flutter/logic/cubits/user_details/user_to_follow_cubit.dart';





class FollowingScreen extends StatelessWidget {
  UserProfileDetelsModel user;
  FollowingScreen({super.key,required this.user});
  
  static const String routeName = "following";
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Following Screen"),
      ),

     body: BlocBuilder<FollowingCubit, FollowersFollowingState>(
        builder: (context, state) {
           
           if(state is FollowersFollowingLoadingState){
             return Center(child: CircularProgressIndicator(),);
           }


           if(state is FollowersFollowingErrorState){
              Center(child: Text(state.message),);
           }


          return state.followers_following.length > 0 ? Container(
      child: ListView(
        children:[

          

          for (var i = 0; i < state.followers_following.length; i++)
           Card(
                 child: Padding(
                   padding: const EdgeInsets.symmetric(vertical: 15),
                   child: ListTile(
                     leading: CircleAvatar(
                       backgroundColor: Colors.red,
                      radius:28,
                     backgroundImage: NetworkImage(state.followers_following[i].avater!.url! != "" ? state.followers_following[i].avater!.url.toString() :  "https://upload.wikimedia.org/wikipedia/commons/thumb/a/ac/No_image_available.svg/300px-No_image_available.svg.png?20221208232400",scale: 1.0),
                     
                     ),
                     title: InkWell(
                      onTap: (){
                         Navigator.pushNamed(context, UsersProfiles.routeName,arguments:{"sId":state.followers_following[i].sId!} );
                      },
                      child: Text(state.followers_following[i].name!,style:TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)),
                     
                     trailing:InkWell(
                      onTap: (){
                        BlocProvider.of<UserToFollowCubit>(context).UserToFollow(state.followers_following[i].sId!);
                        log("${state.followers_following[i].followers!.contains(user.sId.toString())}");
                      },
                      child: buildStatColumn(state.followers_following[i].followers!.contains(user.sId.toString()) ? "Following" : "follow",state.followers_following[i].followers!.contains(user.sId.toString())?true:false)
                   ),
                 ),
               )
           ),
           
           
           ]
      ),
      
    ): Center(child: Text("No Following yet",style: TextStyle(fontSize: 25,fontWeight:FontWeight.bold)));



           

        }
     )
      
    );
  }
}