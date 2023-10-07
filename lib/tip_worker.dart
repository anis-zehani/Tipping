import 'package:flutter/material.dart';

import 'app_bar.dart';
import 'drawer.dart';

class TipWorkerPage extends StatelessWidget {
  final String qrCode;
  const TipWorkerPage({super.key, required this.qrCode});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 35, 75, 121)),
      ),
      home: const Scaffold(
        appBar: AppBarPage(),
        drawer: DrawerPage(),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: 50),
              Text(
                'Worker Profile',
                style: TextStyle(
                    color: Color.fromARGB(255, 2, 2, 2),
                    fontWeight: FontWeight.w600,
                    fontSize: 20),
              ),
              SizedBox(height: 50),
              CircleAvatar(
                radius: 100,
                backgroundImage: NetworkImage(
                    'https://pbs.twimg.com/profile_images/1630389794806157313/AFcZmyjf_400x400.jpg'),
              ),
              SizedBox(height: 20),
              Image(
                  width: 100,
                  height: 40,
                  image: NetworkImage(
                      'https://www.pngmart.com/files/10/5-Stars-PNG-Clipart.png')),
              SizedBox(height: 10),
              Text(
                'Anis Zehani' /*qrCode*/,
                style: TextStyle(
                    color: Color.fromARGB(255, 2, 2, 2),
                    fontWeight: FontWeight.w400,
                    fontSize: 18),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
