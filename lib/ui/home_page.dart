import 'package:flutter/material.dart';
import 'package:flutter_projects/ui/widget/dish_view.dart';
import 'package:flutter_projects/ui/widget/new_dish_view.dart';
import 'package:provider/provider.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import 'package:flutter_projects/lib/drift_database.dart';
import 'widget/new_dish_input_widget.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(children: [
          Icon(Icons.restaurant_menu),
          SizedBox(width: 10),
          Text("Food Advisor"),
        ])
      ),

      body: Column(
        children: <Widget>[
          Expanded(child: _buildDishList(context)),
          // NewDishInput(),

        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) =>  DishAddScreen()));
      // Add your onPressed code here!
    },

    backgroundColor: Colors.orangeAccent,
    child: const Icon(Icons.add),
    ),
    );
  }
}

StreamBuilder<List<DishData>> _buildDishList(BuildContext context) {
  final database = Provider.of<AppDatabase>(context);
  return StreamBuilder(
      stream: database.dishDao.watchAllDishes(),
      builder: (context, AsyncSnapshot<List<DishData>> snapshot) {
        final dishes = snapshot.data ?? [];

        return ListView.builder(
            itemCount: dishes.length,
            itemBuilder: (_, index) {
              final itemDish = dishes[index];
              return GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) =>  DishViewScreen(itemDish: itemDish,)));
                },
                child: _buildListItem(itemDish, database),
              );
            },
        );
      }
  );
}


Widget _buildListItem(DishData itemDish, AppDatabase database) {
    return Card(
      margin: EdgeInsets.fromLTRB(16,16,16,0),
      child: Column(

        children: <Widget>[
          Text(
            itemDish.name,
            textAlign: TextAlign.left,
            style: TextStyle(
              fontSize: 18,
              color: Colors.grey[600],
            ),
          ),
          SizedBox(height: 6),
          Text(
            'Time to prepare: ${itemDish.timeToPrepare.toString()}min   ${itemDish.calories.toString()}kcal',
            // itemDish.timeToPrepare.toString(),
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey[400]
            )
          )
        ]
      ),
    );
}

// Widget _buildListItem(DishData itemDish, AppDatabase database) {
//
//   Widget dishTemplate(itemDish) {
//     return Card(
//       margin: EdgeInsets.fromLTRB(16,16,16,0),
//       child: Column(
//         children: <Widget>[
//           Text(
//             itemDish.name,
//             style: TextStyle(
//               fontSize: 18,
//               color: Colors.grey[600],
//             ),
//           ),
//           SizedBox(height: 6),
//           Text(
//             itemDish.timeToPrepare.toString(),
//             style: TextStyle(
//               fontSize: 16,
//               color: Colors.grey[400]
//             )
//           )
//         ]
//       ),
//     );
//   }
//   return Slidable(
//     startActionPane: ActionPane(
//       motion: const DrawerMotion(),
//       children: [
//       ],
//     ),
//     endActionPane: ActionPane(
//       motion: const DrawerMotion(),
//       extentRatio: 0.25,
//       children: [
//         SlidableAction(
//           label: 'Delete',
//           backgroundColor: Colors.red,
//           icon: Icons.delete,
//           onPressed: (context) => database.dishDao.deleteDish(itemDish.id),
//         ),
//       ],
//     ),
//     child: Row(
//       mainAxisSize: MainAxisSize.max,
//       children: [
//         Expanded(child: Text(itemDish.name)),
//         Expanded(child: Text(itemDish.timeToPrepare.toString())),
//         Expanded(child: Text(itemDish.calories.toString())),
//       ],
//     ),
//   );
// }