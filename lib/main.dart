import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'ui/home_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Provider(
      builder: (context, child) {
        // No longer throws
        return MaterialApp(
          title: 'Material App',
          theme: ThemeData(
            primarySwatch: Colors.orange,
            primaryColor: Colors.white,
            textTheme: TextTheme(
              bodyMedium: TextStyle(color: Colors.white),
            ),
          ),
          home: HomePage(),
        );
      }, create: (BuildContext context) {  },
        // child:
    );
  }
}


