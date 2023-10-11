// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'app_bar.dart';
import 'drawer.dart';

class TipWorkerPage extends StatefulWidget {
  final String qrCode;
  String workerName = 'Anis Zehani';
  String imageUrl =
      'https://pbs.twimg.com/profile_images/1630389794806157313/AFcZmyjf_400x400.jpg';

  TipWorkerPage(
      {super.key,
      required this.qrCode,
      required this.workerName,
      required this.imageUrl});

  @override
  State<TipWorkerPage> createState() => _TipWorkerPageState();
}

class _TipWorkerPageState extends State<TipWorkerPage> {
  final myController = TextEditingController(text: "0");

  @override
  void dispose() {
    myController.dispose();
    super.dispose();
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
        appBar: AppBarPage(title: 'Give a new tip'),
        drawer: const DrawerPage(),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              const SizedBox(height: 50),
              Text(
                widget.workerName /*widget.qrCode*/,
                style: const TextStyle(
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
              CircleAvatar(
                radius: 70,
                backgroundImage: NetworkImage(widget.imageUrl),
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
                    onPressed: () {
                      var value = double.parse(myController.text);
                      if (value >= 0.1) {
                        myController.text = (value - 0.1).toStringAsFixed(2);
                      }
                    },
                  ),
                  SizedBox(
                    width: 200,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextField(
                          controller: myController,
                          style: const TextStyle(
                              height: 1,
                              fontWeight: FontWeight.w400,
                              fontSize: 40,
                              color: Color.fromARGB(255, 35, 75, 121)),
                          textAlign: TextAlign.center,
                          textAlignVertical: TextAlignVertical.center,
                          decoration: InputDecoration(
                            hintText: '0',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(50.0)),
                            labelText: '\$',
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
                    onPressed: () {
                      var value = double.parse(myController.text);
                      myController.text = (value + 0.1).toStringAsFixed(2);
                    },
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
                      'Tip later',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      var value = double.parse(myController.text);
                      if (value >= 0.1) {
                        Widget cancelButton = ElevatedButton(
                          child: const Text("Cancel"),
                          onPressed: () {
                            Navigator.of(context, rootNavigator: true)
                                .pop('alert1');
                          },
                        );
                        Widget continueButton = ElevatedButton(
                          child: const Text("Continue"),
                          onPressed: () {
                            Widget okButton = ElevatedButton(
                              child: const Text("OK"),
                              onPressed: () {
                                Navigator.of(context, rootNavigator: true)
                                    .pop('alert3');

                                myController.text = (0).toStringAsFixed(1);
                                Navigator.of(context, rootNavigator: true)
                                    .pop();
                              },
                            );
                            // set up the AlertDialog
                            AlertDialog alert3 = AlertDialog(
                              title: const Text("Thank you"),
                              content: const Text(
                                  "Thank you, your payment was successful"),
                              actions: [
                                okButton,
                              ],
                            );
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return alert3;
                              },
                            );
                          },
                        );
                        // set up the AlertDialog
                        AlertDialog alert1 = AlertDialog(
                          title: const Text("Confirmation"),
                          content: Text(
                              'You will pay ${myController.text} \$, do you confirm ?'),
                          actions: [
                            cancelButton,
                            continueButton,
                          ],
                        );
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return alert1;
                          },
                        );
                      } else {
                        Widget okButton = ElevatedButton(
                          child: const Text("OK"),
                          onPressed: () {
                            Navigator.of(context, rootNavigator: true)
                                .pop('alert2');
                          },
                        );
                        // set up the AlertDialog
                        AlertDialog alert2 = AlertDialog(
                          title: const Text("Error"),
                          content: const Text(
                              "Please enter an amount greater than zero"),
                          actions: [
                            okButton,
                          ],
                        );
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return alert2;
                          },
                        );
                      }
                    },
                    child: Text(
                      'Tip now',
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
