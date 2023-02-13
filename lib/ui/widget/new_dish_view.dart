import 'package:flutter/cupertino.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'new_dish_input_widget.dart';

class DishAddScreen extends StatelessWidget {
  const DishAddScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Row(children: [
            SizedBox(width: 10),
            Text('New Dish', textAlign: TextAlign.center),
          ])
      ),
      body: Column(
        children: <Widget>[
          NewDishInput(),

        ],
      ),
    );
  }
}