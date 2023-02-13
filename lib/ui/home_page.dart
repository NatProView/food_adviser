import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import 'package:flutter_projects/lib/drift_database.dart';
import '../views/widgets/recipe_card.dart';
import 'dish_add_page.dart';
import 'dish_search_page.dart';
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
      children: <Widget>[],
    )


    );
  }
}

// class DishList extends StatefulWidget {
//   const DishList({Key? key}) : super(key: key);
//
//   @override
//   State<DishList> createState() => _DishListState();
// }
//
// class _DishListState extends State<DishList> {
//   @override
//   Widget build(BuildContext context) {
//     return const Placeholder();
//   }
// }
//
// StreamBuilder<List<DishData>> _buildDishList(BuildContext context) {
//   final database = Provider.of<AppDatabase>(context);
//   return StreamBuilder(
//       stream: database.dishDao.watchAllDishes(),
//       builder: (context, AsyncSnapshot<List<DishData>> snapshot) {
//         final dishes = snapshot.data ?? [];
//
//         return ListView.builder(
//             itemCount: dishes.length,
//             itemBuilder: (_, index) {
//               final itemDish = dishes[index];
//               return _buildListItem(itemDish, database);
//             },
//         );
//       }
//   );
// }
//
// Widget _buildListItem(DishData itemDish, AppDatabase database) {
//   return Slidable(
//     startActionPane: ActionPane(
//       motion: const DrawerMotion(),
//       children: [
//
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
//     child: AboutListTile(
//       applicationName: "Test",
//     ),
//   );
// }