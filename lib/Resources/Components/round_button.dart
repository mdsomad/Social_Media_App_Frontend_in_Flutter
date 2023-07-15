import 'package:flutter/material.dart';
import 'package:social_media_app_frontend_in_flutter/Resources/Colors/themes.dart';



class RoundButton extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  final bool loading;
  const RoundButton({Key? key,required this.title,required this.onTap,this.loading = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
       color:AppColors.accent,                 // <-- CALL AppColors Class
       borderRadius: BorderRadius.circular(10),
      child: InkWell(
      onTap: onTap,
      child: Container(
        height: 53,
        child: Center(child:loading?CircularProgressIndicator(strokeWidth: 4,color: Colors.white,):Text(title,style: TextStyle(color: Colors.white,fontSize: 18)),
      ),
    )),
    );
  }
}