import 'package:flutter/material.dart';
import 'package:nav_app/widgets/main_drawer.dart';

class Filters extends StatefulWidget {
  static const routeName = '/filters';

  final Function saveFilters;
  final Map<String, bool> currentFilters;

  Filters(this.currentFilters, this.saveFilters);

  @override
  _FiltersState createState() => _FiltersState();
}

class _FiltersState extends State<Filters> {
  var _glutenFree = false;
  var _vegetarianFree = false;
  var _veganFree = false;
  var _lactoseFree = false;

  @override
  initState(){
    _glutenFree = widget.currentFilters['gluten'] as bool;
    _vegetarianFree = widget.currentFilters['vegetarian'] as bool;
    _veganFree = widget.currentFilters['vegan'] as bool;
    _lactoseFree = widget.currentFilters['lactose'] as bool;
    super.initState();
  }

  Widget _buildSwitchListTile(
    String title,
    String description,
    bool currentValue,
    ValueChanged<bool?> updateValue,
  ) {
    return SwitchListTile(
        title: Text(title),
        subtitle: Text(description),
        value: currentValue,
        onChanged: updateValue);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Your Filters'),
          actions: [
            IconButton(
              onPressed: () {
                final selectedFilter = {
                  'gluten': _glutenFree,
                  'vegetarian': _vegetarianFree,
                  'vegan': _veganFree,
                  'lactose': _lactoseFree
                };
                widget.saveFilters(selectedFilter);
              },
              icon: Icon(Icons.save),
            )
          ],
        ),
        drawer: MainDrawer(),
        body: Column(
          children: [
            Container(
              padding: EdgeInsets.all(20),
              child: Text(
                'Adjust your meal selection.',
                style: Theme.of(context).textTheme.title,
              ),
            ),
            Expanded(
              child: ListView(
                children: [
                  _buildSwitchListTile(
                    'Gluten-free',
                    'Only include gluten-free meals',
                    _glutenFree,
                    (newValue) {
                      setState(() {
                        _glutenFree = newValue as bool;
                      });
                    },
                  ),
                  _buildSwitchListTile(
                    'Vegetarian-free',
                    'Only include vegetarian-free meals',
                    _vegetarianFree,
                    (newValue) {
                      setState(() {
                        _vegetarianFree = newValue as bool;
                      });
                    },
                  ),
                  _buildSwitchListTile(
                    'Vegan-free',
                    'Only include vegan-free meals',
                    _veganFree,
                    (newValue) {
                      setState(() {
                        _veganFree = newValue as bool;
                      });
                    },
                  ),
                  _buildSwitchListTile(
                    'Gluten-free',
                    'Only include gluten-free meals',
                    _lactoseFree,
                    (newValue) {
                      setState(() {
                        _lactoseFree = newValue as bool;
                      });
                    },
                  ),
                ],
              ),
            )
          ],
        ));
  }
}
