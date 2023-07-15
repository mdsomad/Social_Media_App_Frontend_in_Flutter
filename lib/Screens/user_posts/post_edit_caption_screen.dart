

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:social_media_app_frontend_in_flutter/Models/Post_Model.dart';
import 'package:social_media_app_frontend_in_flutter/Resources/Components/primary_textfield.dart';
import 'package:social_media_app_frontend_in_flutter/Resources/Components/round_button.dart';

class PostEditCaptionScreen extends StatelessWidget {
  PostModel post;
  PostEditCaptionScreen({super.key,required this.post});

  static const String routeName = "editCaptionScreen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Caption"),
      ),
      body: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18,vertical: 15),
              child: Container(
                height: MediaQuery.of(context).size.height * .48,
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
               child: TextFormField(
                  initialValue: post.caption,
                  // controller: provider.addCaptionController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    label: Text("Enter New Caption")
                  ),
                ),
             ),

             Padding(
               padding: const EdgeInsets.all(18),
               child: RoundButton(
                onTap: (){},
                title: "Update Caption",
                ),
             )
            
          ],
        ),
    );
  }
}