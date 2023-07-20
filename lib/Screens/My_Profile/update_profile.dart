import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_media_app_frontend_in_flutter/Models/Use_profiledetels_model.dart';
import 'package:social_media_app_frontend_in_flutter/Resources/Colors/app_colors.dart';
import 'package:social_media_app_frontend_in_flutter/Resources/Components/gap_widget.dart';
import 'package:social_media_app_frontend_in_flutter/Resources/Components/primary_textfield.dart';
import 'package:social_media_app_frontend_in_flutter/Resources/Components/round_button.dart';
import 'package:social_media_app_frontend_in_flutter/logic/cubits/user_cubit/user_state.dart';
import 'package:social_media_app_frontend_in_flutter/logic/cubits/user_details/user_details_cubit.dart';
import 'package:social_media_app_frontend_in_flutter/logic/cubits/user_details/user_details_state.dart';



class UpdateScreen extends StatelessWidget {
  final UserProfileDetelsModel userModel;
  const UpdateScreen({super.key,required this.userModel});

   static const String routeName = "updatePassword";

  @override
  Widget build(BuildContext context) {
   return Scaffold(
    
      body: SafeArea(child: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: editProfile(userModel, context)
        
        
        
        
        
        
        
       
      ))

    );
  }



 Widget editProfile(UserProfileDetelsModel userModel, BuildContext context) {
    return Form(
          // key: provider.formKey,
          child: ListView(
            children: [
              Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.arrow_back),
                    onPressed: () {
                      Navigator.pop(context);
                    }
                  ),
              
                  
                ],
              ),
        
        
              Padding(
                padding: const EdgeInsets.only(left: 20,top: 15),
                child: Text("Update Profile", style: TextStyles.heading2),
              ),
                    
                    const GapWidget(size: -10),
              
                    // (provider.error != "") ? Padding(
                    //   padding: const EdgeInsets.only(left: 20),
                    //   child: Text(
                    //     provider.error,
                    //     style: const TextStyle(color: Colors.red),
                    //   ),
                    // ) : const SizedBox(),
        
                    
        
                   Padding(
                     padding: const EdgeInsets.only(top: 20,left: 15,right: 15),
                     child: PrimaryTextField(
                        initialValue: userModel.email,
                        onChanged: (value) {
                          userModel.email = value;
                        },
                        labelText: "Email",
                      ),
                   ),
        
                   Padding(
                     padding: const EdgeInsets.only(top: 25,left: 15,right: 15),
                     child:  PrimaryTextField(
                        initialValue: userModel.name,
                        onChanged: (value) {
                          userModel.name = value;
                        },
                        labelText: "Name",
                      ),
                   ),
        
        

        
                   
                   Padding(
                     padding: const EdgeInsets.only(top: 70,left: 15,right: 15),
                     child: 
                     RoundButton(
                      // loading: provider.isLoading,
                      title: "Update Profile", onTap: () { 
                         BlocProvider.of<UserProfileDetelsCubit>(context).updateUser(userModel);
                       },
                     )
                   ),
            ],
          ),
        );

 }
  
}