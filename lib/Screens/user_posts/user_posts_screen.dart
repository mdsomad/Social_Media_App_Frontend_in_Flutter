import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_media_app_frontend_in_flutter/Models/Post_Model.dart';
import 'package:social_media_app_frontend_in_flutter/Screens/home/Widgets/HomeView.dart';
import 'package:social_media_app_frontend_in_flutter/Screens/Comments/comment_screen.dart';
import 'package:social_media_app_frontend_in_flutter/Services/session_manager.dart';
import 'package:social_media_app_frontend_in_flutter/logic/cubits/post_cubit/post_cubit.dart';
import 'package:social_media_app_frontend_in_flutter/logic/cubits/post_cubit/post_state.dart';
import 'package:social_media_app_frontend_in_flutter/logic/cubits/user_details/user_details_cubit.dart';
import 'package:social_media_app_frontend_in_flutter/logic/cubits/user_details/user_details_state.dart';

class UserPostScreen extends StatelessWidget {
  dynamic data;
  UserPostScreen({super.key,required this.data});

  static const String routeName = "UserPostScreen";
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<PostCubit, PostState>(
        builder: (context, state) {
         List<PostModel> filterPost = state.post.where(((element) => element.owner!.sId.toString() == data['sId'].toString() )).toList();
          return HomeView(isUserPosts:true,allPosts:filterPost,);
        },
      ),
    );
  }
}
