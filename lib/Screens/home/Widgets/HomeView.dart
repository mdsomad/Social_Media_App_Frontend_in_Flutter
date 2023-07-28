import 'dart:async';
import 'dart:developer';
import 'dart:ffi';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:social_media_app_frontend_in_flutter/Models/Post_Model.dart';
import 'package:social_media_app_frontend_in_flutter/Resources/Colors/app_colors.dart';
import 'package:social_media_app_frontend_in_flutter/Screens/Comments/comment_screen.dart';
import 'package:social_media_app_frontend_in_flutter/Screens/Users_Profiles/users_profiles.dart';
import 'package:social_media_app_frontend_in_flutter/Screens/user_posts/post_delete_screen.dart';
import 'package:social_media_app_frontend_in_flutter/Screens/user_posts/post_edit_caption_screen%20copy.dart';
import 'package:social_media_app_frontend_in_flutter/Services/session_manager.dart';
import 'package:social_media_app_frontend_in_flutter/logic/cubits/post_cubit/post_cubit.dart';
import 'package:timeago/timeago.dart' as timeago;

import '../../user_posts/Provider/post_edit_caption_provider.dart';
// ignore_for_file: prefer_const_constructors
// ignore_for_file: prefer_const_literals_to_create_immutables

class HomeView extends StatelessWidget {
  bool isUserPosts;
  List<PostModel> allPosts;
  HomeView({super.key,required this.allPosts,required this.isUserPosts});



  var likeImagesList = [
    'https://img.freepik.com/free-photo/girl-with-backpack-sunset-generative-al_169016-28612.jpg?size=338&ext=jpg&ga=GA1.1.647470437.1685963067&semt=robertav1_2_sidr',
    'https://img.freepik.com/free-photo/girl-with-backpack-sunset-generative-al_169016-28612.jpg?size=338&ext=jpg&ga=GA1.1.647470437.1685963067&semt=robertav1_2_sidr',
    'https://img.freepik.com/premium-vector/character-design-girl-bring-stick_286658-173.jpg?size=626&ext=jpg&ga=GA1.1.647470437.1685963067&semt=robertav1_2_sidr',
  ];




  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: CustomScrollView(
            slivers: [
              SliverAppBar(
                backgroundColor: Colors.black,
                expandedHeight: 40,
                floating: true,
                pinned: false,
                snap: true,
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(children: [
                      Text(isUserPosts  ? " Posts": 'Social Media', style: TextStyle(fontSize: 30)),
                    isUserPosts ? SizedBox() :  Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(Icons.radio_button_unchecked,
                            color: Colors.orange),
                      )
                    ]),
                   isUserPosts ? SizedBox() : Icon(Icons.message)
                  ],
                ),
              ),


           SliverToBoxAdapter(
                child: isUserPosts ? SizedBox()  :SizedBox(
                  height: 120,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [

                      ProfileStoryCard(),   //* <-- ProfileStoryCard Widget Called

                      ListView.builder(
                          itemCount: allPosts.length,
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {

                            return StoryCard(                               //* <-- StoryCard Widget Called
                              profileImage: allPosts[index].images!.url!,   //* <-- storyData List imageUrl Data Send
                              userName: allPosts[index].owner!.name!,       //* <-- storyData List userName Data Send
                            );

                          })
                    ],
                  ),
                ),
              ),
              


              SliverToBoxAdapter(
                child: ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: allPosts.length,
                    itemBuilder: (context, index) {

                      return PostCard(                //* <-- PostCard Widget Called
                        likeImagesList: allPosts,     //* <-- likeImagesList Data Send
                        postData: allPosts[index],    //* <-- postData List Data Send
                      );

                    }),
              ),
            ],
          ),
        ));
  }
}





//TODO: Create PostCard Widget
class PostCard extends StatelessWidget {
  const PostCard({
    super.key,
    required this.likeImagesList,
    required this.postData,
  });

  final List<PostModel> likeImagesList;
  final PostModel postData;



  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween, 
           children: [
            Row(children: [
              CircleAvatar(
                radius: 30,
                backgroundImage: NetworkImage(postData.owner!.avater!.url! != "" ? postData.owner!.avater!.url! :  "https://upload.wikimedia.org/wikipedia/commons/thumb/a/ac/No_image_available.svg/300px-No_image_available.svg.png?20221208232400"),
              ),

              SizedBox(
                width: 10,
              ),
              
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                   onTap: (){
                    log("Checking Name");
                     Navigator.pushNamed(context, UsersProfiles.routeName,arguments:{"sId":postData.owner!.sId!} );
                   },
                    child: Row(
                      children: [
                        Text(
                          postData.owner!.name!,
                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                        ),
                        SizedBox(width: 5,),
                        postData.owner!.userverify!
                        ? Icon(
                            Icons.verified_user,
                            size: 20,
                            color: Color(0xff0C9C28),
                          )
                        : SizedBox()
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(postData.caption!, style: TextStyle(color: Colors.white70,fontSize: 15))
                 
                ],
              ),
              
            ]),
           
            IconButton(onPressed: (){
              postData.owner!.sId! == SessionController().userid ?  BottomSheet(context) : SizedBox();
            }, icon: Icon(Icons.more_vert))
            

          ]),

          SizedBox(
            height: 15,
          ),

          
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: CachedNetworkImage(
                    height: 550,
                    width: double.infinity,
                    fit: BoxFit.fill,
                    imageUrl: postData.images!.url!,
                  )
            
          ),

         const SizedBox(
            height: 15,
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  //! LikesImages(
                  //!   likeImages: likeImagesList,
                  //! ),

                  SizedBox(
                    width: 15,
                  ),

                  Text("${postData.likes!.length} Likes",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color:Colors.white)),
                  SizedBox(
                    width: 10,
                  ),

                  IconButton(onPressed: (){
                    log("Click");
                    BlocProvider.of<PostCubit>(context).PostLink(sId: postData.sId!);
                  }, icon:postData.likes!.contains(SessionController().userid) ? Icon(Icons.favorite,color: Colors.red,):Icon(Icons.favorite_border_outlined) ) ,

                  SizedBox(
                    width: 15,
                  ),
                  IconButton(onPressed: (){
                    log("Clicked Comment Button");
                   Navigator.pushNamed(context, CommentScreen.routeName, arguments:postData);         
                  }, icon: Icon(Icons.message_outlined,))
                 

                ],
              ),
              Icon(Icons.bookmark_border_outlined,),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            "View All ${postData.comments!.length} comments",
            style: TextStyle(color: Colors.grey),
          ),
        const SizedBox(
            height: 5,
          ),
          Text(timeago.format(postData.createdAt!), style: TextStyle(color: Colors.white38)),
  
        ],
      ),
    );







    
  }

  BottomSheet(BuildContext context) {  //* <-- showModalBottomSheet 2 Method
   return showModalBottomSheet(
        context: context,
        backgroundColor: Colors.transparent,
        builder: ((context) => Container(
              height: 180,
              decoration: BoxDecoration(
                color: AppColor.bodyColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
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
                    ListTile(
                      onTap: (){
                        log("Click Edit Caption");
                        Navigator.pushNamed(context, PostEditCaptionScreen.routeName,arguments:postData);
                        // Navigator.of(context).pop();
                      },
                      leading: Icon(Icons.edit,color: Colors.green,),
                      title:Text("Edit Caption"),
                    ),
                    Divider(),

                    ListTile(
                      onTap: (){
                         log("Click Edit Caption");
                         Navigator.pushNamed(context, PostDeleteScreen.routeName,arguments:postData);
                      },
                      leading: Icon(Icons.delete,color: Colors.red,),
                      title:Text("Delete Post"),
                    )
                   
                    
                  ],
                ),
              ),
            )));
  }

  
}

//TODO: Create LikesImages Widget
class LikesImages extends StatelessWidget {
  const LikesImages({
    super.key,
    required this.likeImages,
  });
  final List<String> likeImages;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        for (int index = 0; index < likeImages.length; index++)
          Container(
            width: 35,
            height: 35,
            margin: EdgeInsets.only(left: 26.0 * index),
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(width: 1, color: Colors.white)),
            child: CircleAvatar(
              backgroundImage: NetworkImage(likeImages[index]),
            ),
          ),
      ],
    );
  }
}







//TODO: Create StoryCard Widget
class StoryCard extends StatelessWidget {
  StoryCard({
    super.key,
    required this.profileImage,
    required this.userName,
  });

  final String profileImage;
  final String userName;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8, right: 8, top: 8, bottom: 0),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(width: 4, color: Colors.grey)),
            child: Padding(
              padding: const EdgeInsets.all(2.0),
              child: CircleAvatar(
                radius: 35,
                backgroundImage: NetworkImage(profileImage),
              ),
            ),
          ),
          SizedBox(
            height: 2,
          ),
          Text(userName)
        ],
      ),
    );
  }
}








//TODO: Create ProfileStoryCard Widget
class ProfileStoryCard extends StatelessWidget {
  const ProfileStoryCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(width: 4, color: Colors.grey)),
                child: Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: CircleAvatar(
                    radius: 35,
                    backgroundImage: NetworkImage(
                        "https://img.freepik.com/free-vector/hand-drawn-korean-drawing-style-character-illustration_23-2149623257.jpg?size=338&ext=jpg&ga=GA1.2.647470437.1685963067&semt=robertav1_2_sidr"),
                  ),
                ),
              ),
            ],
          ),
        ),

        Positioned(
          bottom: 16,
          child: Container(
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(width: 3.0, color: Colors.white)),
            child: Icon(
              Icons.add_circle,
              size: 30,
              color: Colors.orange,
            ),
          ),
        )
      ],
    );
  }
}