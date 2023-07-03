
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:social_media_app_frontend_in_flutter/Resources/Colors/app_colors.dart';
import 'package:social_media_app_frontend_in_flutter/Resources/Components/gap_widget.dart';
import 'package:social_media_app_frontend_in_flutter/Resources/Components/link_button.dart';
import 'package:social_media_app_frontend_in_flutter/Resources/Components/primary_button.dart';
import 'package:social_media_app_frontend_in_flutter/Resources/Components/primary_textfield.dart';
import 'package:social_media_app_frontend_in_flutter/Screens/Auth/Provider/signup_provider.dart';




class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});


  static const String routeName = "signup";
  

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {

  
  @override
  Widget build(BuildContext context) {

   final provider = Provider.of<SignupProvider>(context);

    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          elevation: 0,
          title: const Text("Ecommerce App")
        ),

        body: SafeArea(
          child: Form(
            key: provider.formKey,
            child: ListView(
              padding: const EdgeInsets.all(16),
              children: [
          
                Text("Sign Up", style: TextStyles.heading2),
                
                const GapWidget(size: -10),
          
                (provider.error != "") ? Text(
                  provider.error,
                  style: const TextStyle(color: Colors.red),
                ) : const SizedBox(),
          
                const GapWidget(size: 5),
          
                PrimaryTextField(
                   controller: provider.userNameController,
                  validator: (value) {
                    if(value == null || value.trim().isEmpty) {
                      return "UserName is required!";
                    }
    
                    return null;
                  },
                  labelText: "UserName"
                ),
          

          
               const GapWidget(),

                PrimaryTextField(
                   controller: provider.emailController,
                  validator: (value) {
                    if(value == null || value.trim().isEmpty) {
                      return "Email address is required!";
                    }
    
                    if(!EmailValidator.validate(value.trim())) {
                      return "Invalid email address";
                    }
    
                    return null;
                  },
                  labelText: "Email Address"
                ), 
                
                const GapWidget(),
          
                PrimaryTextField(
                  controller: provider.passwordController,
                  obscureText: true,
                  validator: (value) {
                    if(value == null || value.trim().isEmpty) {
                      return "Password is required!";
                    }
                    return null;
                  },
                  labelText: "Password"
                ),


                const GapWidget(),
          
                PrimaryTextField(
                  controller: provider.cPasswordController,
                  obscureText: true,
                  validator: (value) {
                    if(value == null || value.trim().isEmpty) {
                      return "Confirm your password!";
                    }

                    if(value.trim() != provider.passwordController.text.trim()) {
                      return "Passwords do not match!";
                    }
                    
                    
                    return null;
                  },
                  labelText: "Confirm Password"
                ),
          
                const GapWidget(),
          
                PrimaryButton(
                  onPressed: provider.createAccount,
                  text: (provider.isLoading) ? "..." : "Create Account"
                ),
          
                const GapWidget(),
          
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
          
                    Text("Already have an account?", style: TextStyles.body2),
          
                    const GapWidget(),
          
                    LinkButton(
                      onPressed: () {
                        Navigator.pop(context);
                        // Navigator.pushNamed(context, LoginScreen.routeName);
                      },
                      text: "Log In"
                    )
          
                  ],
                ),
          
              ]
            ),
          ),
        ),
      );




  }
}

