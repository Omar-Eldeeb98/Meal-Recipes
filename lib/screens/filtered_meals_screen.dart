import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
//import 'package:meal_recipes/widgets/side_drawer.dart';

class FilterMealsScreen extends StatefulWidget {
  static const routeName = '/filters';
  final Function saveFilters;
  final Map<String, bool> currentFilters;

  FilterMealsScreen(this.currentFilters, this.saveFilters);
  @override
  _FilterMealsScreenState createState() => _FilterMealsScreenState();
}

class _FilterMealsScreenState extends State<FilterMealsScreen> {
  bool check = true; // for floating action button

  bool _glutenFree = false;
  bool _vegetarian = false;
  bool _vegan = false;
  bool _lactoseFree = false;

  @override
  void initState() {
    _glutenFree = widget.currentFilters['gluten'];
    _lactoseFree = widget.currentFilters['lactose'];
    _vegan = widget.currentFilters['vegan'];
    _vegetarian = widget.currentFilters['vegetarian'];

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        // leading: Builder(
        //   builder: (context) => IconButton(
        //     icon: Icon(
        //       Icons.filter_list,
        //       size: 30.0,
        //     ),
        //     onPressed: () => Scaffold.of(context).openDrawer(),
        //   ),
        // ),
        iconTheme: IconThemeData(
          color: Colors.orange,
        ),
        backwardsCompatibility: false,
        systemOverlayStyle: SystemUiOverlayStyle(statusBarColor: Colors.black),
        centerTitle: true,
        title: Text(
          'Settings',
          style: TextStyle(
            color: Colors.grey[700],
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        actions: [
          IconButton(
            iconSize: 26.0,
            icon: Icon(Icons.more_vert),
            onPressed: () {},
            color: Colors.grey[700],
            //alignment: Alignment.topRight,
          )
        ],
      ),
      // drawer: SideDrawer(),
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(10.0),
            alignment: Alignment.center,
            child: Container(
              padding: EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                color: Colors.grey[900],
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Text(
                'Custom Your Meals',
                style: TextStyle(
                  color: Colors.orange,
                  fontSize: 26.0,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 15.0,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: ListView(
                children: [
                  SwitchListTile(
                    activeColor: Colors.orange,
                    inactiveTrackColor: Colors.grey,
                    tileColor: Colors.grey[900],
                    title: Text(
                      'Gluten-Free',
                      style: TextStyle(
                        color: Colors.orange,
                        fontSize: 22.0,
                      ),
                    ),
                    value: _glutenFree,
                    subtitle: Text(
                      'only include gluten-free meals,',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    onChanged: (newValue) {
                      setState(() {
                        _glutenFree = newValue;
                      });
                    },
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  SwitchListTile(
                    activeColor: Colors.orange,
                    inactiveTrackColor: Colors.grey,
                    tileColor: Colors.grey[900],
                    title: Text(
                      'Lactose-Free',
                      style: TextStyle(
                        color: Colors.orange,
                        fontSize: 22.0,
                      ),
                    ),
                    value: _lactoseFree,
                    subtitle: Text(
                      'only include Lactose-free meals,',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    onChanged: (newValue) {
                      setState(() {
                        _lactoseFree = newValue;
                      });
                    },
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  SwitchListTile(
                    activeColor: Colors.orange,
                    inactiveTrackColor: Colors.grey,
                    tileColor: Colors.grey[900],
                    title: Text(
                      'Vegetarian-food',
                      style: TextStyle(
                        color: Colors.orange,
                        fontSize: 22.0,
                      ),
                    ),
                    value: _vegetarian,
                    subtitle: Text(
                      'only include Vegetarian meals,',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    onChanged: (newValue) {
                      setState(() {
                        _vegetarian = newValue;
                      });
                    },
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  SwitchListTile(
                    activeColor: Colors.orange,
                    inactiveTrackColor: Colors.grey,
                    tileColor: Colors.grey[900],
                    title: Text(
                      'Vegan-food',
                      style: TextStyle(
                        color: Colors.orange,
                        fontSize: 22.0,
                      ),
                    ),
                    value: _vegan,
                    subtitle: Text(
                      'only include Vegan meals,',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    onChanged: (newValue) {
                      setState(() {
                        _vegan = newValue;
                      });
                    },
                  ),
                  SizedBox(
                    height: 25.0,
                  ),
                  FloatingActionButton(
                    splashColor: Colors.orange,
                    backgroundColor: Colors.grey[900],
                    onPressed: () {
                      final selectedFilters = {
                        'gluten': _glutenFree,
                        'lactose': _lactoseFree,
                        'vegan': _vegan,
                        'vegetarian': _vegetarian,
                      };

                      widget.saveFilters(selectedFilters);

                      setState(() {
                        if (check) {
                          check = false;
                        } else {
                          check = true;
                        }
                      });
                    },
                    child: Icon(
                      check ? Icons.save : Icons.filter_alt_rounded,
                      color: Colors.orange,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
