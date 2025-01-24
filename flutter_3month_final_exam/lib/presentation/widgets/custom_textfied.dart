import 'package:flutter/material.dart';
import 'package:flutter_3month_final_exam/utils/textfile_decoraton.dart';

class CustomTextFiellWidget extends StatelessWidget {
  const CustomTextFiellWidget({
    super.key,
    required this.emailController,
    required this.label,
    required this.hint_text,
    required this.icon_prefs,
  });

  final TextEditingController emailController;
  final String label;
  final String hint_text;
  final Icon icon_prefs;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: TextField(
        decoration: InputDecoration(
            prefixIcon: icon_prefs,
            hintText: hint_text,
            labelText: label,
            focusedBorder: OutlinedBorderCustom.inputBorder_focused,
            enabledBorder: OutlinedBorderCustom.inputBorder_enabled),
        controller: emailController,
      ),
    );
  }
}
