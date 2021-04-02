//import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:meal_recipes/models/meal.dart';
import 'package:meal_recipes/screens/favorites_meals_screen.dart';
import 'package:meal_recipes/screens/meals_categories_screen.dart';
import 'package:meal_recipes/widgets/side_drawer.dart';

class TabsScreen extends StatefulWidget {
  final List<Meal> favoritesMeals;

  TabsScreen(this.favoritesMeals);

  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  List<Map<String, Object>> _pages;

  @override
  void initState() {
    _pages = [
      {
        'pages': CategoriesScreen(),
        'title': 'HOME ',
      },
      {
        'pages': FavoritesMealsScreen(widget.favoritesMeals),
        'title': 'FAVORITES',
      },
    ];

    super.initState();
  }

  int _selectedPageIndex = 0;

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        leading: Builder(
            builder: (context) => IconButton(
                  icon: Icon(
                    Icons.filter_list,
                    size: 30.0,
                  ),
                  onPressed: () => Scaffold.of(context).openDrawer(),
                )),
        iconTheme: IconThemeData(
          color: Colors.grey[700],
        ),
        backwardsCompatibility: false,
        systemOverlayStyle: SystemUiOverlayStyle(statusBarColor: Colors.black),
        centerTitle: true,
        title: Text(
          _pages[_selectedPageIndex]['title'],
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
            padding: EdgeInsets.only(left: 20.0),

            iconSize: 26.0,
            icon: Icon(Icons.notifications_none),
            onPressed: () {},
            color: Colors.grey[700],
            //alignment: Alignment.topRight,
          ),
          IconButton(
            iconSize: 26.0,
            icon: Icon(Icons.more_vert),
            onPressed: () {},
            color: Colors.grey[700],
            //alignment: Alignment.topRight,
          )
        ],
      ),
      drawer: SideDrawer(),

      body: _pages[_selectedPageIndex]['pages'],

      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        unselectedItemColor: Colors.white,
        selectedItemColor: Colors.orange,
        onTap: _selectPage,
        currentIndex: _selectedPageIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.category_sharp,
            ),
            label: 'CATEGORIES',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.favorite,
            ),
            label: 'FAVORITES',
          ),
        ],
      ),

      //---------------------------------------"CURVRD BOTTOM NAVIGATION BAR"------------------------
      // bottomNavigationBar: CurvedNavigationBar(
      //     color: Colors.grey[700],
      //     height: 50,
      //     buttonBackgroundColor: Colors.grey[700],
      //     backgroundColor: Colors.black,
      //     items: [
      //       Icon(
      //         Icons.category,
      //         color: Colors.orange,
      //         size: 30,
      //       ),
      //       Icon(
      //         Icons.favorite,
      //         color: Colors.orange,
      //         size: 30,
      //       ),
      //     ],
      //     onTap: _selectPage),
      //--------------------------------------"CURVED BOTTOM NAVIGATION BAR"------------------------------
    );
  }
}
