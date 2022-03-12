import 'package:flutter/material.dart';
import 'package:nav_app/screens/categories.dart';
import 'package:nav_app/screens/favorites.dart';

class Tabs extends StatefulWidget {
  @override
  State<Tabs> createState() => _TabsState();
}

class _TabsState extends State<Tabs> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: Text('Meals'),
            bottom: TabBar(tabs: <Widget>[
              Tab(
                icon: Icon(Icons.category),
                text: 'Categories',
              ),
              Tab(
                icon: Icon(Icons.star),
                text: 'Favorites',
              )
            ]),
          ),
          body: TabBarView(children: [
            Categories(),
            Favorite()
          ],),
        ));
  }
}
