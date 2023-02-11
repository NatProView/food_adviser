import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_projects/lib/drift_database.dart';
import 'package:provider/provider.dart';

class NewDishInput extends StatefulWidget {
  const NewDishInput({
    Key? key,
  }) : super(key: key);

  @override
  _NewDishInputState createState() => _NewDishInputState();
}

class _NewDishInputState extends State<NewDishInput> {
  late int newDishCalories;
  late int newDishTimeToPrepare;
  late String newDishName;
  late TextEditingController controller;

  // List<TagData> chosenTags;
  // List<IngredientData> chosenIngredients;

  List<TagData>? selectedTags = [];
  List<IngredientData>? selectedIngredients = [];

  List<TagData>? tags = [];
  List<IngredientData>? ingredients = [];

  @override
  void initState() {
    super.initState();
    newDishCalories = 0;
    newDishTimeToPrepare = 0;
    newDishName = "";
    controller = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          _buildNameField(context),
          _buildCaloriesField(context),
          _buildTimeToPrepareField(context),
          // _buildTagListField(context),
          // _buildIngredientsListField(context),
          _submitFullDish(context),
        ],
      ),
    );
  }

  Expanded _buildNameField(BuildContext context) {
    return Expanded(
      child: TextField(
        controller: controller,
        decoration: InputDecoration(hintText: 'Dish Name'),
        onChanged: (inputName) {
          newDishName = inputName;
        },
      ),
    );
  }

  Expanded _buildCaloriesField(BuildContext context) {
    return Expanded(
      child: TextFormField(
        controller: controller,
        keyboardType: TextInputType.number,
        inputFormatters: <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly],
        decoration: InputDecoration(hintText: 'Calories'),
        onChanged: (inputCalories) {
          newDishCalories = inputCalories as int;
        },
      ),
    );
  }



  Expanded _buildTimeToPrepareField(BuildContext context) {
    return Expanded(
      child: TextFormField(
        controller: controller,
        keyboardType: TextInputType.number,
        inputFormatters: <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly],
        decoration: InputDecoration(hintText: 'Time to prepare'),
        onChanged: (inputTimeToPrepare) {
          if(inputTimeToPrepare as int > 300){
            inputTimeToPrepare = "300";
            newDishTimeToPrepare = inputTimeToPrepare as int;
          } else {
            newDishTimeToPrepare = inputTimeToPrepare as int;
          }
        },
      ),
    );
  }

  // Expanded _buildTagListField(BuildContext context) {
  //   return Expanded(
  //     child: Wrap(children: hobbyList.map(
  //           (hobby) {
  //         bool isSelected = false;
  //         if (selectedDishes!.contains(hobby)) {
  //           isSelected = true;
  //         }
  //         return GestureDetector(
  //           onTap: () {
  //             if (!selectedDishes!.contains(hobby)) {
  //               if (selectedDishes!.length < 5) {
  //                 selectedDishes!.add(hobby);
  //                 setState(() {});
  //                 print(selectedDishes);
  //               }
  //             } else {
  //               selectedDishes!
  //                   .removeWhere((element) => element == hobby);
  //               setState(() {});
  //               print(selectedDishes);
  //             }
  //           },
  //           child: Container(
  //               margin: EdgeInsets.symmetric(
  //                   horizontal: 5, vertical: 4),
  //               child: Container(
  //                 padding: EdgeInsets.symmetric(
  //                     vertical: 5, horizontal: 12),
  //                 decoration: BoxDecoration(
  //                     color: Colors.white,
  //                     borderRadius: BorderRadius.circular(18),
  //                     border: Border.all(
  //                         color: isSelected
  //                             ? kActiveColor
  //                             : Colors.grey,
  //                         width: 2)),
  //                 child: Text(
  //                   hobby,
  //                   style: TextStyle(
  //                       color:
  //                       isSelected ? kActiveColor : Colors.grey,
  //                       fontSize: 14),
  //                 ),
  //               )),
  //         );
  //       },
  //     ).toList(),
  //     ),
  //   );
  // }

  // IconButton _buildDateButton(BuildContext context) {
  //   return IconButton(
  //     icon: Icon(Icons.calendar_today),
  //     onPressed: () async {
  //       newTaskDate = (await showDatePicker(
  //         context: context,
  //         initialDate: DateTime.now(),
  //         firstDate: DateTime(2010),
  //         lastDate: DateTime(2050),
  //       ))!;
  //     },
  //   );
  // }

  IconButton _submitFullDish(BuildContext context) {
    return IconButton(
        icon: Icon(Icons.add),
        onPressed:() {
          final database = Provider.of<AppDatabase>(context);
          final tempDish = Dish();
          final dish = FullDish(
              DishData(
                id: tempDish.id as int,
                name: newDishName,
                calories: newDishCalories,
                timeToPrepare: newDishTimeToPrepare,
              ),
              [],
              [],
          );
          database.dishDao.insertDish(dish);
          resetValuesAfterSubmit();
        },
    );
  }

  void resetValuesAfterSubmit() {
    setState(() {
      newDishCalories = 0;
      newDishTimeToPrepare = 0;
      newDishName = "";
      // chosenTags = [];
      // chosenIngredients = [];
      controller.clear();
    });
  }

  // final database = Provider.of<AppDatabase>(context);
  // final dish = DishData(
  //   id: 1,
  //   name: inputName,
  //   calories: newDishCalories,
  //   timeToPrepare: newDishTimeToPrepare,
  // );
  // database.dishDao.insertDish(dish);
  // resetValuesAfterSubmit();
}