

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';
import 'package:social_media_app_frontend_in_flutter/Models/Post_Model.dart';
import 'package:social_media_app_frontend_in_flutter/Resources/Components/primary_textfield.dart';
import 'package:social_media_app_frontend_in_flutter/Resources/Components/round_button.dart';
import 'package:social_media_app_frontend_in_flutter/Screens/user_posts/Provider/post_edit_caption_provider.dart';

class PostEditCaptionScreen extends StatefulWidget {
  PostModel post;
  PostEditCaptionScreen({super.key,required this.post});

  static const String routeName = "editCaptionScreen";

  @override
  State<PostEditCaptionScreen> createState() => _PostEditCaptionScreenState();
}

class _PostEditCaptionScreenState extends State<PostEditCaptionScreen> {

  TextEditingController updateCaptionController = TextEditingController();


  @override
  void initState() {
    // TODO: implement initState
    updateCaptionController.text = widget.post.caption ?? "";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

     final provider = Provider.of<PostEditCaptionProvider>(context);
    
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
                    image: NetworkImage(widget.post.images!.url!),
            )
                ),
              ),
            ),

             Padding(
               padding: const EdgeInsets.all(18),
               child: TextFormField(
                   controller: updateCaptionController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    label: Text("Enter New Caption")
                  ),
                ),
             ),

             Padding(
               padding: const EdgeInsets.all(18),
               child: RoundButton(
                loading: provider.isLoading,
                onTap: ()async{
                 bool success = await provider.postUpdateCaption(sId: widget.post.sId!, caption:updateCaptionController.text.toString());
                 if(success){
                    Navigator.pop(context);
                    Navigator.pop(context);
                 }
                },
                title: "Update Caption",
                ),
             )
            
          ],
        ),
    );
  }
}