import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:social_media_app_frontend_in_flutter/Resources/Colors/app_colors.dart';
import 'package:social_media_app_frontend_in_flutter/Resources/Components/log.dart';
import 'package:social_media_app_frontend_in_flutter/Resources/Components/primary_button.dart';
import 'package:social_media_app_frontend_in_flutter/Resources/Components/round_button.dart';
import 'package:social_media_app_frontend_in_flutter/Screens/Posts/Provider/post_upload_provider.dart';
import 'package:social_media_app_frontend_in_flutter/logic/cubits/post_cubit/post_cubit.dart';




class AddCaptionScreen extends StatefulWidget {
  dynamic data;
 AddCaptionScreen({super.key,required this.data});

  static const String routeName = "addCaption";

  @override
  State<AddCaptionScreen> createState() => _AddCaptionScreenState();
}

class _AddCaptionScreenState extends State<AddCaptionScreen> {

  TextEditingController addCaptionController = new TextEditingController();
  
  
  
  @override
  Widget build(BuildContext context) {

    final provider = Provider.of<PostUploadProvider>(context);
    
    return Scaffold(
      appBar: AppBar(
        title: Text("Add caption"),
      ),
      
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Container(
                height: 500,
                width: double.infinity,
                color: Colors.red,
                child: Image.file(widget.data["imageFile"].absolute,
                fit:BoxFit.cover,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(15),
                child: TextField(
                  controller: provider.addCaptionController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    label: Text("Add Caption")
                  ),
                ),
              ),

                SizedBox(
                  height: 10,
                ),
            
               Padding(
                 padding: const EdgeInsets.all(15),
                 child: RoundButton(
                  onTap: (){
                     provider.postUpload(widget.data["imageFile"]);     //* <-- postUpload Function Call
                 },
                  title: "Post Upload",
                   loading: provider.isLoading,
               
                 ),
               ),

             

              
            ],
          ),
        ),
      )
      
      
    );
  }
}