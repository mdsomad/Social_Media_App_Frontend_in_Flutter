//TODO: Create PostState abstract Class
import 'package:social_media_app_frontend_in_flutter/Models/Post_Model.dart';

abstract class PostState {
  final List<PostModel> post;
  PostState(this.post);
}

class PostInitialState extends PostState {
  PostInitialState() : super([]);
}

class PostLoadingState extends PostState {
  PostLoadingState(super.post);
}

class PostLoadedState extends PostState {
  PostLoadedState(super.post);
}

class PostErrorState extends PostState {
  final String message;
  PostErrorState(this.message, super.post);
}