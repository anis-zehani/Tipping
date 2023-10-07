import 'package:flutter/material.dart';

import 'app_bar.dart';
import 'drawer.dart';

class TipWorkerPage extends StatefulWidget {
  const TipWorkerPage({Key? key, qrCode}) : super(key: key);

  @override
  State<TipWorkerPage> createState() => _TipWorkerPageState();
}

class _TipWorkerPageState extends State<TipWorkerPage> {
  String qrCode = '';

  void update(String qrCode) {
    setState(() => qrCode = qrCode);
  }

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
        appBar: const AppBarPage(),
        drawer: const DrawerPage(),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              const Text(
                'Worker Profile',
                style: TextStyle(
                    color: Color.fromARGB(255, 2, 2, 2),
                    fontWeight: FontWeight.w600,
                    fontSize: 20),
              ),
              const Image(
                  image: NetworkImage(
                      'https://pbs.twimg.com/profile_images/1630389794806157313/AFcZmyjf_400x400.jpg')),
              Text(
                qrCode,
                style: const TextStyle(
                    color: Color.fromARGB(255, 2, 2, 2),
                    fontWeight: FontWeight.w600,
                    fontSize: 20),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
