// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'home.dart';
import 'scan_worker.dart';
import 'tips_pending.dart';

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
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: true,
          colorScheme:
              ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 35, 75, 121)),
        ),
        home: MyHomePage(),
        routes: {
          // When navigating to the "/" route, build the FirstScreen widget.
          "/HomePage": (final context) => const HomePage(),
          // When navigating to the "/second" route, build the SecondScreen widget.
          "/ScanWorkerPage": (final context) => const ScanWorkerPage(),
          "/TipsPendingPage": (final context) => const TipsPendingPage(),
        },
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
  final PersistentTabController _controller =
      PersistentTabController(initialIndex: 1);

//Screens for each nav items.
  List<Widget> _navScreens() {
    return [
      HomePage(),
      ScanWorkerPage(),
      TipsPendingPage(),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: Icon(Icons.home_filled),
        title: ("Home"),
        activeColorPrimary: const Color.fromARGB(255, 39, 89, 131),
        inactiveColorPrimary: Color.fromARGB(255, 102, 100, 100),
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.add_circle_rounded),
        title: ("Scan QR code"),
        iconSize: 40,
        activeColorPrimary: const Color.fromARGB(255, 39, 89, 131),
        inactiveColorPrimary: Color.fromARGB(255, 102, 100, 100),
        activeColorSecondary: Color.fromARGB(255, 255, 255, 255),
        inactiveColorSecondary: Color.fromARGB(255, 255, 255, 255),
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.list_rounded),
        title: ("Pending tips"),
        activeColorPrimary: const Color.fromARGB(255, 39, 89, 131),
        inactiveColorPrimary: Color.fromARGB(255, 102, 100, 100),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: PersistentTabView(
        context,
        controller: _controller,
        screens: _navScreens(),
        items: _navBarsItems(),
        confineInSafeArea: true,
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        handleAndroidBackButtonPress: true,
        resizeToAvoidBottomInset: true,
        hideNavigationBarWhenKeyboardShows: true,
        decoration: NavBarDecoration(
          borderRadius: BorderRadius.circular(0.0),
        ),
        stateManagement: true,
        popAllScreensOnTapOfSelectedTab: true,
        popActionScreens: PopActionScreensType.all,
        navBarStyle: NavBarStyle.style15,
      ),
    );
  }
}
