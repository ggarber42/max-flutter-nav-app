import 'package:flutter/material.dart';
import 'package:nav_app/screens/categories.dart';
import 'package:nav_app/screens/favorites.dart';

class Tabs extends StatefulWidget {
  @override
  State<Tabs> createState() => _TabsState();
}

class _TabsState extends State<Tabs> {
  final List<Map<String, Object>> _pages = [
    {'page': Categories(), 'title': 'Categores'},
    {'page': Favorite(), 'title': 'Your Favorite'},
  ];

  int _selectedPageIndex = 0;

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pages[_selectedPageIndex]['title'] as String),
      ),
      body: _pages[_selectedPageIndex]['page'] as Widget,
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.white,
        selectedItemColor: Theme.of(context).accentColor,
        currentIndex: _selectedPageIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            title: Text('Categories'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            title: Text('Favorites'),
          )
        ],
      ),
    );
  }
}
