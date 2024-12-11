import 'package:flutter/material.dart';
import 'package:kazakhi_auto_web/constants/app_colors.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final Function()? onTap;
  final bool? isHole;
  const CustomButton(
      {super.key, required this.text, required this.onTap, this.isHole});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.only(top: 10, bottom: 10, right: 15, left: 15),
        decoration: BoxDecoration(
            border:
                (isHole == true) ? Border.all(color: AppColors.primary) : null,
            borderRadius: BorderRadius.circular(7),
            color: (isHole == true) ? Colors.white : AppColors.primary),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
                fontWeight: FontWeight.w600,
                color: (isHole == true) ? AppColors.primary : Colors.white),
          ),
        ),
      ),
    );
  }
}
