import 'package:flutter/material.dart';
import 'package:tipping/home.dart';
import 'package:tipping/profile_consumer.dart';

import 'logout.dart';
import 'payments_and_payouts.dart';
import 'switch_to_receiving_tips.dart';
import 'tips_list.dart';
import 'tips_pending.dart';

class DrawerPage extends StatefulWidget {
  const DrawerPage({Key? key}) : super(key: key);

  @override
  State<DrawerPage> createState() => _DrawerPageState();
}

class _DrawerPageState extends State<DrawerPage> {
  //var _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            const UserAccountsDrawerHeader(
              accountName: Text('Y Combinator'),
              accountEmail: Text('apply@ycombinator.com'),
              currentAccountPicture: CircleAvatar(
                backgroundImage: NetworkImage(
                    'https://pbs.twimg.com/profile_images/1623777064821358592/9CApQWXe_400x400.png'),
              ),
            ),
            ListTile(
              title: const Text('Home'),
              leading: const Icon(Icons.home_filled),
              //selected: _selectedIndex == 0,
              onTap: () {
                /*setState(() {
                  _selectedIndex = 0;
                });*/
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const HomePage(),
                ));
              },
            ),
            ListTile(
              title: const Text('My profile'),
              leading: const Icon(Icons.account_circle_rounded),
              //selected: _selectedIndex == 1,
              onTap: () {
                /*setState(() {
                  _selectedIndex = 1;
                });*/
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const ProfileConsumerPage(),
                  ),
                );
              },
            ),
            ListTile(
              title: const Text('Pending tips'),
              leading: const Icon(Icons.list_rounded),
              //selected: _selectedIndex == 2,
              onTap: () {
                /*setState(() {
                  _selectedIndex = 2;
                });*/
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const TipsPendingPage(),
                  ),
                );
              },
            ),
            ListTile(
              title: const Text('Transaction history'),
              leading: const Icon(Icons.history_rounded),
              //selected: _selectedIndex == 3,
              onTap: () {
                /*setState(() {
                  _selectedIndex = 3;
                });*/
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => TipsListPage(),
                  ),
                );
              },
            ),
            ListTile(
              title: const Text('Payments & payouts'),
              leading: const Icon(Icons.payment_rounded),
              //selected: _selectedIndex == 4,
              onTap: () {
                /*setState(() {
                  _selectedIndex = 4;
                });*/
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const PaymentsAndPayoutsPage(),
                  ),
                );
              },
            ),
            ListTile(
              title: const Text('Switch to receiving tips'),
              leading: const Icon(Icons.switch_account),
              //selected: _selectedIndex == 5,
              onTap: () {
                /*setState(() {
                  _selectedIndex = 5;
                });*/
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const SwitchToReceivingTipsPage(),
                  ),
                );
              },
            ),
            ListTile(
              title: const Text('Logout'),
              leading: const Icon(Icons.logout_rounded),
              //selected: _selectedIndex == 6,
              onTap: () {
                /*setState(() {
                  _selectedIndex = 6;
                });*/
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const LogoutPage(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
