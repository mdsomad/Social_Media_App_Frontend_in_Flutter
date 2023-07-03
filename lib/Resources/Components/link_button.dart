
import 'package:flutter/cupertino.dart';
import 'package:social_media_app_frontend_in_flutter/Resources/Colors/themes.dart';

class LinkButton extends StatelessWidget {
  final String text;
  final Function()? onPressed;
  final Color? color;

  const LinkButton({
    super.key,
    required this.text,
    this.onPressed,
    this.color
  });

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      onPressed: onPressed,
      padding: EdgeInsets.zero,
      child: Text(text, style: TextStyle(
         color: color ?? AppColors.accent
      ),),
    );
  }
}