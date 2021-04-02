import 'package:flutter/material.dart';
import 'package:meal_recipes/models/meal.dart';
import 'package:meal_recipes/widgets/meal_item.dart';

class FavoritesMealsScreen extends StatelessWidget {
  final List<Meal> favoritesMeals;
  FavoritesMealsScreen(this.favoritesMeals);
  @override
  Widget build(BuildContext context) {
    if (favoritesMeals.isEmpty) {
      return Center(
        child: Text(
          'No Favorites Available ! ',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18.0,
          ),
        ),
      );
    } else {
      return ListView.builder(
        itemCount: favoritesMeals.length, // ............. important
        itemBuilder: (context, index) {
          return MealItem(
            id: favoritesMeals[index].id,
            title: favoritesMeals[index].title,
            imageUrl: favoritesMeals[index].imageUrl,
            duration: favoritesMeals[index].duration,
            complexity: favoritesMeals[index].complexity,
            affordability: favoritesMeals[index].affordability,
          );
        },
      );
    }
  }
}
