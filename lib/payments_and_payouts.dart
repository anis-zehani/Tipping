import 'package:flutter/material.dart';

import 'app_bar.dart';
import 'drawer.dart';

class PaymentsAndPayoutsPage extends StatelessWidget {
  const PaymentsAndPayoutsPage({Key? key}) : super(key: key);

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
        appBar: AppBarPage(title: 'Payments & payouts'),
        drawer: const DrawerPage(),
        body: const SingleChildScrollView(
          padding: EdgeInsets.all(8),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(height: 50),
                Row(
                  children: [
                    Text(
                      'Giving tips',
                      style: TextStyle(
                          color: Color.fromARGB(255, 2, 2, 2),
                          fontWeight: FontWeight.w600,
                          fontSize: 20),
                    ),
                  ],
                ),
                SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(Icons.payment),
                    Text(
                      'Payments methods',
                      style: TextStyle(
                          color: Color.fromARGB(255, 2, 2, 2),
                          fontWeight: FontWeight.w400,
                          fontSize: 18),
                    ),
                    Icon(Icons.chevron_right),
                  ],
                ),
                SizedBox(height: 200),
                Divider(
                  height: 20,
                  thickness: 1,
                  indent: 0,
                  endIndent: 0,
                  color: Colors.black,
                ),
                SizedBox(height: 50),
                Row(
                  children: [
                    Text(
                      'Receiving tips',
                      style: TextStyle(
                          color: Color.fromARGB(255, 2, 2, 2),
                          fontWeight: FontWeight.w600,
                          fontSize: 20),
                    ),
                  ],
                ),
                SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(Icons.account_balance),
                    Text(
                      'Payout methods',
                      style: TextStyle(
                          color: Color.fromARGB(255, 2, 2, 2),
                          fontWeight: FontWeight.w400,
                          fontSize: 18),
                    ),
                    Icon(Icons.chevron_right),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
