import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../lib/drift_database.dart';

class DishViewScreen extends StatelessWidget {
  DishData itemDish;
  DishViewScreen({required this.itemDish, Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Row(children: [
            SizedBox(width: 10),
          ])
      ),
      body: Padding(
        padding:EdgeInsets.fromLTRB(16, 16, 16, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Text(
                  itemDish.name,
                  // itemDish.timeToPrepare.toString(),
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[800]
                  )
              ),
              SizedBox(height: 6.0),
              Text(

                  '${itemDish.timeToPrepare.toString()}min | ${itemDish.calories.toString()}kcal',
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.grey[600]
                  )
              ),
              // HARDCODED FOR DEMO PURPOSES
              SizedBox(height: 20.0),
              Text(
                  'Ingredients',
                  // itemDish.timeToPrepare.toString(),
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[800]
                  )
              ),
              SizedBox(height: 6.0),
              Text(
                  'Składnik1 (50g)\nSkładnik2 (100g) \nSkładnik3 (30g) \nSkładnik4 (250g)\n...',
                  // itemDish.timeToPrepare.toString(),
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey[600]
                  )
              ),

              SizedBox(height: 20.0),
              Text(
                  'Recipe',
                  // itemDish.timeToPrepare.toString(),
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[800]
                  )
              ),
              SizedBox(height: 6.0),
              Text(
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum',
                  // itemDish.timeToPrepare.toString(),
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey[600]
                  )
              ),
              SizedBox(height: 20.0),
              Text(
                  'tag1 \t tag2 \t tag3',
                  // itemDish.timeToPrepare.toString(),
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey[600]
                  )
              ),
            ],

          )

      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          final database = Provider.of<AppDatabase>(context, listen: false);
          database.dishDao.deleteDish(itemDish.id);
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('removed this dish')),

          );
          Navigator.pop(context);
          // Navigator.push(context, MaterialPageRoute(builder: (context) =>  DishAddScreen()));
          // Add your onPressed code here!

        },

        backgroundColor: Colors.redAccent,
        child: const Icon(Icons.delete),
      ),
    );
  }
}