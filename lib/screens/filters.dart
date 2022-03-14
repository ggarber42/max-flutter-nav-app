import 'package:flutter/material.dart';

class Filters extends StatelessWidget {
  static const routeName = '/filters';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Filters'),
      ),
      body: Container(
        child: Center(
          child: Text('Filters'),
        ),
      ),
    );
  }
}
