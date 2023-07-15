

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_media_app_frontend_in_flutter/Routes/routes.dart';
import 'package:social_media_app_frontend_in_flutter/Screens/splash/splash_screen.dart';
import 'package:social_media_app_frontend_in_flutter/logic/cubits/comment_cubits/comment_cubits.dart';
import 'package:social_media_app_frontend_in_flutter/logic/cubits/post_cubit/post_cubit.dart';
import 'package:social_media_app_frontend_in_flutter/logic/cubits/user_cubit/user_cubit.dart';
import 'package:social_media_app_frontend_in_flutter/logic/cubits/user_details/user_details_cubit.dart';
import 'package:social_media_app_frontend_in_flutter/logic/cubits/user_details/user_to_follow_cubit.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  // UserCubit cubit = UserCubit();
  // cubit.signOut();
  Bloc.observer = MyBlocObserver();
  
  runApp(const MyApp());
} 

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(

       providers: [

  
        BlocProvider(create: (context) => UserCubit()),
        BlocProvider(create: (context) => PostCubit()),
        BlocProvider(create: (context) => UserToFollowCubit()),
      
      ],
      
      
      
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Socail Media App',
        theme: ThemeData.dark().copyWith(
          navigationBarTheme: NavigationBarThemeData(
          backgroundColor: Colors.black,
          indicatorColor: Color(0xffFF0000),
          labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
          labelTextStyle: MaterialStateProperty.resolveWith(
              (states) => states.contains(MaterialState.selected)
                  ? TextStyle(
                      color: Color(0xCAF15800),
                    )
                  : TextStyle()),
        )),
        
         onGenerateRoute: Routes.onGenerateRoute,
         initialRoute: SplashScreen.routeName,
    
      ),
    );
  }
}








class MyBlocObserver extends BlocObserver {
  @override
  void onCreate(BlocBase bloc) {
    log("Created: $bloc");
    super.onCreate(bloc);
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    log("Change in $bloc: $change");
    super.onChange(bloc, change);
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    log("Change in $bloc: $transition");
    super.onTransition(bloc, transition);
  }

  @override
  void onClose(BlocBase bloc) {
    log("Closed: $bloc");
    super.onClose(bloc);
  }
}