// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class AppBarPage extends StatelessWidget implements PreferredSizeWidget {
  String title = 'US Tipping';
  AppBarPage({super.key, required this.title});

  final Color backgroundColor = const Color.fromARGB(255, 255, 255, 255);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: const Color.fromARGB(255, 0, 74, 172),
      title: Text(
        title,
        style: const TextStyle(
            color: Color.fromARGB(255, 255, 255, 255),
            fontWeight: FontWeight.w600,
            fontSize: 16),
      ),
      centerTitle: true,
      iconTheme: const IconThemeData(color: Color.fromARGB(255, 255, 255, 255)),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
