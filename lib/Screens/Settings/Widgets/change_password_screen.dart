import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:social_media_app_frontend_in_flutter/Resources/Colors/app_colors.dart';
import 'package:social_media_app_frontend_in_flutter/Resources/Components/gap_widget.dart';
import 'package:social_media_app_frontend_in_flutter/Resources/Components/primary_textfield.dart';
import 'package:social_media_app_frontend_in_flutter/Resources/Components/round_button.dart';
import 'package:social_media_app_frontend_in_flutter/Screens/Settings/Provider/change_password_Provider.dart';



class ChangePasswordScreen extends StatelessWidget {
  const ChangePasswordScreen({super.key});

  static const String routeName = "changePassword";

  @override
  Widget build(BuildContext context) {
     final provider = Provider.of<ChangePasswordProvider>(context);
    return Scaffold(
    
      body: SafeArea(child: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Form(
          key: provider.formKey,
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
                child: Text("Change Pssword", style: TextStyles.heading2),
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
                         controller: provider.oldPasswordController,
                        obscureText: false,
                        validator: (value) {
                          if(value == null || value.trim().isEmpty) {
                            return "Old Password is required!";
                          }
                          return null;
                        },
                        labelText: "Enter Old Password"
                      ),
                   ),
        
                   Padding(
                     padding: const EdgeInsets.only(top: 25,left: 15,right: 15),
                     child: PrimaryTextField(
                         controller: provider.newPasswordController,
                        obscureText: false,
                        validator: (value) {
                          if(value == null || value.trim().isEmpty) {
                            return "New Password is required!";
                          }
                          return null;
                        },
                        labelText: "Enter New Password"
                      ),
                   ),
        
        
                   Padding(
                     padding: const EdgeInsets.only(top: 25,left: 15,right: 15),
                     child: PrimaryTextField(
                        controller: provider.cPasswordController,
                        obscureText: false,
                        validator: (value) {
                          if(value == null || value.trim().isEmpty) {
                            return "Confirm Password is required!";
                          }
                          
                          return null;
                        },
                        labelText: "Enter Confirm  Password"
                      ),
                   ),
        
        
                   
                   Padding(
                     padding: const EdgeInsets.only(top: 70,left: 15,right: 15),
                     child: 
                     RoundButton(
                      loading: provider.isLoading,
                      title: "CHANGE PASSWORD", onTap: () { 
                        provider.ChangePassword();
                       },
                     )
                   ),
            ],
          ),
        ),
      ))

    );
  }
}