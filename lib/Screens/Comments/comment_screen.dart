import 'dart:developer';

import 'package:comment_box/comment/comment.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_media_app_frontend_in_flutter/Models/Post_Model.dart';
import 'package:social_media_app_frontend_in_flutter/Screens/Users_Profiles/users_profiles.dart';
import 'package:social_media_app_frontend_in_flutter/Services/formatter.dart';
import 'package:social_media_app_frontend_in_flutter/Services/session_manager.dart';
import 'package:social_media_app_frontend_in_flutter/logic/cubits/comment_cubits/comment_cubits.dart';
import 'package:social_media_app_frontend_in_flutter/logic/cubits/comment_cubits/comment_state.dart';

class CommentScreen extends StatefulWidget {
  final PostModel post;
  static const String routeName = "comment";

  const CommentScreen({super.key, required this.post});

  @override
  _CommentScreenState createState() => _CommentScreenState();
}

class _CommentScreenState extends State<CommentScreen> {
  final formKey = GlobalKey<FormState>();
  final TextEditingController commentController = TextEditingController();
   FocusNode commentFocusnode = FocusNode();
  bool isUpdate = false;
  late int index;


  Widget commentChild(CommentsState data) {
    return data.comments.length > 0 ? ListView(
      children: [
        for (var i = 0; i < data.comments.length; i++)
          Padding(
            padding: const EdgeInsets.fromLTRB(2.0, 8.0, 2.0, 0.0),
            child:  ListTile(
              leading: GestureDetector(
                onTap: () async {
                  //* Display the image in large form.
                  log("imageClicked Comment User Profile Image ");
                    Navigator.pushNamed(context, UsersProfiles.routeName,arguments:{"sId":data.comments[i].user!.sId!} );
                },
                child:  Container(
                  height: 50.0,
                  width: 50.0,
                  decoration: new BoxDecoration(
                      color: Colors.blue,
                      borderRadius: new BorderRadius.all(Radius.circular(50))),
                  child: CircleAvatar(
                      radius: 50,
                      backgroundImage: CommentBox.commentImageParser(
                          imageURLorPath: data.comments[i].user!.avater!.url)),
                ),
              ),
              title: GestureDetector(
                onTap: (){
                  log("Comment User Name Clicked");
                  Navigator.pushNamed(context, UsersProfiles.routeName,arguments:{"sId":data.comments[i].user!.sId!} );
                },
                child: Text(
                   data.comments[i].user!.name!,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              subtitle: Text(data.comments[i].comment!),
              trailing:  PopupMenuButton(
                  icon: Icon(Icons.more_vert),
                  itemBuilder: (context)=>[

                  PopupMenuItem(
                    value: 1,
                  child: (data.comments[i].user!.sId.toString() == SessionController().userid.toString()) ? IconButton(onPressed: (){
                      commentController.text = data.comments[i].comment.toString();
                      index = i;
                      isUpdate = true;
                      FocusScope.of(context).autofocus(commentFocusnode);
                      Navigator.pop(context);
                  }, icon: Icon(Icons.edit,color: Colors.green,)) : SizedBox(),
                  ),

                    
                    PopupMenuItem(
                      value: 2,
                      child: (data.comments[i].user!.sId.toString() == SessionController().userid.toString()) ? IconButton(onPressed: (){
                     BlocProvider.of<CommentsCubit>(context).yourDeleteComment(data.comments[i].sId);
                     Navigator.pop(context);
                    }, icon: Icon(Icons.delete,color: Colors.red,)) :  (widget.post.owner!.sId.toString() == SessionController().userid.toString()) ? IconButton(onPressed: (){

                     BlocProvider.of<CommentsCubit>(context).postOwnerDeleteComment(data.comments[i].sId);
                    }, icon:Icon(Icons.delete,color: Colors.red,)) : SizedBox(),
                    ),

                 
                    
                  ])
              
              
              
              
              // trailing: Text(Formatter.formatDate(data.comments[i].commentdate!)),
            )
          )
      ],
    ):Center(child: Text("No comments yet",style: TextStyle(fontSize: 25,fontWeight:FontWeight.bold ),));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Comment Screen"),
        backgroundColor: Colors.pink,
      ),
      body: BlocBuilder<CommentsCubit, CommentsState>(
        builder: (context, state) {

           if (state is CommentsLoadingState) {
                  return Center(child: CircularProgressIndicator());
            }

            if (state is CommentsErrorState) {
              return Center(child: Text(state.message));
            }
          
          
          return Container(
            child: CommentBox(
              userImage: CommentBox.commentImageParser(
                  imageURLorPath:
                      "https://images.pexels.com/photos/16791430/pexels-photo-16791430/free-photo-of-sea-1.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2"),
              child: commentChild(state),
              labelText: 'Write a comment...',
              errorText: 'Comment cannot be blank',
              withBorder: false,
              sendButtonMethod: () {
                if (formKey.currentState!.validate()) {
                  log(commentController.text);

                  if(isUpdate == true) {
                    log("is Comment Update");
                     BlocProvider.of<CommentsCubit>(context).updateComment(commentId:state.comments[index].sId!,upDateComment:commentController.text.toString());

                    commentController.clear();
                    isUpdate = false;
                    FocusScope.of(context).unfocus();
                  }else {
                     log("New comment");
                     BlocProvider.of<CommentsCubit>(context).comment(commentController.text.toString());
                     commentController.clear();
                     FocusScope.of(context).unfocus();
                  }
                } else {
                  log("Not validated");
                }
              },
              formKey: formKey,
              commentController: commentController,
              focusNode: commentFocusnode,
              backgroundColor: Colors.pink,
              textColor: Colors.white,
              sendWidget: Icon(Icons.send_sharp, size: 30, color: Colors.white),
            ),
          );
        },
      ),
    );
  }
}
