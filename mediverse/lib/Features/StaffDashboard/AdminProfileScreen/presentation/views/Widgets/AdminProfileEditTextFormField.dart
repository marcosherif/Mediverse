import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../../../../Constants/Themes.dart';
import '../../../../../../Constants/constant.dart';

class AdminProfileTextFormField extends StatelessWidget {
  String? text;
  AdminProfileTextFormField({
    super.key,
    required this.text,
    this.validator,
    required this.onChanged,
    required this.controller
  });
  Function(String)? onChanged;
  String? Function(String?)? validator;
  TextEditingController? controller;


  @override
  Widget build(BuildContext context) {
    return Container(
      width: 390,
      child: TextFormField(
          validator: validator,
          onChanged: onChanged,
          controller: controller,
          autofocus: false,
          autofillHints: [AutofillHints.email],
          obscureText: false,
          decoration: InputDecoration(
            hintText: text,
            labelStyle: Themes.fieldText,
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Color(0xFFE0E3E7),
                width: 2,
              ),
              borderRadius: BorderRadius.circular(12),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Colors.grey,
                width: 2,
              ),
              borderRadius: BorderRadius.circular(12),
            ),
            errorBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: errorColor,
                width: 2,
              ),
              borderRadius: BorderRadius.circular(12),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: errorColor,
                width: 2,
              ),
              borderRadius: BorderRadius.circular(12),
            ),
            filled: true,
            fillColor: Colors.white,
            contentPadding: const EdgeInsets.all(16),
          ),
          style: Themes.bodyMed
      ),
    );
  }
}
