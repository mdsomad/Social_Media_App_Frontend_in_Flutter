import 'package:social_media_app_frontend_in_flutter/Models/Comments_Model.dart';

abstract class CommentsState {
  final List<CommentsModel> comments;
  CommentsState(this.comments);
}

class CommentsInitialState extends CommentsState {
  CommentsInitialState() : super([]);
}

class CommentsLoadingState extends CommentsState {
  CommentsLoadingState(super.comments);
}

class CommentsLoadedState extends CommentsState {
  CommentsLoadedState(super.comments);
}

class CommentsErrorState extends CommentsState {
  final String message;
  CommentsErrorState(this.message, super.comments);
}