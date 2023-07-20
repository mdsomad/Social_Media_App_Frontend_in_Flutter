import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:social_media_app_frontend_in_flutter/Screens/Settings/Widgets/change_password_screen.dart';




class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

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
        )
      ]),
    );
  }
}