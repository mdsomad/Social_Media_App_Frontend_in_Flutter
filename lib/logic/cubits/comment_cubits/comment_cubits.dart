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





//TODO: Create _fetchComments Function
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








//TODO: Create comment Function  
void comment(commentData) async {
    emit(CommentPostLoadingState(state.comments) );
  try {
    final comment = await _commentsRepository.comment(commentData,post);
    Loggerclass.logger.i(comment);
    emit(CommentsLoadedState(comment) );
  }
  catch(ex) {
    Loggerclass.logger.e(ex);
    emit(CommentPostErrorState(ex.toString(), state.comments) );
  }
}








//TODO: Create yourDeleteComment Function
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








//TODO: Create postOwnerDeleteComment Function
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