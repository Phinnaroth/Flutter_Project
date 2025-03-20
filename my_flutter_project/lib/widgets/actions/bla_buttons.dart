import 'package:flutter/material.dart';

class BlaButtons extends StatelessWidget {
  final IconData? icon;
  final String label;
  final VoidCallback onPressed;
  const BlaButtons({super.key, required this.label, required this.onPressed, this.icon});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(label),
      
    );
  }
}