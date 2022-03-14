import 'package:flutter/material.dart';
import 'package:nav_app/models/meal.dart';
import 'package:nav_app/widgets/meal_item.dart';

import '../utils/dummy_data.dart';

class CategoryMeals extends StatefulWidget {
  static const routeName = '/category-meals';

  @override
  _CategoryMealsState createState() => _CategoryMealsState();
}

class _CategoryMealsState extends State<CategoryMeals> {
  String? categoryTitle;
  List<Meal>? displayedMeals;
  var _loadedInitData = true;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if(!_loadedInitData){
      final routeArgs =
          ModalRoute.of(context)!.settings.arguments as Map<String, String>;
      final categoryId = routeArgs['id'] as String;
      categoryTitle = routeArgs['title'] as String;
      displayedMeals = DUMMY_MEALS.where((meal) {
        return meal.categories.contains(categoryId);
      }).toList();
      super.didChangeDependencies();
    }
  }

  void _removeMeal(String mealId) {
    setState(() {
      displayedMeals!.removeWhere((meal) => meal.id == mealId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle as String),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
              id: displayedMeals![index].id,
              title: displayedMeals![index].title,
              imageUrl: displayedMeals![index].imageUrl,
              duration: displayedMeals![index].duration,
              complexity: displayedMeals![index].complexity,
              affordability: displayedMeals![index].affordability,
              removeItem: _removeMeal);
        },
        itemCount: displayedMeals!.length,
      ),
    );
  }
}
