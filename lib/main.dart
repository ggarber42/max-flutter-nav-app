import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:nav_app/screens/category_meals.dart';
import 'package:nav_app/screens/meal_detail.dart';

import './screens/categories.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
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
          '/': (ctx) => Categories(),
          CategoryMeals.routeName: (ctx) => CategoryMeals(),
          MealDetail.routeName: (ctx) => MealDetail()
        },
        onGenerateRoute: (settings) {
          print(settings.arguments);
          return MaterialPageRoute(
              builder: (ctx) =>
                  Categories()); // Pra páginas geradas e sem pre-definicao
        },
        onUnknownRoute: (settings) {
          print(settings.arguments);
          return MaterialPageRoute(builder: (ctx) => Categories()); // pagina 404
        });
  }
}
