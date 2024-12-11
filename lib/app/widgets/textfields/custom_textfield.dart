import 'package:flutter/material.dart';
import 'package:kazakhi_auto_web/constants/app_colors.dart'; // Replace with your actual AppColors import

class CustomTextfield extends StatelessWidget {
  final String hintText;
  final IconData? rightIcon;
  final TextEditingController controller;
  const CustomTextfield(
      {super.key,
      required this.hintText,
      this.rightIcon,
      required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.secondary, // Background color
        borderRadius: BorderRadius.circular(8), // Rounded corners
        border:
            Border.all(color: Colors.grey.shade300, width: 1), // Border color
      ),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: const TextStyle(color: Colors.grey), // Hint text color
          border: InputBorder.none, // Removes default border
          contentPadding: const EdgeInsets.symmetric(
              horizontal: 16, vertical: 12), // Padding inside the field
          suffixIcon: rightIcon != null
              ? Icon(rightIcon, color: Colors.black) // Right icon (optional)
              : null,
        ),
        style: const TextStyle(color: Colors.black), // Text color
        cursorColor: Colors.black, // Cursor color
      ),
    );
  }
}
