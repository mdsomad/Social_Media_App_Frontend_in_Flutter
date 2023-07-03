import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_media_app_frontend_in_flutter/Models/Post_Model.dart';
import 'package:social_media_app_frontend_in_flutter/Repository/comments_repository.dart';
import 'package:social_media_app_frontend_in_flutter/Resources/Components/log.dart';
import 'package:social_media_app_frontend_in_flutter/logic/cubits/comment_cubits/comment_state.dart';

class CommentsCubit extends Cubit<CommentsState> {
 final PostModel post;
  CommentsCubit(this.post) : super( CommentsInitialState() ) {
   _fetchComments();
    Loggerclass.logger.i("CommentsInitialState Yes");
  }

  final _commentsRepository = CommentsRepository();

  void  _fetchComments() async {
    emit(CommentsLoadingState(state.comments) );
    try {
      final comment = await _commentsRepository.fetchComments(post.sId!);
      Loggerclass.logger.i(comment);
      emit(CommentsLoadedState(comment) );
    }
    catch(ex) {
      Loggerclass.logger.e(ex);
      emit( CommentsErrorState(ex.toString(), state.comments) );
    }
  }



  
  void comment(commentData) async {
    // emit(CommentsLoadingState(state.comments) );
    try {
      final comment = await _commentsRepository.comment(commentData,post);
      Loggerclass.logger.i(comment);
      emit(CommentsLoadedState(comment) );
    }
    catch(ex) {
      Loggerclass.logger.e(ex);
      emit(CommentsErrorState(ex.toString(), state.comments) );
    }
  }




  void yourDeleteComment(commentId) async {
    try {
      final comment = await _commentsRepository.yourDeleteComment(commentId,post);
      Loggerclass.logger.i(comment);
      emit(CommentsLoadedState(comment) );
    }
    catch(ex) {
      Loggerclass.logger.e(ex);
      emit(CommentsErrorState(ex.toString(), state.comments) );
    }
  }




  void postOwnerDeleteComment(commentId) async {
    try {
      final comment = await _commentsRepository.postOwnerDeleteComment(commentId,post);
      Loggerclass.logger.i(comment);
      emit(CommentsLoadedState(comment) );
    }
    catch(ex) {
      Loggerclass.logger.e(ex);
      emit(CommentsErrorState(ex.toString(), state.comments) );
    }
  }




// TODO: Create updateComments function 
void updateComment({required String commentId, required String upDateComment}) async {
    try {
      final comment = await _commentsRepository.updateComment(commentId:commentId,upDateComment:upDateComment ,post:post);
      Loggerclass.logger.i("UpdateComment --> $comment");
      emit(CommentsLoadedState(comment) );
    }
    catch(ex) {
      Loggerclass.logger.e(ex);
      emit(CommentsErrorState(ex.toString(), state.comments) );
    }
  }






}