import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_media_app_frontend_in_flutter/Utils/utils.dart';
import 'package:social_media_app_frontend_in_flutter/logic/cubits/post_cubit/post_cubit.dart';
import 'package:social_media_app_frontend_in_flutter/logic/cubits/post_cubit/post_state.dart';

class PostEditCaptionProvider with ChangeNotifier {
  final BuildContext context;
  PostEditCaptionProvider(this.context) {
    _listenToPostCubit();
  }

  bool isLoading = false;
  String error = "";

  
  final updateCaptionController = new TextEditingController();
  StreamSubscription? _userSubscription;



  void _listenToPostCubit() {

    _userSubscription = BlocProvider.of<PostCubit>(context).stream.listen((postState) {
      if(postState is UpdateCaptionLoadingState ) {
        isLoading = true;
        error = "";
        notifyListeners();
      }
      else if(postState is UpdateCaptionErrorState) {
        isLoading = false;
        error = postState.message;
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
void postUpdateCaption(String sId) async {
     BlocProvider.of<PostCubit>(context).UpdateCaption(sId:sId,caption:updateCaptionController.text.toString());
}



@override
void dispose() {
    updateCaptionController.dispose();
  _userSubscription?.cancel();
  super.dispose();
}



  
}