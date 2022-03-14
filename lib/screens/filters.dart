import 'package:flutter/material.dart';
import 'package:nav_app/widgets/main_drawer.dart';

class Filters extends StatelessWidget {
  static const routeName = '/filters';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Filters'),
      ),
      drawer: MainDrawer(),
      body: Container(
        child: Center(
          child: Text('Filters'),
        ),
      ),
    );
  }
}
