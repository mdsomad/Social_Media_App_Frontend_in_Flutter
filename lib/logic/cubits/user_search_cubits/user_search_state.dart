//TODO: Create UserSearchState abstract Class
import 'package:social_media_app_frontend_in_flutter/Models/Post_Model.dart';
import 'package:social_media_app_frontend_in_flutter/Models/Use_profiledetels_model.dart';

abstract class UserSearchState {
  final List<UserProfileDetelsModel> searchUser;
  UserSearchState(this.searchUser);
}

class SearchUserInitialState extends UserSearchState {
  SearchUserInitialState() : super([]);
}

class SearchUserLoadingState extends UserSearchState {
  SearchUserLoadingState(super.searchUser);
}

class SearchUserLoadedState extends UserSearchState {
  SearchUserLoadedState(super.searchUser);
}

class SearchUserErrorState extends UserSearchState {
  final String message;
  SearchUserErrorState(this.message, super.searchUser);
}