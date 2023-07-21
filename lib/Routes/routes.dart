import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:social_media_app_frontend_in_flutter/Models/Post_Model.dart';
import 'package:social_media_app_frontend_in_flutter/Models/Use_profiledetels_model.dart';
import 'package:social_media_app_frontend_in_flutter/Screens/Auth/Login_Screen.dart';
import 'package:social_media_app_frontend_in_flutter/Screens/Auth/Provider/login_provider.dart';
import 'package:social_media_app_frontend_in_flutter/Screens/Auth/Provider/signup_provider.dart';
import 'package:social_media_app_frontend_in_flutter/Screens/Auth/signup_screen.dart';
import 'package:social_media_app_frontend_in_flutter/Screens/My_Profile/Provider/update_profile_provider.dart';
import 'package:social_media_app_frontend_in_flutter/Screens/My_Profile/my_profile_screen.dart';
import 'package:social_media_app_frontend_in_flutter/Screens/My_Profile/update_profile.dart';
import 'package:social_media_app_frontend_in_flutter/Screens/Posts/Provider/post_upload_provider.dart';
import 'package:social_media_app_frontend_in_flutter/Screens/Posts/addcaption_screen.dart';
import 'package:social_media_app_frontend_in_flutter/Screens/Settings/Provider/change_password_Provider.dart';
import 'package:social_media_app_frontend_in_flutter/Screens/Settings/Widgets/change_password_screen.dart';
import 'package:social_media_app_frontend_in_flutter/Screens/Settings/settings_screen.dart';
import 'package:social_media_app_frontend_in_flutter/Screens/Users_Profiles/users_profiles.dart';
import 'package:social_media_app_frontend_in_flutter/Screens/followers_following/followers_screen.dart';
import 'package:social_media_app_frontend_in_flutter/Screens/followers_following/following_screen.dart';
import 'package:social_media_app_frontend_in_flutter/Screens/home/Home_Screen.dart';
import 'package:social_media_app_frontend_in_flutter/Screens/Comments/comment_screen.dart';
import 'package:social_media_app_frontend_in_flutter/Screens/main_screen.dart';
import 'package:social_media_app_frontend_in_flutter/Screens/splash/splash_screen.dart';
import 'package:social_media_app_frontend_in_flutter/Screens/user_posts/post_delete_screen.dart';
import 'package:social_media_app_frontend_in_flutter/Screens/user_posts/post_edit_caption_screen%20copy.dart';
import 'package:social_media_app_frontend_in_flutter/Screens/user_posts/user_posts_screen.dart';
import 'package:social_media_app_frontend_in_flutter/logic/cubits/change_password_cubits/change_password_cubits.dart';
import 'package:social_media_app_frontend_in_flutter/logic/cubits/comment_cubits/comment_cubits.dart';
import 'package:social_media_app_frontend_in_flutter/logic/cubits/followers_following_cubits/followers_cubits.dart';
import 'package:social_media_app_frontend_in_flutter/logic/cubits/followers_following_cubits/following_cubits.dart';
import 'package:social_media_app_frontend_in_flutter/logic/cubits/user_details/user_get_by_id_cubit.dart';

import '../Screens/user_posts/Provider/post_delete_provider.dart';
import '../Screens/user_posts/Provider/post_edit_caption_provider.dart';

class Routes {
  static Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case LoginScreen.routeName:
        return CupertinoPageRoute(
            builder: (context) => ChangeNotifierProvider(
                create: (context) => LoginProvider(context),
                child: const LoginScreen()));

      case SignupScreen.routeName:
        return CupertinoPageRoute(
            builder: (context) => ChangeNotifierProvider(
                create: (context) => SignupProvider(context),
                child: const SignupScreen()));

      case SplashScreen.routeName:
        return CupertinoPageRoute(builder: (context) => const SplashScreen());

      case HomeScreen.routeName:
        return CupertinoPageRoute(builder: (context) => HomeScreen());

      case MainScreen.routeName:
        return CupertinoPageRoute(builder: (context) => MainScreen());

      case CommentScreen.routeName:
        return CupertinoPageRoute(
            fullscreenDialog: true,
            builder: (context) => BlocProvider(
                create: (context) =>
                    CommentsCubit(settings.arguments as PostModel),
                child: CommentScreen(
                  post: settings.arguments as PostModel,
                )));






      case UserPostScreen.routeName:
        Map<String, dynamic> arguments =
            settings.arguments as Map<String, dynamic>;
        return CupertinoPageRoute(
            builder: (context) => UserPostScreen(
                  data: arguments,
                ));








      case FollowersScreen.routeName:
        // Map<String,dynamic> arguments = (settings.arguments??{}) as Map<String,dynamic>;
        // Map arguments = (settings.arguments??{"name":"Amir"}) as Map;
        return CupertinoPageRoute(
            builder: (context) => BlocProvider(
                create: (context) => FollowersCubit(
                    settings.arguments as UserProfileDetelsModel),
                child: FollowersScreen(
                  userData: settings.arguments as UserProfileDetelsModel,
                )));






      case FollowingScreen.routeName:
        return CupertinoPageRoute(
            builder: (context) => BlocProvider(
                create: (context) => FollowingCubit(
                    settings.arguments as UserProfileDetelsModel),
                child: FollowingScreen(
                    user: settings.arguments as UserProfileDetelsModel)));







      case UsersProfiles.routeName:
        Map<String, dynamic> arguments =
            settings.arguments as Map<String, dynamic>;
        return CupertinoPageRoute(
            builder: (context) => BlocProvider(
                create: (context) => UserGetByIdCubit(arguments),
                child: UsersProfiles(data: arguments)));







      case AddCaptionScreen.routeName:
        Map<String, dynamic> arguments =
            settings.arguments as Map<String, dynamic>;
        return CupertinoPageRoute(
            builder: (context) => ChangeNotifierProvider(
                  create: (context) => PostUploadProvider(context),
                  child: AddCaptionScreen(
                    data: arguments,
                  ),
                ));





      case PostEditCaptionScreen.routeName:
        // Map<String, dynamic> arguments = settings.arguments as Map<String, dynamic>;
            return CupertinoPageRoute(
                builder: (context) => ChangeNotifierProvider(
                  create: (context) => PostEditCaptionProvider(context),
                  child: PostEditCaptionScreen(post: settings.arguments as PostModel))
            );


            
      case PostDeleteScreen.routeName:
            return CupertinoPageRoute(
                builder: (context) => ChangeNotifierProvider(
                  create: (context) => PostDeleteProvider(context),
                  child: PostDeleteScreen(post: settings.arguments as PostModel))
            );




      case SettingsScreen.routeName:
            return CupertinoPageRoute(
                builder: (context) => SettingsScreen(userModel:settings.arguments as UserProfileDetelsModel ,)
            );



      case ChangePasswordScreen.routeName:
            return CupertinoPageRoute(
                builder: (context) => BlocProvider(
                  create: (context) => ChangePasswordCubit(),
                  child: ChangeNotifierProvider(
                    create: (context) =>ChangePasswordProvider(context) ,
                    child: ChangePasswordScreen()),
                )
            );


      case UpdateScreen.routeName:
            return CupertinoPageRoute(
                builder: (context) => ChangeNotifierProvider(
                  create: (context) => UpdateProfileProvider(context),
                  child: UpdateScreen(userModel:settings.arguments as UserProfileDetelsModel))
            );



      case MyProfilScreen.routeName:
            return CupertinoPageRoute(
                builder: (context) => MyProfilScreen()
            );








    }
  }
}
