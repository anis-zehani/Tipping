import 'package:flutter/material.dart';
import 'package:tipping/home.dart';
import 'package:tipping/profile.dart';

import 'logout.dart';
import 'payments.dart';
import 'switch.dart';
import 'tips.dart';

class DrawerPage extends StatelessWidget {
  const DrawerPage({Key? key}) : super(key: key);

  final selectedIndexDrawer = 0;

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
              //selected: selectedIndexDrawer == 0,
              onTap: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => const HomePage()));
              },
            ),
            ListTile(
              title: const Text('My profile'),
              leading: const Icon(Icons.account_circle_rounded),
              //selected: selectedIndexDrawer == 1,
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const ProfilePage(),
                  ),
                );
              },
            ),
            ListTile(
              title: const Text('My tips'),
              leading: const Icon(Icons.list_rounded),
              //selected: selectedIndexDrawer == 2,
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const TipsPage(),
                  ),
                );
              },
            ),
            ListTile(
              title: const Text('Payments & payouts'),
              leading: const Icon(Icons.payment_rounded),
              //selected: selectedIndexDrawer == 3,
              onTap: () {
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
              //selected: selectedIndexDrawer == 4,
              onTap: () {
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
              //selected: selectedIndexDrawer == 5,
              onTap: () {
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
