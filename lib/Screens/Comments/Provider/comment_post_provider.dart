import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_media_app_frontend_in_flutter/Utils/utils.dart';
import 'package:social_media_app_frontend_in_flutter/logic/cubits/comment_cubits/comment_cubits.dart';
import 'package:social_media_app_frontend_in_flutter/logic/cubits/comment_cubits/comment_state.dart';

class CommentPostProvider with ChangeNotifier {
  final BuildContext context;
  CommentPostProvider(this.context) {
    _listenToCommentCubit();
  }

  bool isLoading = false;

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  StreamSubscription? _userSubscription;

  void _listenToCommentCubit() {

    _userSubscription = BlocProvider.of<CommentsCubit>(context).stream.listen((commentState) {
      if(commentState is CommentPostLoadingState) {
        isLoading = true;
        notifyListeners();
      }
      else if(commentState is CommentPostErrorState) {
        isLoading = false;
        Utils.ftushBarErrorMessage(commentState.message,context);
        notifyListeners();
      }
      else {
        isLoading = false;
        notifyListeners();
      }


    });
  }



  

  @override
  void dispose() {
    _userSubscription?.cancel();
    super.dispose();
  }



  
}