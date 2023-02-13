import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DishSearchScreen extends StatelessWidget {
  const DishSearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Row(children: [
            SizedBox(width: 10),
            Text('Search', textAlign: TextAlign.center),
          ])
      ),
      body: Center(
        // child: Text("Tu bedzie dodawanie jedzenia")
        child: ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('Go back!'),
        ),
      ),
    );
  }
}

