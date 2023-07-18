

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';
import 'package:social_media_app_frontend_in_flutter/Models/Post_Model.dart';
import 'package:social_media_app_frontend_in_flutter/Resources/Components/primary_textfield.dart';
import 'package:social_media_app_frontend_in_flutter/Resources/Components/round_button.dart';
import 'package:social_media_app_frontend_in_flutter/Screens/user_posts/Provider/post_edit_caption_provider.dart';

import 'Provider/post_delete_provider.dart';

class PostDeleteScreen extends StatelessWidget {
  PostModel post;
  PostDeleteScreen({super.key,required this.post});

  static const String routeName = "deleteScreen";


  @override
  Widget build(BuildContext context) {

     final provider = Provider.of<PostDeleteProvider>(context);
    
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Caption"),
      ),
      body: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18,vertical: 15),
              child: Container(
                height: MediaQuery.of(context).size.height * .65,
                width:  double.infinity,
                decoration: BoxDecoration(
                    color: Colors.pink,
                    borderRadius: BorderRadius.circular(15),
                    image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(post.images!.url!),
            )
                ),
              ),
            ),

             Padding(
               padding: const EdgeInsets.all(18),
               child: RoundButton(
                loading: provider.isLoading,
                isColorRed: true,
                onTap: ()async{
                 bool success = await provider.postDeletCaption(post:post);
                 if(success){
                    Navigator.pop(context);
                    Navigator.pop(context);
                 }
                },
                title: "Post Delete",
                ),
             )
            
          ],
        ),
    );
  }
}