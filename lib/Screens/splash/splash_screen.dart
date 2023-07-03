import 'dart:async';
import 'dart:developer';


import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_media_app_frontend_in_flutter/Screens/Auth/Login_Screen.dart';
import 'package:social_media_app_frontend_in_flutter/Screens/home/Home_Screen.dart';
import 'package:social_media_app_frontend_in_flutter/Screens/main_screen.dart';
import 'package:social_media_app_frontend_in_flutter/logic/cubits/user_cubit/user_cubit.dart';
import 'package:social_media_app_frontend_in_flutter/logic/cubits/user_cubit/user_state.dart';





class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  static const String routeName = "splash";

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {


 void goToNextScreen() {
    UserState userState = BlocProvider.of<UserCubit>(context).state;
    if(userState is UserLoggedInState) {
      Navigator.popUntil(context, (route) => route.isFirst);
      Navigator.pushReplacementNamed(context, MainScreen.routeName);
      log('is UserLoggedInState');
      
    }
    else if(userState is UserLoggedOutState) {
      Navigator.popUntil(context, (route) => route.isFirst);
      Navigator.pushReplacementNamed(context, LoginScreen.routeName);
       log('is UserLoggedOutState');
     
    }
    else if(userState is UserErrorState) {
      Navigator.popUntil(context, (route) => route.isFirst);
      Navigator.pushReplacementNamed(context, LoginScreen.routeName);
      log('is UserErrorState');

    }
  }


  @override
  void initState() {
    super.initState();
    Timer(const Duration(milliseconds: 100), () {
      goToNextScreen();
    });
  }


  
  @override
  Widget build(BuildContext context) {
    return BlocListener<UserCubit, UserState>(
      listener: (context, state) {
        goToNextScreen();
      },
      child: const Scaffold(
          body: Center(
            child: Text("SplashScreen")
          ),
      ),
    );
  }
}