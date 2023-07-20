import 'package:social_media_app_frontend_in_flutter/Models/Comments_Model.dart';




abstract class ChangePasswordState {}


class ChangePasswordInitialState extends ChangePasswordState {}


class ChangePasswordLoadingState extends ChangePasswordState {}


class ChangePasswordSuccessfullyState extends ChangePasswordState {
  final String successMessage;
  ChangePasswordSuccessfullyState(this.successMessage,);
}


class ChangePasswordErrorState extends ChangePasswordState  {
  final String message;
  ChangePasswordErrorState(this.message);
}