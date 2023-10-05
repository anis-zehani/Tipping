// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'scan.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MyAppState(),
      child: MaterialApp(
        title: 'US Tipping',
        theme: ThemeData(
          useMaterial3: true,
          colorScheme:
              ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 35, 75, 121)),
        ),
        home: MyHomePage(),
      ),
    );
  }
}

class MyAppState extends ChangeNotifier {}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var selectedIndex = 2;

  @override
  Widget build(BuildContext context) {
    var colorScheme = Theme.of(context).colorScheme;

    Widget page;
    switch (selectedIndex) {
      case 0:
        page = HomePage();
        break;
      case 1:
        page = SettingsPage();
        break;
      case 2:
        page = ScanPage();
        break;
      case 3:
        page = TipsPage();
        break;
      case 4:
        page = ProfilePage();
        break;
      case 5:
        page = PaymentsAndPayoutsPage();
        break;
      case 6:
        page = SwitchToReceivingTipsPage();
        break;
      case 7:
        page = LogoutPage();
        break;
      default:
        throw UnimplementedError('No widget for $selectedIndex');
    }
    // The container for the current page, with its background color
    // and subtle switching animation.
    var mainArea = ColoredBox(
      color: colorScheme.surfaceVariant,
      child: AnimatedSwitcher(
        duration: Duration(milliseconds: 10),
        child: page,
      ),
    );

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 39, 89, 131),
        title: Text(
          'US Tipping',
          style: TextStyle(
              color: Color.fromARGB(255, 255, 255, 255),
              fontWeight: FontWeight.w600,
              fontSize: 16),
        ),
        centerTitle: true,
        iconTheme: IconThemeData(color: Color.fromARGB(255, 255, 255, 255)),
      ),
      drawer: Drawer(
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 249, 250, 250),
              ),
              child: Text('US Tipping'),
            ),
            ListTile(
              title: const Text('Home'),
              selected: selectedIndex == 0,
              onTap: () {
                setState(() {
                  selectedIndex = 0;
                });
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('My profile'),
              selected: selectedIndex == 4,
              onTap: () {
                setState(() {
                  selectedIndex = 4;
                });
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('My transactions'),
              selected: selectedIndex == 3,
              onTap: () {
                setState(() {
                  selectedIndex = 3;
                });
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Payments & payouts'),
              //selected: selectedIndex == 5,
              onTap: () {
                /*setState(() {
                  selectedIndex = 5;
                });*/
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Switch to receiving tips'),
              //selected: selectedIndex == 6,
              onTap: () {
                /*setState(() {
                  selectedIndex = 6;
                });*/
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Logout'),
              //selected: selectedIndex == 7,
              onTap: () {
                /*setState(() {
                  selectedIndex = 7;
                });*/
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth < 450) {
            // Use a more mobile-friendly layout with BottomNavigationBar
            // on narrow screens.
            return Column(
              children: [
                Expanded(child: mainArea),
                SafeArea(
                  child: BottomNavigationBar(
                    items: [
                      BottomNavigationBarItem(
                        icon: Icon(Icons.home_filled),
                        label: 'Home',
                      ),
                      BottomNavigationBarItem(
                        icon: Icon(Icons.settings),
                        label: 'Settings',
                      ),
                      BottomNavigationBarItem(
                        icon: Icon(Icons.add_circle_rounded),
                        label: 'Scan',
                      ),
                      BottomNavigationBarItem(
                        icon: Icon(Icons.shopping_cart_rounded),
                        label: 'Tips',
                      ),
                      BottomNavigationBarItem(
                        icon: Icon(Icons.account_circle_rounded),
                        label: 'Profile',
                      ),
                    ],
                    currentIndex: selectedIndex,
                    onTap: (value) {
                      setState(() {
                        selectedIndex = value;
                      });
                    },
                    type: BottomNavigationBarType.fixed,
                  ),
                )
              ],
            );
          } else {
            return Row(
              children: [
                SafeArea(
                  child: NavigationRail(
                    extended: constraints.maxWidth >= 600,
                    destinations: [
                      NavigationRailDestination(
                        icon: Icon(Icons.home_filled),
                        label: Text('Home'),
                      ),
                      NavigationRailDestination(
                        icon: Icon(Icons.settings),
                        label: Text('Settings'),
                      ),
                      NavigationRailDestination(
                        icon: Icon(Icons.add_circle_rounded),
                        label: Text('Scan'),
                      ),
                      NavigationRailDestination(
                        icon: Icon(Icons.shopping_cart_rounded),
                        label: Text('Tips'),
                      ),
                      NavigationRailDestination(
                        icon: Icon(Icons.account_circle_rounded),
                        label: Text('Profile'),
                      ),
                    ],
                    selectedIndex: selectedIndex,
                    onDestinationSelected: (value) {
                      setState(() {
                        selectedIndex = value;
                      });
                    },
                  ),
                ),
                Expanded(child: mainArea),
              ],
            );
          }
        },
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //var theme = Theme.of(context);
    //var appState = context.watch<MyAppState>();
    return Center(
      child: Text('Home'),
    );
  }
}

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //var theme = Theme.of(context);
    //var appState = context.watch<MyAppState>();
    return Center(
      child: Text('Settings'),
    );
  }
}

/*class ScanPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //var theme = Theme.of(context);
    //var appState = context.watch<MyAppState>();
    return Center(
      child: Text('Scan'),
    );
  }
}*/

class TipsPage extends StatelessWidget {
  const TipsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //var theme = Theme.of(context);
    //var appState = context.watch<MyAppState>();
    return Center(
      child: Text('Tips'),
    );
  }
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //var theme = Theme.of(context);
    //var appState = context.watch<MyAppState>();
    return Center(
      child: Text('Profile'),
    );
  }
}

class PaymentsAndPayoutsPage extends StatelessWidget {
  const PaymentsAndPayoutsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //var theme = Theme.of(context);
    //var appState = context.watch<MyAppState>();
    return Center(
      child: Text('Payments & payouts'),
    );
  }
}

class SwitchToReceivingTipsPage extends StatelessWidget {
  const SwitchToReceivingTipsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //var theme = Theme.of(context);
    //var appState = context.watch<MyAppState>();
    return Center(
      child: Text('Switch to receiving tips'),
    );
  }
}

class LogoutPage extends StatelessWidget {
  const LogoutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //var theme = Theme.of(context);
    //var appState = context.watch<MyAppState>();
    return Center(
      child: Text('Logout'),
    );
  }
}
