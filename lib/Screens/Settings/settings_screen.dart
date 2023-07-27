import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_media_app_frontend_in_flutter/Models/Use_profiledetels_model.dart';
import 'package:social_media_app_frontend_in_flutter/Screens/My_Profile/update_profile.dart';
import 'package:social_media_app_frontend_in_flutter/Screens/Settings/Widgets/change_password_screen.dart';
import 'package:social_media_app_frontend_in_flutter/Screens/splash/splash_screen.dart';
import 'package:social_media_app_frontend_in_flutter/logic/cubits/user_cubit/user_cubit.dart';




class SettingsScreen extends StatelessWidget {
  final UserProfileDetelsModel userModel;
  const SettingsScreen({super.key,required this.userModel});

   static const String routeName = "settingsScreen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text("Settings Screen"),
      ),
      body: ListView(children: [
        ListTile(
          onTap: (){
            log("Clicked Change password");
            Navigator.pushNamed(context, ChangePasswordScreen.routeName);
          },
          leading: Icon(Icons.key),
          title: Text("Change Password"),
        ),

        ListTile(
          onTap: (){
            log("Clicked Update Profile");
            Navigator.pushNamed(context, UpdateScreen.routeName,arguments:userModel);
          },
          leading: Icon(Icons.edit),
          title: Text("Update Profile"),
        ),
        ListTile(
          onTap: (){
            log("Clicked Delete Account");
            BlocProvider.of<UserCubit>(context).deleteAccount(context).then((value) {
               if(value == true){
                  BlocProvider.of<UserCubit>(context).signOut().then((value) {
                    Navigator.pushNamed(context, SplashScreen.routeName);});
               }
                                                   
                                                  });
            // Navigator.pushNamed(context, UpdateScreen.routeName,arguments:userModel);
          },
          leading: Icon(Icons.person,color: Colors.red,),
          title: Text("Delete Account "),
        ),
      ]),
    );
  }
}