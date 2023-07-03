//TODO: Create PostCubit Class

import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';
import 'package:social_media_app_frontend_in_flutter/Models/Post_Model.dart';
import 'package:social_media_app_frontend_in_flutter/Repository/post_repository.dart';
import 'package:social_media_app_frontend_in_flutter/Resources/Components/log.dart';
import 'package:social_media_app_frontend_in_flutter/logic/cubits/post_cubit/post_state.dart';

class PostCubit extends Cubit<PostState> {
  PostCubit() : super( PostInitialState() ) {
    _initialize();
    Loggerclass.logger.i("PostInitialState Yes");
  }

  final _postRepository = PostRepository();

  void _initialize() async {
    emit(PostLoadingState(state.post) );
    try {
      final post = await _postRepository.fetchAllPost();
      Loggerclass.logger.i(post);
      emit(PostLoadedState(post) );
    }
    catch(ex) {
      emit( PostErrorState(ex.toString(), state.post) );
    }
  }



   // TODO Create User signIn function
  void PostLink({
    required String sId,
  }) async {
    try {
      PostModel postLiked = await _postRepository.LikeAndUnlikePost(sId);
       

      int index = state.post.indexOf(postLiked);
      if(index == -1) return;

      List<PostModel> newList = state.post;
       newList[index] = postLiked;
       emit(PostLoadedState(newList));


    } catch(ex) {
      Loggerclass.logger.e(ex.toString());
      emit( PostErrorState(ex.toString(), state.post) );
    }
  }





// TODO: Create sortAndLoad function
  void sortAndLoad(List<PostModel> posts) {
    // posts.sort((a, b) => b.createdAt.compareTo(a.createdAt));
    emit(PostLoadedState(posts));
  }



}