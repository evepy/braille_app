import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class AppBarE extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Color backgroundColor;
  final double titleSize;
  final Color titleColor;

  const AppBarE({super.key, 
    required this.title,
    required this.backgroundColor,
    required this.titleSize,
    required this.titleColor,
  });

  @override
  Size get preferredSize => const Size.fromHeight(60);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: backgroundColor,
      automaticallyImplyLeading: false,
      title: Align(
        alignment: Alignment.centerRight,
        child: Container(
          margin: const EdgeInsets.only(right: 40),
          child: Text(
            title,
            style: GoogleFonts.lato(
              fontWeight: FontWeight.w900,
              fontSize: titleSize,
              color: titleColor,
              letterSpacing: 0.1,
            ),
          ),
        ),
      ),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
      ),
    );
  }
}