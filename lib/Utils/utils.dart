import 'package:another_flushbar/flushbar.dart';
import 'package:another_flushbar/flushbar_route.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:social_media_app_frontend_in_flutter/Resources/Colors/app_colors.dart';

class Utils {

 


  //TODO Fluttertoast Message
  static toastMessage(String message, bool isCenter ,{Color color = Colors.purple}) {
    Fluttertoast.showToast(msg: message,
      backgroundColor: color,
      textColor: Colors.white,
      gravity: isCenter ? ToastGravity.CENTER : ToastGravity.NONE,
      fontSize: 15
    );
    
  }








  //TODO ftushBarErrorMessage function create
  static void ftushBarErrorMessage(String message,BuildContext context){         //* <-- ERROR Message Show karne ka kaam Aata hai
     showFlushbar(
      context: context,
      flushbar: Flushbar(
        message: message,
        forwardAnimationCurve: Curves.decelerate,
        margin: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
        padding: EdgeInsets.all(15),
        backgroundColor: Colors.red,
        reverseAnimationCurve: Curves.easeInOut,
        positionOffset: 20,
        duration: Duration(seconds: 3),
        borderRadius: BorderRadius.circular(10),
        flushbarPosition: FlushbarPosition.TOP,
        icon: Icon(Icons.error,color: AppColor.white,),
      )..show(context)
      );
  }




  //TODO ftushBarSussessMessage function create
  static void ftushBarSussessMessage(String message,BuildContext context){         //* <-- ERROR Message Show karne ka kaam Aata hai
     showFlushbar(
      context: context,
      flushbar: Flushbar(
        message: message,
        forwardAnimationCurve: Curves.decelerate,
        margin: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
        padding: EdgeInsets.all(15),
        backgroundColor: Colors.green,
        reverseAnimationCurve: Curves.easeInOut,
        positionOffset: 20,
        duration: Duration(seconds: 5),
        borderRadius: BorderRadius.circular(10),
        flushbarPosition: FlushbarPosition.TOP,
        icon: Icon(Icons.file_download_done,color: AppColor.white,),
      )..show(context)
      );
  }







// TODO snackBar Function create
static snackBar(String message,BuildContext context){
   return ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: Colors.red,
      content: Text(message)
      ) 
   );
  
}





}


