// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'home.dart';
import 'scan_worker.dart';
import 'tips_list.dart';

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
  var selectedIndexNavigationBar = 1;

  @override
  Widget build(BuildContext context) {
    var colorScheme = Theme.of(context).colorScheme;

    Widget page;
    switch (selectedIndexNavigationBar) {
      case 0:
        page = HomePage();
        break;
      case 1:
        page = ScanWorkerPage();
        break;
      case 2:
        page = TipsListPage();
        break;
      default:
        throw UnimplementedError('No widget for $selectedIndexNavigationBar');
    }

    // The container for the current page, with its background color and subtle switching animation.
    var mainArea = ColoredBox(
      color: colorScheme.surfaceVariant,
      child: AnimatedSwitcher(
        duration: Duration(milliseconds: 0),
        child: page,
      ),
    );

    return SafeArea(
      child: Scaffold(
        body: LayoutBuilder(
          builder: (context, constraints) {
            if (constraints.maxWidth < 450) {
              // Use a more mobile-friendly layout with BottomNavigationBar on narrow screens.
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
                          icon: Icon(Icons.add_circle_rounded),
                          label: 'Scan',
                        ),
                        BottomNavigationBarItem(
                          icon: Icon(Icons.list_rounded),
                          label: 'Tips',
                        ),
                      ],
                      currentIndex: selectedIndexNavigationBar,
                      onTap: (value) {
                        setState(() {
                          selectedIndexNavigationBar = value;
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
                          icon: Icon(Icons.add_circle_rounded),
                          label: Text('Scan'),
                        ),
                        NavigationRailDestination(
                          icon: Icon(Icons.list_rounded),
                          label: Text('Tips'),
                        ),
                      ],
                      selectedIndex: selectedIndexNavigationBar,
                      onDestinationSelected: (value) {
                        setState(() {
                          selectedIndexNavigationBar = value;
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
      ),
    );
  }
}
