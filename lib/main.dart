import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:nav_app/screens/category_meals.dart';
import 'package:nav_app/screens/filters.dart';
import 'package:nav_app/screens/meal_detail.dart';

import './screens/categories.dart';
import 'models/meal.dart';
import 'screens/tabs.dart';

import './utils/dummy_data.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'gluten': false,
    'vegetarian': false,
    'vegan': false,
    'lactose': false
  };

  List<Meal> _availableMeals = DUMMY_MEALS;
  List<Meal> _favoriteMeals = [];

  void _setFilters(Map<String, bool> filterData) {
    setState(() {
      _filters = filterData;

      _availableMeals = DUMMY_MEALS.where((meal) {
        if (_filters['gluten'] as bool && !meal.isGlutenFree) {
          return false;
        }
        if (_filters['vegan'] as bool && !meal.isVegan) {
          return false;
        }
        if (_filters['vegetarian'] as bool && !meal.isVegetarian) {
          return false;
        }
        if (_filters['lactose'] as bool && !meal.isLactoseFree) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  void _toggleFavorite(String mealId) {
    final existingIndex = _favoriteMeals.indexWhere((meal) => meal.id == mealId);
    if (existingIndex >= 0) {
      setState(() {
        _favoriteMeals.removeAt(existingIndex);
      });
    } else {
      setState(() {
        _favoriteMeals.add(DUMMY_MEALS.firstWhere((meal) => meal.id == mealId));
      });
    }
  }

  bool _isMealFavorite(String id){
    return _favoriteMeals.any((meal) => meal.id == id);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'DeliMeals',
        theme: ThemeData(
            primarySwatch: Colors.pink,
            accentColor: Colors.amber,
            canvasColor: Color.fromRGBO(255, 254, 229, 1),
            fontFamily: 'Raleway',
            textTheme: ThemeData.light().textTheme.copyWith(
                body1: TextStyle(
                  color: Color.fromRGBO(20, 51, 51, 1),
                ),
                body2: TextStyle(
                  color: Color.fromRGBO(20, 51, 51, 1),
                ),
                title: TextStyle(fontSize: 20, fontFamily: 'RobotoCondensed'))),
        initialRoute: '/',
        routes: {
          '/': (ctx) => Tabs(_favoriteMeals),
          CategoryMeals.routeName: (ctx) => CategoryMeals(_availableMeals),
          MealDetail.routeName: (ctx) => MealDetail(_toggleFavorite, _isMealFavorite),
          Filters.routeName: (ctx) => Filters(_filters, _setFilters)
        },
        onGenerateRoute: (settings) {
          print(settings.arguments);
          return MaterialPageRoute(
              builder: (ctx) =>
                  Categories()); // Pra páginas geradas e sem pre-definicao
        },
        onUnknownRoute: (settings) {
          print(settings.arguments);
          return MaterialPageRoute(
              builder: (ctx) => Categories()); // pagina 404
        });
  }
}
