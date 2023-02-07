import 'package:flutter/material.dart';

// czytnij sobie: https://api.flutter.dev/flutter/material/Scaffold-class.html

// entrypoint
void main() {
  //passujemy tutaj widget, ktory jest root widgetem naszej apki
  runApp(MaterialApp(
    // home: Text("Siema!"), //always comma separated
    // Scaffold Widget = takes many different things about base layout of app
    home: Scaffold(
      appBar: AppBar(
        title: const Text("Title"),
        centerTitle: true,
      ),
          body: const Center(
            child: Text("Siema!"),
          ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {  },
        child: const Text("click"),
      ),
    ),
  ));
}