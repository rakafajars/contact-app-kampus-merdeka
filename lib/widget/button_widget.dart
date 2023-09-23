import 'package:contact_app/theme/theme_color.dart';
import 'package:contact_app/theme/theme_text_style.dart';
import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final String title;
  final Function()? onPressed;
  const ButtonWidget({
    super.key,
    required this.title,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: ThemeColor().m3SysLightPurple,
      ),
      onPressed: onPressed,
      child: Text(
        title,
        style: ThemeTextStyle().m3LabelLarge,
      ),
    );
  }
}
