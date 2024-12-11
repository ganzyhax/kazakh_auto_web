import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:kazakhi_auto_web/app/functions/global_function.dart';
import 'package:kazakhi_auto_web/constants/app_colors.dart';

class HomeHeaderMobileCard extends StatelessWidget {
  const HomeHeaderMobileCard({super.key});

  @override
  Widget build(BuildContext context) {
    var deviceType = GlobalFunction().getDeviceType(context);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      color: AppColors.secondary,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Image.asset(
                'assets/images/logo_bg.jpg', // Replace with your logo
                width: 40,
                height: 40,
              ),
              const SizedBox(width: 8),
              Text(
                "Kazakh Auto Group",
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
              ),
            ],
          ),
          // Custom Dropdown Menu
          _CustomMenuButton(),
        ],
      ),
    );
  }
}

class _CustomMenuButton extends StatefulWidget {
  @override
  State<_CustomMenuButton> createState() => _CustomMenuButtonState();
}

class _CustomMenuButtonState extends State<_CustomMenuButton> {
  bool _isDropdownOpen = false;

  void _toggleDropdown() {
    setState(() {
      _isDropdownOpen = !_isDropdownOpen;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Row(
          children: [
            _buildMenuItem(
              icon: Icons.language,
              label: "RU",
              iconColor: Colors.black,
              onTap: () {},
            ),
            SizedBox(
              width: 15,
            ),
            GestureDetector(
              onTap: _toggleDropdown,
              child: const Icon(Icons.menu, color: Colors.black),
            ),
          ],
        ),
        if (_isDropdownOpen)
          Positioned(
            top: 55,
            right: 0,
            child: Container(
              padding: EdgeInsets.all(15),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                children: [
                  _buildMenuItem(
                    label: "Home",
                    onTap: () {
                      print("Home clicked");
                      _toggleDropdown();
                    },
                  ),
                  _buildMenuItem(
                    label: "Profile",
                    onTap: () {
                      print("Profile clicked");
                      _toggleDropdown();
                    },
                  ),
                  _buildMenuItem(
                    label: "Settings",
                    onTap: () {
                      print("Settings clicked");
                      _toggleDropdown();
                    },
                  ),
                ],
              ),
            ),
          ),
      ],
    );
  }

  Widget _buildMenuItem({
    IconData? icon,
    required String label,
    Color iconColor = Colors.blue,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Row(
          children: [
            (icon == null) ? SizedBox() : Icon(icon, color: iconColor),
            (icon == null) ? SizedBox() : SizedBox(width: 10),
            Text(label, style: const TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}
