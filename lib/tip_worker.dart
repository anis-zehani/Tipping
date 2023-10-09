import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
      home: Scaffold(
        appBar: AppBarPage(title: 'Give a new tip'),
        drawer: const DrawerPage(),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              const SizedBox(height: 50),
              const Text(
                'Anis Zehani' /*qrCode*/,
                style: TextStyle(
                    color: Color.fromARGB(255, 2, 2, 2),
                    fontWeight: FontWeight.w600,
                    fontSize: 20),
              ),
              const SizedBox(height: 15),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    '5.0 ',
                    style: TextStyle(
                        color: Color.fromARGB(255, 2, 2, 2),
                        fontWeight: FontWeight.w600,
                        fontSize: 20),
                  ),
                  Image(
                      width: 100,
                      height: 30,
                      image: NetworkImage(
                          'https://www.pngmart.com/files/10/5-Stars-PNG-Clipart.png')),
                  Text(
                    ' (34 reviews)',
                    style: TextStyle(
                        color: Color.fromARGB(255, 2, 2, 2),
                        fontWeight: FontWeight.w400,
                        fontSize: 18),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              const CircleAvatar(
                radius: 70,
                backgroundImage: NetworkImage(
                    'https://pbs.twimg.com/profile_images/1630389794806157313/AFcZmyjf_400x400.jpg'),
              ),
              const SizedBox(height: 30),
              const Text(
                'How much do you want to tip ?',
                style: TextStyle(
                    color: Color.fromARGB(255, 2, 2, 2),
                    fontWeight: FontWeight.w600,
                    fontSize: 20),
              ),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  IconButton(
                    iconSize: 60.0,
                    icon: const Icon(Icons.remove_circle_rounded),
                    onPressed: () {},
                  ),
                  SizedBox(
                    width: 100,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextFormField(
                          style: const TextStyle(
                              height: 1,
                              fontWeight: FontWeight.w400,
                              fontSize: 40,
                              color: Color.fromARGB(255, 35, 75, 121)),
                          textAlign: TextAlign.center,
                          textAlignVertical: TextAlignVertical.center,
                          initialValue: '0',
                          decoration: InputDecoration(
                            hintText: '0',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(50.0)),
                            labelText: '',
                          ),
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(
                                RegExp(r'^[0-9]+.?[0-9]*'))
                          ],
                        )
                      ],
                    ),
                  ),
                  IconButton(
                    iconSize: 60.0,
                    icon: const Icon(Icons.add_circle_rounded),
                    onPressed: () {},
                  ),
                ],
              ),
              const SizedBox(height: 100),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      'Pay later',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text(
                      'Pay now',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
