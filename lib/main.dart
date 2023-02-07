import 'package:flutter/material.dart';

// czytnij sobie: https://api.flutter.dev/flutter/material/Scaffold-class.html

// entrypoint
void main() {
  //passujemy tutaj widget, ktory jest root widgetem naszej apki
  runApp(const MaterialApp(
    home: Home(),
  ));
}

// our own widget class by extending StatelessWidget
// stateless - the state of the widget cannot change
// over time (as we use the app)
//
// stateful - the state of the widget can change over time
class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);
  //this function overrides basic build function,
  // not the one we inherited from StatelessWidget
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: const Text("Title"),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
            "Siema!",
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
              letterSpacing: 2.0,
              color: Colors.grey,
              fontFamily: 'BebasNeue',
            )
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.red,
        onPressed: () {  },
        child: const Text("click"),
      ),
    );
  }
}
