import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_media_app_frontend_in_flutter/Utils/utils.dart';
import 'package:social_media_app_frontend_in_flutter/logic/cubits/post_cubit/post_cubit.dart';
import 'package:social_media_app_frontend_in_flutter/logic/cubits/post_cubit/post_state.dart';


class PostUploadProvider with ChangeNotifier {
  final BuildContext context;
  PostUploadProvider(this.context) {
    _listenToPostCubit();
  }

  bool isLoading = false;
  String error = "";

  
  final addCaptionController = new TextEditingController();
  StreamSubscription? _userSubscription;



  void _listenToPostCubit() {

    _userSubscription = BlocProvider.of<PostCubit>(context).stream.listen((postState) {
      if(postState is PostUploadLoadingState) {
        isLoading = true;
        error = "";
        notifyListeners();
      }
      else if(postState is PostUploadErrorState) {
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
void postUpload(File file) async {
     BlocProvider.of<PostCubit>(context).PostUpload(file:file,caption:addCaptionController.text.toString());
}



@override
void dispose() {
    addCaptionController.dispose();
  _userSubscription?.cancel();
  super.dispose();
}



  
}