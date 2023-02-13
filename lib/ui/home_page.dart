import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../models/dish.dart';
import '../views/widgets/recipe_card.dart';
import 'dish_add_page.dart';
import 'dish_search_page.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}



class _HomePageState extends State<HomePage> {

  List<Dish> dishes = [Dish(1, "Schabowy z ziemniakami i surowka", 120),
    Dish(2, "Kurczak z ryzem", 40),
    Dish(3, "Jajecznica", 10)];

  Widget dishTemplate(dish) {
    return Card(
      margin: EdgeInsets.fromLTRB(16, 16, 16, 0),
      child: Column(
        children: <Widget>[
          Text(
            dish.name,
            style: TextStyle(
              fontSize: 18,
              color: Colors.grey[600],
            ),
          ),
          SizedBox(height: 6),
          Text(
            dish.
          )
        ]
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Row(children: [
          Icon(Icons.restaurant_menu),
          SizedBox(width: 10),
          Text('Food Advisor'),
        ])
      ),
      // body: Column(
      //   children: <Widget>[
      //     Expanded(child: _buildDishList(context)),
      //     NewDishInput(),
      //   ],
      // )
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/drawer_image.jpg"),
                  fit: BoxFit.cover
                ),
                color: Colors.orangeAccent
              ),
              child: Text("",),
            ),
            ListTile(
              title: const Text("Add new dish"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const DishAddScreen())
                );
              }
            ),
            ListTile(
                title: const Text("Search for a dish"),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const DishSearchScreen())
                  );
                }
            ),
          ],
        )
      ),
    body: Column(
      children: dishes.map((dish) => Text('${dish.name} - ${dish.prepTime} - ${dish.id}'),
      ).toList(),
    )


    );
  }
}
