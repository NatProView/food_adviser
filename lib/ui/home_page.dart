import 'package:flutter/material.dart';
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
    final database = Provider.of<AppDatabase>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Dishes'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(child: _buildDishList(context)),
          NewDishInput(),
        ],
      )
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
              return _buildListItem(itemDish, database);
            },
        );
      }
  );
}

Widget _buildListItem(DishData itemDish, AppDatabase database) {
  return Slidable(
    startActionPane: ActionPane(
      motion: const DrawerMotion(),
      children: [
      ],
    ),
    endActionPane: ActionPane(
      motion: const DrawerMotion(),
      extentRatio: 0.25,
      children: [
        SlidableAction(
          label: 'Delete',
          backgroundColor: Colors.red,
          icon: Icons.delete,
          onPressed: (context) => database.dishDao.deleteDish(itemDish.id),
        ),
      ],
    ),
    child: Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        Expanded(child: Text(itemDish.name)),
        Expanded(child: Text(itemDish.timeToPrepare.toString())),
        Expanded(child: Text(itemDish.calories.toString())),
      ],
    ),
  );
}