import 'package:flutter/material.dart';

import 'app_bar.dart';
import 'drawer.dart';

class ProfileConsumerPage extends StatelessWidget {
  const ProfileConsumerPage({Key? key}) : super(key: key);

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
        appBar: AppBarPage(title: 'My profile'),
        drawer: const DrawerPage(),
        body: const SingleChildScrollView(
          padding: EdgeInsets.all(8),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(height: 50),
                Text(
                  'Paul Graham',
                  style: TextStyle(
                      color: Color.fromARGB(255, 2, 2, 2),
                      fontWeight: FontWeight.w600,
                      fontSize: 20),
                ),
                SizedBox(height: 30),
                CircleAvatar(
                  radius: 70,
                  backgroundImage: NetworkImage(
                      'https://pbs.twimg.com/profile_images/1824002576/pg-railsconf_400x400.jpg'),
                ),
                Divider(
                  height: 20,
                  thickness: 1,
                  indent: 100,
                  endIndent: 100,
                  color: Colors.black,
                ),
                SizedBox(height: 30),
                Row(
                  children: [
                    Text(
                      'Personal informations :',
                      style: TextStyle(
                          color: Color.fromARGB(255, 2, 2, 2),
                          fontWeight: FontWeight.w600,
                          fontSize: 18),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Mobile : ',
                      style: TextStyle(
                          color: Color.fromARGB(255, 2, 2, 2),
                          fontWeight: FontWeight.w600,
                          fontSize: 16),
                    ),
                    Text(
                      '(555) 555-1234',
                      style: TextStyle(
                          color: Color.fromARGB(255, 2, 2, 2),
                          fontWeight: FontWeight.w400,
                          fontSize: 16),
                    )
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Email : ',
                      style: TextStyle(
                          color: Color.fromARGB(255, 2, 2, 2),
                          fontWeight: FontWeight.w600,
                          fontSize: 16),
                    ),
                    Text(
                      'apply@ycombinator.com',
                      style: TextStyle(
                          color: Color.fromARGB(255, 2, 2, 2),
                          fontWeight: FontWeight.w400,
                          fontSize: 16),
                    )
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
