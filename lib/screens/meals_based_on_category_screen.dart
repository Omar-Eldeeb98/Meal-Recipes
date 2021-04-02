import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
//import 'package:meal_recipes/data/meals_data.dart';
import 'package:meal_recipes/models/meal.dart';
import 'package:meal_recipes/widgets/meal_item.dart';

class CategoryMealsScreen extends StatefulWidget {
  static const routeName = '/meals-based-on-category-screen';
  final List<Meal> availableMeals;

  CategoryMealsScreen(this.availableMeals);

  @override
  _CategoryMealsScreenState createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  String categoryTitle;
  List<Meal> displayMeals;
  var _loadInitData = false;

  @override
  void initState() {
    // we can not add route arguments here ...... so we use didChangeDependencies()
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if (!_loadInitData) {
      final routeArgu =
          ModalRoute.of(context).settings.arguments as Map<String, String>;
      categoryTitle = routeArgu['title'];
      final categoryId = routeArgu['id'];

      displayMeals = widget.availableMeals.where((element) {
        return element.categories.contains(categoryId);
      }).toList();
      _loadInitData = true;
    }

    super.didChangeDependencies();
  }

  // void _removeMeal(String mealId) {
  //   setState(() {
  //     displayMeals.removeWhere((meal) => meal.id == mealId);
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.orange,
        ),
        backwardsCompatibility: false,
        systemOverlayStyle: SystemUiOverlayStyle(statusBarColor: Colors.black),
        centerTitle: true,
        title: Text(
          categoryTitle,
          style: TextStyle(
            color: Colors.grey[700],
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
            color: Colors.grey[700],
          ),
          IconButton(
            icon: Icon(Icons.more_vert_outlined),
            onPressed: () {},
            color: Colors.grey[700],
          ),
        ],
        elevation: 0.0,
        backgroundColor: Colors.transparent,
      ),
      // second way to assign the list to a widget ..................
      body: ListView.builder(
        itemCount: displayMeals.length, // ............. important
        itemBuilder: (context, index) {
          return MealItem(
            id: displayMeals[index].id,
            title: displayMeals[index].title,
            imageUrl: displayMeals[index].imageUrl,
            duration: displayMeals[index].duration,
            complexity: displayMeals[index].complexity,
            affordability: displayMeals[index].affordability,
           // removeItem: _removeMeal,
          );
        },
      ),
      /*
         // first way to assign the list to a widget .....................
      :ListView(
        
        children: [
          ...categoryMeals
              .map(
                (meal) => MealItem(
                    title: meal.title,
                    imageUrl: meal.imageUrl,
                    duration: meal.duration,
                    complexity: meal.complexity,
                    affordability: meal.affordability),
              )
              .toList(),
        ],
      ),
      */
    );
  }
}
