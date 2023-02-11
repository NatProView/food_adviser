import 'package:flutter/material.dart';
import 'package:flutter_projects/lib/drift_database.dart';
import 'package:provider/provider.dart';

import 'ui/home_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (_) => AppDatabase().dishDao,
        child: MaterialApp(
          title: 'Material App',
          home: HomePage(),
        ),
    );
  }
}
