import 'dart:developer';

import 'package:flutter/material.dart';




class UserSearchScreen extends StatelessWidget {
  const UserSearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink[900],
        title: Text("User Search Screen"),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 15),
            child: Container(
          
              decoration: BoxDecoration(
               color: Colors.black,
               borderRadius: BorderRadius.circular(7)
          
              ),
              child: TextFormField(
                decoration: InputDecoration(
                  
                  hintText: "Search For User",
  
                  border:OutlineInputBorder(
                    borderRadius: BorderRadius.circular(7),
                    borderSide: BorderSide(
                      color: Colors.yellow,
                      width: 50,
                    )),
  
                  
                ),

                onChanged: (value) {
                  log(value);
                },
                    
              ),
            ),
          ),

         Divider(height: 10,thickness: 1,),
        Expanded(
          child: Container(
            // color: Colors.yellow,
            child:ListView(
              children: [
                ListTile(
                  onTap: (){
                    log("Clicked Search");
                  },
                  leading: CircleAvatar(
                    backgroundColor: Colors.yellow,
                    backgroundImage: NetworkImage("https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=687&q=80"),
                    
                  ),
                  title: Row(
                    children: [
                      Text("Somad"),
                      SizedBox(
                        width: 5,
                      ),
                      Icon(Icons.verified_user,size: 16,color: Colors.green,)

                    ],
                  ),
                  trailing: IconButton(onPressed: (){}, icon: Icon(Icons.close,size: 17,)),
                )
              ],
            ),
          ),
        )




          
        ],
      ),
      
    );
  }
}