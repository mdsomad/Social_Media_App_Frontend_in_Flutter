import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_media_app_frontend_in_flutter/Models/Post_Model.dart';
import 'package:social_media_app_frontend_in_flutter/Utils/utils.dart';
import 'package:social_media_app_frontend_in_flutter/logic/cubits/post_cubit/post_cubit.dart';
import 'package:social_media_app_frontend_in_flutter/logic/cubits/post_cubit/post_state.dart';

class PostDeleteProvider with ChangeNotifier {
  final BuildContext context;
  PostDeleteProvider(this.context) {
    _listenToPostCubit();
  }

  bool isLoading = false;
  String error = "";

  
  StreamSubscription? _userSubscription;



  void _listenToPostCubit() {

    _userSubscription = BlocProvider.of<PostCubit>(context).stream.listen((postState) {
      if(postState is PostDeleteLoadingState ) {
        isLoading = true;
        error = "";
        notifyListeners();
      }
      else if(postState is PostDeleteErrorState) {
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
Future <bool>postDeletCaption({required PostModel post}) async {
    return BlocProvider.of<PostCubit>(context).PostDelete(post: post);
}



@override
void dispose() {
  _userSubscription?.cancel();
  super.dispose();
}



  
}