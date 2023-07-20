import 'package:flutter/material.dart';
import 'package:social_media_app_frontend_in_flutter/Resources/Colors/app_colors.dart';
import 'package:social_media_app_frontend_in_flutter/Resources/Components/gap_widget.dart';
import 'package:social_media_app_frontend_in_flutter/Resources/Components/primary_textfield.dart';
import 'package:social_media_app_frontend_in_flutter/Resources/Components/round_button.dart';



class ChangePasswordScreen extends StatelessWidget {
  const ChangePasswordScreen({super.key});

  static const String routeName = "changePassword";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    
      body: SafeArea(child: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
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
            
                  // (provider.error != "") ? Text(
                  //   provider.error,
                  //   style: const TextStyle(color: Colors.red),
                  // ) : const SizedBox(),

                 Padding(
                   padding: const EdgeInsets.only(top: 40,left: 15,right: 15),
                   child: PrimaryTextField(
                      // controller: provider.passwordController,
                      obscureText: true,
                      validator: (value) {
                        if(value == null || value.trim().isEmpty) {
                          return "Password is required!";
                        }
                        return null;
                      },
                      labelText: "Enter Old Password"
                    ),
                 ),

                 Padding(
                   padding: const EdgeInsets.only(top: 25,left: 15,right: 15),
                   child: PrimaryTextField(
                      // controller: provider.passwordController,
                      obscureText: true,
                      validator: (value) {
                        if(value == null || value.trim().isEmpty) {
                          return "Password is required!";
                        }
                        return null;
                      },
                      labelText: "Enter New Password"
                    ),
                 ),


                 Padding(
                   padding: const EdgeInsets.only(top: 25,left: 15,right: 15),
                   child: PrimaryTextField(
                      // controller: provider.passwordController,
                      obscureText: true,
                      validator: (value) {
                        if(value == null || value.trim().isEmpty) {
                          return "Password is required!";
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
                    title: "CHANGE PASSWORD", onTap: () {  },
                   )
                 ),
          ],
        ),
      ))

    );
  }
}