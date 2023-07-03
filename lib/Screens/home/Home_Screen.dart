import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:developer' as devlog;

import 'package:logger/logger.dart';
import 'package:social_media_app_frontend_in_flutter/Models/Comments_Model.dart';
import 'package:social_media_app_frontend_in_flutter/Models/Post_Model.dart';
import 'package:social_media_app_frontend_in_flutter/Resources/Components/log.dart';
import 'package:social_media_app_frontend_in_flutter/Screens/followers_following/following_screen.dart';
import 'package:social_media_app_frontend_in_flutter/Screens/home/Widgets/BottomSheet_Widget.dart';
import 'package:social_media_app_frontend_in_flutter/Screens/home/Widgets/HomeView.dart';
import 'package:social_media_app_frontend_in_flutter/Screens/home/Widgets/home_list_view_widget.dart';
import 'package:social_media_app_frontend_in_flutter/Screens/Comments/comment_screen.dart';
import 'package:social_media_app_frontend_in_flutter/Services/session_manager.dart';
import 'package:social_media_app_frontend_in_flutter/logic/cubits/comment_cubits/comment_cubits.dart';
import 'package:social_media_app_frontend_in_flutter/logic/cubits/comment_cubits/comment_state.dart';
import 'package:social_media_app_frontend_in_flutter/logic/cubits/post_cubit/post_cubit.dart';
import 'package:social_media_app_frontend_in_flutter/logic/cubits/post_cubit/post_state.dart';
import 'package:social_media_app_frontend_in_flutter/logic/cubits/user_cubit/user_cubit.dart';
import 'package:social_media_app_frontend_in_flutter/logic/cubits/user_cubit/user_state.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  static const String routeName = "home";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late String id;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<PostCubit, PostState>(
        builder: (context, state) {
          if (state is PostLoadingState) {
            return Center(child: CircularProgressIndicator());
          }

          if (state is PostErrorState) {
            return Center(child: Text(state.message));
          }

          return HomeView(allPosts: state.post,);
          
          //  ListView.builder(
          //   shrinkWrap: true,
          //   itemCount: state.post.length,
          //   itemBuilder: (context, index) {
          //     var post = state.post[index];
          //     return HomeListView(
          //         post: post,
          //         userName: post.owner!.name.toString(),
          //         caption: post.caption!,
          //         urlPost: post.image!.url!,
          //         urlProfilePhoto: post.owner!.avater!.url.toString(),
          //         userverify: post.owner!.userverify as bool,
          //         likes: post.likes!.length.toString(),
          //         onPreass: () {
                    
          //           BlocProvider.of<PostCubit>(context).PostLink(sId: post.sId!);
          //           log("Usi Id Call --> ${SessionController().userid.toString()}");
          //           // log(SessionControllerTolen().token.toString());
          //         },
          //         likecolor: post.likes!.contains(SessionController().userid)
          //             ? true
          //             : false,
          //         commentonPress: () {
          //           log("Clicked Comment Button");
          //            Navigator.pushNamed(context, CommentScreen.routeName, arguments: post);              
          //         }
                  
                  
          //         );
          //   },
          // );




        },
      ),
    );
  }









}

