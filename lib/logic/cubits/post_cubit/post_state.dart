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







//TODO Create PostUpload Functions PostState
class PostUploadLoadingState extends PostState {
  PostUploadLoadingState(super.post);
}


class PostUploadErrorState extends PostState {
  final String message;
  PostUploadErrorState(this.message, super.post);
}








//TODO Create PostUpdateCaption Functions PostState
class UpdateCaptionLoadingState extends PostState {
  UpdateCaptionLoadingState(super.post);
}


class UpdateCaptionErrorState extends PostState {
  final String message;
  UpdateCaptionErrorState(this.message, super.post);
}














//TODO Create PostDelete Functions PostState
class PostDeleteLoadingState extends PostState {
  PostDeleteLoadingState(super.post);
}


class PostDeleteErrorState extends PostState {
  final String message;
  PostDeleteErrorState(this.message, super.post);
}