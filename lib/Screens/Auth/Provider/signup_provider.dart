import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_media_app_frontend_in_flutter/logic/cubits/user_cubit/user_cubit.dart';
import 'package:social_media_app_frontend_in_flutter/logic/cubits/user_cubit/user_state.dart';

class SignupProvider with ChangeNotifier {
  final BuildContext context;
  SignupProvider (this.context) {
    _listenToUserCubit();
  }

  bool isLoading = false;
  String error = "";

  final userNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final cPasswordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  StreamSubscription? _userSubscription;

  void _listenToUserCubit() {
    
    _userSubscription = BlocProvider.of<UserCubit>(context).stream.listen((userState) {
      if(userState is UserLoadingState) {
        isLoading = true;
        error = "";
        notifyListeners();
      }
      else if(userState is UserErrorState) {
        isLoading = false;
        error = userState.message;
        notifyListeners();
      }
      else {
        isLoading = false;
        error = "";
        notifyListeners();
      }


    });
  }



  

  void createAccount() async {
    if(!formKey.currentState!.validate()) return;

    String userName = userNameController.text.trim();
    String email = emailController.text.trim();
    String password = passwordController.text.trim();
    
    BlocProvider.of<UserCubit>(context).createAccount(userName:userName, email: email, password: password);
  }

  @override
  void dispose() {
    _userSubscription?.cancel();
    super.dispose();
  }



}