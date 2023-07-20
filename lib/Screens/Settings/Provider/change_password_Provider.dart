import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_media_app_frontend_in_flutter/Utils/utils.dart';
import 'package:social_media_app_frontend_in_flutter/logic/cubits/change_password_cubits/change_password_cubits.dart';
import 'package:social_media_app_frontend_in_flutter/logic/cubits/change_password_cubits/change_password_state.dart';






class ChangePasswordProvider with ChangeNotifier {
  final BuildContext context;
  ChangePasswordProvider(this.context) {
    _listenToPostCubit();
  }

  bool isLoading = false;
  String error = "";

  
  final oldPasswordController = new TextEditingController();
  final newPasswordController = new TextEditingController();
  final cPasswordController = new TextEditingController();
  final formKey = GlobalKey<FormState>();
  StreamSubscription? _userSubscription;



  void _listenToPostCubit() {

    _userSubscription = BlocProvider.of<ChangePasswordCubit>(context).stream.listen((changePaddwordResponse) {
      if(changePaddwordResponse is ChangePasswordLoadingState) {
        isLoading = true;
        error = "";
        notifyListeners();
      }else if(changePaddwordResponse is ChangePasswordSuccessfullyState){
         Utils.ftushBarSussessMessage(changePaddwordResponse.successMessage.toString(),context);
         isLoading = false;
         notifyListeners();

      }
      else if(changePaddwordResponse is ChangePasswordErrorState) {
        isLoading = false;
        error = changePaddwordResponse.message;
        notifyListeners();
      }
      else {
        isLoading = false;
        error = "";
        notifyListeners();
      }


    });
  }




//TODO Create ChangePassword Function
void ChangePassword() async {
  if(!formKey.currentState!.validate()) return;
  
  if(newPasswordController.text != cPasswordController.text){
   log( "password does not match");
    Utils.ftushBarErrorMessage("Password does not match Confirm Password",context);
  }else{
     BlocProvider.of<ChangePasswordCubit>(context).ChangePassword(OldPassWord:oldPasswordController.text.toString(),NewPassword: newPasswordController.text.toString());
  }
  
}



@override
void dispose() {
  _userSubscription?.cancel();
  super.dispose();
}



  
}