import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:social_media_app_frontend_in_flutter/Models/Use_profiledetels_model.dart';
import 'package:social_media_app_frontend_in_flutter/Resources/Colors/app_colors.dart';
import 'package:social_media_app_frontend_in_flutter/Resources/Components/gap_widget.dart';
import 'package:social_media_app_frontend_in_flutter/Resources/Components/primary_textfield.dart';
import 'package:social_media_app_frontend_in_flutter/Resources/Components/round_button.dart';
import 'package:social_media_app_frontend_in_flutter/Screens/My_Profile/Provider/update_profile_provider.dart';
import 'package:social_media_app_frontend_in_flutter/logic/cubits/user_cubit/user_state.dart';
import 'package:social_media_app_frontend_in_flutter/logic/cubits/user_details/user_details_cubit.dart';
import 'package:social_media_app_frontend_in_flutter/logic/cubits/user_details/user_details_state.dart';



class UpdateScreen extends StatefulWidget {
  final UserProfileDetelsModel userModel;
 UpdateScreen({super.key,required this.userModel});

   static const String routeName = "updatePassword";

  @override
  State<UpdateScreen> createState() => _UpdateScreenState();
}

class _UpdateScreenState extends State<UpdateScreen> {

  final emailUpdateController = new TextEditingController();

  final nameUpdateController = new TextEditingController();



 @override
  void initState() {
    // TODO: implement initState
    super.initState();
    emailUpdateController.text = widget.userModel.email!;
    nameUpdateController.text = widget.userModel.name!;
  }

  

  @override
  Widget build(BuildContext context) {

   final provider = Provider.of<UpdateProfileProvider>(context);

   return Scaffold(
    
      body: SafeArea(child: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: editProfile(widget.userModel,widget.userModel,provider, context)
        
        
        
        
        
        
        
       
      ))

    );
  }









 Widget editProfile(UserProfileDetelsModel userProfileDetelsModel, UserProfileDetelsModel oldUserProfileDetelsModel,UpdateProfileProvider provider, BuildContext context) {
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
              
                    (provider.error != "") ? Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Text(
                        provider.error,
                        style: const TextStyle(color: Colors.red),
                      ),
                    ) : const SizedBox(),
        
                    
        
                   Padding(
                     padding: const EdgeInsets.only(top: 20,left: 15,right: 15),
                     child: PrimaryTextField(
                        controller: emailUpdateController,
                        onChanged: (value) {
                        },
                        labelText: "Email",
                      ),
                   ),
        
                   Padding(
                     padding: const EdgeInsets.only(top: 25,left: 15,right: 15),
                     child:  PrimaryTextField(
                        controller: nameUpdateController,
                        onChanged: (value) {
                        },
                        labelText: "Name",
                      ),
                   ),
        
        

        
                   
                   Padding(
                     padding: const EdgeInsets.only(top: 70,left: 15,right: 15),
                     child: 
                     RoundButton(
                      loading: provider.isLoading,
                      title: "Update Profile", onTap: () { 
                         BlocProvider.of<UserProfileDetelsCubit>(context).updateUser(emailUpdateController.text,nameUpdateController.text,userProfileDetelsModel,context);    //* <-- updateUser detels Function Call
                       },
                     )
                   ),
            ],
          ),
        );

 }
}