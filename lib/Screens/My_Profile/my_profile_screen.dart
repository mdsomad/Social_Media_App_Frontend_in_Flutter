import 'dart:developer';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:social_media_app_frontend_in_flutter/Models/Post_Model.dart';
import 'package:social_media_app_frontend_in_flutter/Models/Use_profiledetels_model.dart';
import 'package:social_media_app_frontend_in_flutter/Resources/Colors/app_colors.dart';
import 'package:social_media_app_frontend_in_flutter/Resources/Components/log.dart';
import 'package:social_media_app_frontend_in_flutter/Screens/Auth/Login_Screen.dart';
import 'package:social_media_app_frontend_in_flutter/Screens/Settings/settings_screen.dart';
import 'package:social_media_app_frontend_in_flutter/Screens/followers_following/followers_screen.dart';
import 'package:social_media_app_frontend_in_flutter/Screens/followers_following/following_Screen.dart';
import 'package:social_media_app_frontend_in_flutter/Screens/user_posts/user_posts_screen.dart';
import 'package:social_media_app_frontend_in_flutter/Services/session_manager.dart';
import 'package:social_media_app_frontend_in_flutter/Utils/utils.dart';
import 'package:social_media_app_frontend_in_flutter/logic/cubits/followers_following_cubits/followers_cubits.dart';
import 'package:social_media_app_frontend_in_flutter/logic/cubits/post_cubit/post_cubit.dart';
import 'package:social_media_app_frontend_in_flutter/logic/cubits/post_cubit/post_state.dart';
import 'package:social_media_app_frontend_in_flutter/logic/cubits/user_cubit/user_cubit.dart';
import 'package:social_media_app_frontend_in_flutter/logic/cubits/user_cubit/user_state.dart';
import 'package:social_media_app_frontend_in_flutter/logic/cubits/user_details/user_details_cubit.dart';
import 'package:social_media_app_frontend_in_flutter/logic/cubits/user_details/user_details_state.dart';

class MyProfilScreen extends StatefulWidget {
  

  const MyProfilScreen({super.key});

  static const String routeName = "myProfilScreen";

  @override
  My_ProfilScreenState createState() => My_ProfilScreenState();
}

class My_ProfilScreenState extends State<MyProfilScreen> {
  

//TODO: Create videoPick Function
 imagePick(ImageSource src ,BuildContext context) async {
  final _pickedImage  = await ImagePicker().pickImage(source: src);     
  if (_pickedImage  != null) {
       log("Image picked");
     
    
  } else {
   Loggerclass.logger.e("Error In Selecting Video Please Choose A Different Video File");
    Utils.ftushBarErrorMessage("Error In Selecting Video Please Choose A Different Video File", context);

  }
}



  

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
     BlocProvider.of<UserProfileDetelsCubit>(context).initialize();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        BlocBuilder<UserProfileDetelsCubit, UserProfileState>(
          builder: (context, state) {
            if (state is UserProfileDetelsLoadingState) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }

            if (state is UserProfileDetelsErrorState) {
              return Center(
                child: Text(state.message),
              );
            }

            if (state is UserProfileDetelsLoadedState) {
              return Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 35),
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        PopupMenuButton(
                  icon: Icon(Icons.more_vert),
                  itemBuilder: (context)=>[

                  PopupMenuItem(
                    value: 1,
                  child: ListTile(
                    onTap: (){
                    Navigator.pushNamed(context, SettingsScreen.routeName,arguments:state.userProfileDetels);
                    },
                    leading:Icon(Icons.settings,color: Colors.green,) ,
                    title: Text("Settings"),
                  )
                  ),
                  PopupMenuItem(
                  value: 2,
                  child: ListTile(
                    leading:Icon(Icons.logout,color: Colors.red,) ,
                    title: Text("Logout"),
                  )
                  
                  
                  //  IconButton(onPressed: (){
                  //      cubit.signOut().then((value) {
                  //               Navigator.pushReplacementNamed(
                  //                   context, LoginScreen.routeName);
                  //             });
                  //     Navigator.pop(context);
                  // }, icon: Icon(Icons.logout,color: Colors.red,))
                  ),

                    
                    

                 
                    
                  ])

                      ],
                    ),
                  ),
                  GestureDetector(
                    onLongPress: (){
                      BottomSheet(context);
                    },
                    child: Hero(
                      tag: 'hello',
                      child: Container(
                        margin: EdgeInsets.only(top: 35),
                        height: 80,
                        width: 80,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(40),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.2),
                              spreadRadius: 5,
                              blurRadius: 20,
                            )
                          ],
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(
                                state.userProfileDetels.avater!.url != "" ? state.userProfileDetels.avater!.url! :
                                "https://upload.wikimedia.org/wikipedia/commons/thumb/a/ac/No_image_available.svg/300px-No_image_available.svg.png?20221208232400"
                                ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        state.userProfileDetels.name!,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        width:
                            state.userProfileDetels.userverify == true ? 5 : 0,
                      ),
                      state.userProfileDetels.userverify == true
                          ? Icon(
                              Icons.verified_user,
                              size: 20,
                              color: Colors.green,
                            )
                          : SizedBox()
                    ],
                  ),
                  Text(
                    "London, England",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[400],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      buildStatColumn(
                          state.userProfileDetels.posts!.length.toString(),
                          "Photos"), //* <-- Call buildStatColumn Function
                      InkWell(
                        onTap: () {
                          log("click");
                          UserProfileDetelsModel user = state.userProfileDetels;
                          Navigator.pushNamed(
                              context, FollowersScreen.routeName,
                              arguments: user);
                        },
                        child: buildStatColumn(
                            state.userProfileDetels.followers!.length
                                .toString(),
                            "Followers"),
                      ),
                      InkWell(
                        onTap: () {
                          UserProfileDetelsModel user = state.userProfileDetels;
                          Navigator.pushNamed(
                              context, FollowingScreen.routeName,
                              arguments: user);
                        },
                        child: buildStatColumn(
                            state.userProfileDetels.following!.length
                                .toString(),
                            "Following"),
                      ),
                    ],
                  ),
                ],
              );
            }

            return Text("No Data");
          },
        ),
        BlocBuilder<PostCubit, PostState>(
          builder: (context, state) {
            List<PostModel> filterPost = state.post
                .where(((element) =>
                    element.owner!.sId.toString() ==
                    SessionController().userid))
                .toList();

            return Expanded(
              child: Container(
                margin: EdgeInsets.only(left: 8, right: 8, top: 8),
                decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.15),
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(25))),
                child: GridView.builder(
                    itemCount: filterPost.length,
                    padding: EdgeInsets.symmetric(horizontal: 5, vertical: 8),
                    gridDelegate:
                        const SliverGridDelegateWithMaxCrossAxisExtent(
                            maxCrossAxisExtent: 200,
                            childAspectRatio: 3 / 2,
                            crossAxisSpacing: 20,
                            mainAxisSpacing: 20),
                    itemBuilder: (BuildContext context, int index) {
                      return InkWell(
                          onTap: () {
                            Navigator.pushNamed(
                                context, UserPostScreen.routeName,arguments:{"sId":SessionController().userid});
                            log(index.toString());
                          },
                          child: buildPictureCard(
                              filterPost[index].images!.url.toString()));
                    }),
              ),
            );
          },
        )
      ],
    ));
  }










  // TODO Create buildPictureCard Function
  Card buildPictureCard(String url) {
    return Card(
      elevation: 10,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(url),
            )),
      ),
    );
  }








  // TODO Create buildStatColumn Function
  Column buildStatColumn(String value, String title) {
    return Column(
      children: [
        Text(
          value,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          title,
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.bold,
            color: Colors.grey[400],
          ),
        ),
      ],
    );
  }







BottomSheet(BuildContext context) {  //* <-- showModalBottomSheet 2 Method
   return showModalBottomSheet(
        context: context,
        backgroundColor: Colors.transparent,
        builder: ((context) => Container(
              height: MediaQuery.of(context).size.height * 0.25,
              decoration: BoxDecoration(
                color: AppColor.bodyColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
                child: SingleChildScrollView(
                  child: Column(
                    
                    children: [
                      Container(
                        height: 5,
                        width: 50,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15)
                        ),
                      ),
                      SizedBox(height: 20,),
                      Text("Update Profile Image",style: TextStyle(fontWeight: FontWeight.bold),),
                      SizedBox(height: 20,),
                      ListTile(
                        onTap: (){
                          log("Click Edit Caption");
                          imagePick(ImageSource.camera,context);
                          Navigator.pop(context);                 
                         
                        },
                        leading: Icon(Icons.camera,color: Colors.white,),
                        title:Text("Camrea"),
                      ),
                      Divider(),
                
                      ListTile(
                        onTap: (){
                          log("Click Edit Caption");
                          //  Navigator.pushNamed(context, PostDeleteScreen.routeName,arguments:postData);
                           imagePick(ImageSource.gallery,context);
                          Navigator.pop(context);                 

                        },
                        leading: Icon(Icons.photo,color: Colors.white,),
                        title:Text("Gallery"),
                        
                      )
                     
                      
                    ],
                  ),
                ),
              ),
            )));
  }









}
