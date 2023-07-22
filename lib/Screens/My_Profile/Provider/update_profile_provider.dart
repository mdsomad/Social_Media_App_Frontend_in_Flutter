import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_media_app_frontend_in_flutter/Utils/utils.dart';
import 'package:social_media_app_frontend_in_flutter/logic/cubits/post_cubit/post_cubit.dart';
import 'package:social_media_app_frontend_in_flutter/logic/cubits/user_details/user_details_cubit.dart';
import 'package:social_media_app_frontend_in_flutter/logic/cubits/user_details/user_details_state.dart';

class UpdateProfileProvider with ChangeNotifier {
  final BuildContext context;
  UpdateProfileProvider(this.context) {
    _listenToPostCubit();
  }

  bool isLoading = false;
  String error = "";

  
  

  StreamSubscription? _userSubscription;



  void _listenToPostCubit() {

    _userSubscription = BlocProvider.of<UserProfileDetelsCubit>(context).stream.listen((userProfileDetelsCubit) {
      if(userProfileDetelsCubit is UserProfileUpdateLoadingState) {
        isLoading = true;
        error = "";
        notifyListeners();
      }
      else if(userProfileDetelsCubit is UserProfileUpdateErrorState) {
        isLoading = false;
        error = userProfileDetelsCubit.message;
        log('UserProfileUpdateErrorState ${userProfileDetelsCubit.message}');
        Utils.ftushBarErrorMessage(error,context);
        notifyListeners();
      }
      else {
        isLoading = false;
        error = "";
        notifyListeners();
      }


    });
  }




//TODO Create postUpload Function
// void UserProfile(Userdm) async {
//      BlocProvider.of<PostCubit>(context).PostUpload(file:file,caption:addCaptionController.text.toString());
// }



@override
void dispose() {
  _userSubscription?.cancel();
  super.dispose();
}



  
}