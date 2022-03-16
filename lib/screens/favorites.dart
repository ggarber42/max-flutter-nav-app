import 'package:flutter/material.dart';
import 'package:nav_app/models/meal.dart';
import 'package:nav_app/widgets/meal_item.dart';

class Favorite extends StatelessWidget {
  final List<Meal> favoriteMeals;

  Favorite(this.favoriteMeals);

  @override
  Widget build(BuildContext context) {
    if (favoriteMeals.isEmpty) {
      return Container(
        child: Center(
          child: Text(
            'You have no favorites',
            style: TextStyle(fontSize: 20),
          ),
        ),
      );
    } else {
      return  ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
              id: favoriteMeals[index].id,
              title: favoriteMeals[index].title,
              imageUrl: favoriteMeals[index].imageUrl,
              duration: favoriteMeals[index].duration,
              complexity: favoriteMeals[index].complexity,
              affordability: favoriteMeals[index].affordability,
            );
        },
        itemCount: favoriteMeals.length,
      );
    }
  }
}
