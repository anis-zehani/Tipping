import 'package:flutter/material.dart';

import 'app_bar.dart';
import 'drawer.dart';

class LogoutPage extends StatelessWidget {
  const LogoutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 35, 75, 121)),
      ),
      home: Scaffold(
        appBar: AppBarPage(title: 'Logout'),
        drawer: const DrawerPage(),
        body: const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              CircleAvatar(
                radius: 150,
                backgroundImage: NetworkImage(
                    'https://cdn.iconscout.com/icon/premium/png-256-thumb/coming-soon-2367904-1976493.png'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
