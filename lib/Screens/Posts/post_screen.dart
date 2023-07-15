import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:logger/logger.dart';
import 'package:social_media_app_frontend_in_flutter/Resources/Components/log.dart';
import 'package:social_media_app_frontend_in_flutter/Screens/Posts/addcaption_screen.dart';
import 'package:social_media_app_frontend_in_flutter/Utils/utils.dart';
import 'package:social_media_app_frontend_in_flutter/logic/cubits/post_cubit/post_cubit.dart';


class PostScreen extends StatelessWidget {
   PostScreen({super.key});


 final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();


//TODO: Create videoPick Function
 videoPick(ImageSource src ,BuildContext context) async {
  final _pickedImage  = await ImagePicker().pickImage(source: src);     
  if (_pickedImage  != null) {
       log("Image picked");
       Navigator.pushNamed(context, AddCaptionScreen.routeName,
       arguments: {
        "imageFile":File(_pickedImage.path)
        });
    
  } else {
   Loggerclass.logger.e("Error In Selecting Video Please Choose A Different Video File");
    Utils.ftushBarErrorMessage("Error In Selecting Video Please Choose A Different Video File", context);

  }
}






//TODO: Create showDialogOpt Function
showDialogOpt(BuildContext context) {
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          content: Container(
              height: MediaQuery.of(context).size.height * .2,
              child: Column(
                children: [



                  ListTile(
                    onTap: (){
                      
                        log("Click Camera");
                        videoPick(ImageSource.camera,context); //* <-- This videoPick function Call

                        //  Timer(const Duration(milliseconds: 100), () {
                        //     Navigator.of(context).pop();
                        //   });
                       
                        
                    },

                    leading: const Icon(
                      Icons.camera,
                      color: Colors.pink,
                    ),
                    title: const Text('Camera'),
                  ),


                  ListTile(
                    onTap: (){
                      //  Navigator.pop(context);
                      log("Click Gallery");
                      videoPick(ImageSource.gallery,context);  //* <-- This videoPick Function Call
                         
                          // Navigator.pop(context, true);
                      //  Timer(const Duration(seconds:3), () {
                      //       Navigator.pop(context);
                      //   });
                    },
                    title: const Text('Gallery'),
                    leading: const Icon(
                      Icons.photo,
                      color: Colors.pink,
                    ),
                  ),



                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      TextButton(
                          onPressed: () {
                              log("Click Cancal");
                            Navigator.pop(context);
                          },
                          child: Text("Cancal")),
                    ],
                  ),



                ],
              )
            ),


        );
      });
}





  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Post Screen"),
      ),


     body: Center(
        child: InkWell(
          onTap: (){
            showDialogOpt(context);
            // Navigator.pop(context);
            ;}, //* <-- Call This showDialogOpt Function
          child: Container(
            width: 190,
            height: 50,
            decoration: BoxDecoration(color:Colors.red),
            child: Center(
              child: Text(
                "Add Video",
                style: TextStyle(
                    fontSize: 25,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
      ),
      
      
    );
  }
}