import 'package:flutter/material.dart';

class AppBarPage extends StatelessWidget implements PreferredSizeWidget {
  const AppBarPage({Key? key}) : super(key: key);

  final Color backgroundColor = const Color.fromARGB(255, 255, 255, 255);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: const Color.fromARGB(255, 39, 89, 131),
      title: const Text(
        'US Tipping',
        style: TextStyle(
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
