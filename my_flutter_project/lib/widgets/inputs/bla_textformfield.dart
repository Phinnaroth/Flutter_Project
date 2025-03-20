import 'package:flutter/material.dart';

class BlaTextFormField extends StatelessWidget {
  final TextEditingController? controller;
  final IconData? icon;
  final String? hintText;
  final bool readOnly;
  final VoidCallback? onTap;
  const BlaTextFormField(
    {super.key, this.controller, this.icon, this.hintText, this.readOnly = false, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
          scrollPadding: EdgeInsets.only(left: 50),
          controller: controller,
          readOnly: readOnly,
          onTap: onTap,
          decoration: InputDecoration(
            prefixIcon: icon != null ? Icon(icon) : null, 
            hintText: hintText,
            border: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.grey)
            ),
            contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
          ),
        ),
      ],
    );
  }
}