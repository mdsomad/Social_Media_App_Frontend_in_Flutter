import 'package:social_media_app_frontend_in_flutter/Models/Use_profiledetels_model.dart';

abstract class UserProfileState {}


class UserProfileDetelsInitialState extends UserProfileState {}


class UserProfileDetelsLoadingState extends UserProfileState {}


class UserProfileDetelsLoadedState extends UserProfileState {
  final UserProfileDetelsModel userProfileDetels;
  UserProfileDetelsLoadedState(this.userProfileDetels);
}


class UserProfileDetelsErrorState extends UserProfileState  {
  final String message;
  UserProfileDetelsErrorState(this.message);
}












class UserProfileUpdateLoadingState extends UserProfileState {}


class UserProfileUpdateSussesState extends UserProfileState {
  final String userProfileSusses;
  UserProfileUpdateSussesState(this.userProfileSusses);
}




class UserProfileUpdateErrorState extends UserProfileState  {
  final String message;
  UserProfileUpdateErrorState(this.message);
}