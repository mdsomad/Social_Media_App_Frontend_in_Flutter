import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_media_app_frontend_in_flutter/Models/Use_profiledetels_model.dart';
import 'package:social_media_app_frontend_in_flutter/Screens/Users_Profiles/users_profiles.dart';
import 'package:social_media_app_frontend_in_flutter/Services/session_manager.dart';
import 'package:social_media_app_frontend_in_flutter/logic/cubits/followers_following_cubits/followers_cubits.dart';
import 'package:social_media_app_frontend_in_flutter/logic/cubits/followers_following_cubits/followers_following_state.dart';
import 'package:social_media_app_frontend_in_flutter/logic/cubits/user_details/user_get_by_id_cubit.dart';





class FollowersScreen extends StatelessWidget {
   UserProfileDetelsModel userData;
   FollowersScreen({super.key,required this.userData});

  static const String routeName = "followers";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Followers Screen"),
      ),

     body: BlocBuilder<FollowersCubit, FollowersFollowingState>(
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
                    backgroundImage: NetworkImage( state.followers_following[i].avater!.url! != "" ? state.followers_following[i].avater!.url!: "https://upload.wikimedia.org/wikipedia/commons/thumb/a/ac/No_image_available.svg/300px-No_image_available.svg.png?20221208232400" ,scale: 1.0),
                     
                     ),
                     title: InkWell(
                      onTap: (){
                        log("Click name");
                         Navigator.pushNamed(context, UsersProfiles.routeName,arguments:{"sId":state.followers_following[i].sId!} );
                      },
                      child: Text(state.followers_following[i].name!,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)),
                     
                     trailing:InkWell(
                      onTap: (){
                       
                        log("following"+state.followers_following[i].sId!.toString());
                      },
                      child: buildStatColumn(state.followers_following[i].followers!.contains(userData.sId.toString()) ? "UnFollow" : "follow",state.followers_following[i].followers!.contains(userData.sId.toString())?true:false,)
                   ),
                 ),
               )
           ),]
      ),
      
    ):Center(child: Text("No Following yet",style: TextStyle(fontSize: 25,fontWeight:FontWeight.bold)));



           

        }
     )
     
     
     
     
    );
  }
}




Material buildStatColumn(String value,bool color) {
    return Material(
      color:color ? Colors.grey : Colors.pink,
      borderRadius: BorderRadius.circular(30),
      child: Container(
         
         height: 40, 
         width: 100,
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