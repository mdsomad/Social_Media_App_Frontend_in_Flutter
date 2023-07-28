import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_media_app_frontend_in_flutter/Screens/Users_Profiles/users_profiles.dart';
import 'package:social_media_app_frontend_in_flutter/logic/cubits/user_search_cubits/user_search_cubit.dart';
import 'package:social_media_app_frontend_in_flutter/logic/cubits/user_search_cubits/user_search_state.dart';

class UserSearchScreen extends StatelessWidget {
  UserSearchScreen({super.key});

  final searchController = TextEditingController();

  bool isSearch = false;
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
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.black, borderRadius: BorderRadius.circular(7)),
              child: TextFormField(
                controller: searchController,
                decoration: InputDecoration(
                  hintText: "Search For User",
                  suffixIcon: IconButton(
                      onPressed: () {
                        if (searchController.text != "") {
                          BlocProvider.of<SearchUserCubit>(context).SearchUser(searchName: searchController.text);   //* <-- SearchUser Function Call
                        }
                      },
                      icon: Icon(Icons.search)),
                     border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(7),
                      borderSide: BorderSide(
                        color: Colors.yellow,
                        width: 50,
                      )),
                ), onChanged: (value) {
                  //! BlocProvider.of<SearchUserCubit>(context).SearchUser(searchName: value);
                  log(value);
                },
              ),
            ),
          ),




          Divider(
            height: 10,
            thickness: 1,
          ),





          BlocBuilder<SearchUserCubit, UserSearchState>(
            builder: (context, state) {
              if (state is SearchUserLoadingState) {
                return Expanded(
                    child: Center(
                  child: CircularProgressIndicator(),
                ));
              }

              if (state is SearchUserErrorState) {
                Expanded(
                    child: Center(
                  child: Text(state.message),
                ));
              }

              return Expanded(
                child: Container(
                    // color: Colors.yellow,
                  child: ListView(
                  children: [
                    for (var i = 0; i < state.searchUser.length; i++)
                      ListTile(
                        onTap: () {
                          log("Clicked Search");
                          Navigator.pushNamed(context, UsersProfiles.routeName,
                              arguments: {"sId": state.searchUser[i].sId!});
                        },
                        leading: CircleAvatar(
                          backgroundColor: Colors.yellow,
                          backgroundImage: NetworkImage(state
                                      .searchUser[i].avater!.url !=
                                  ""
                              ? state.searchUser[i].avater!.url!
                              : "https://upload.wikimedia.org/wikipedia/commons/thumb/a/ac/No_image_available.svg/300px-No_image_available.svg.png?20221208232400"),
                        ),
                        title: Row(
                          children: [
                            Text(state.searchUser[i].name!),
                            SizedBox(
                              width: 5,
                            ),
                            state.searchUser[i].userverify == true
                                ? Icon(
                                    Icons.verified_user,
                                    size: 16,
                                    color: Colors.green,
                                  )
                                : SizedBox(),
                          ],
                        ),
                        trailing: IconButton(
                            onPressed: () {
                              state.searchUser.removeAt(i);
                            },
                            icon: Icon(
                              Icons.close,
                              size: 17,
                            )),
                      )
                  ],
                )),
              );
            },
          )
        ],
      ),
    );
  }
}
