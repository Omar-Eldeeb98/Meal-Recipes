import 'package:flutter/material.dart';
import 'package:meal_recipes/models/meal.dart';
import 'package:flutter/foundation.dart';
import 'package:meal_recipes/screens/meal_datails_screen.dart';

class MealItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;
  // final Function removeItem;

  const MealItem({
    @required this.id,
    @required this.title,
    @required this.imageUrl,
    @required this.duration,
    @required this.complexity,
    @required this.affordability,
    // @required this.removeItem,
  });

  String get complexityText {
    switch (complexity) {
      case Complexity.Simple:
        return 'Simple';
        break;
      case Complexity.Challenging:
        return 'Challenging';
        break;
      case Complexity.Hard:
        return 'Hard';
        break;
      default:
        return 'Unknowm';
    }
  }

  String get affordabilityText {
    switch (affordability) {
      case Affordability.Affordable:
        return 'Affordable';
        break;
      case Affordability.Luxurious:
        return 'Luxurious';
        break;
      case Affordability.Pricey:
        return 'Pricey';
        break;
      default:
        return 'Unknowm';
    }
  }

  void selectMeal(BuildContext context) // to navigate to meal details screen
  {
    Navigator.pushNamed(
      context,
      MealDetails.routName,
      arguments: id,
    ).then((result) {
      if (result != null) {
       // removeItem(result);
      }
    });
  }

  // void selectMeal(BuildContext ctx) {
  //   Navigator.push(
  //     ctx,
  //     MaterialPageRoute(
  //       builder: (context) => MealDetails(
  //         mealID: id,
  //       ),
  //     ),
  //   ).then((result) {
  //     if(result!= null)
  //     {
  //       removeItem(result);
  //     }
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15.0), topRight: Radius.circular(15.0)),
      onTap: () => selectMeal(context),
      child: Card(
        elevation: 10.0,
        margin: EdgeInsets.only(
          right: 15.0,
          left: 15.0,
          bottom: 15.0,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15.0),
                    topRight: Radius.circular(15.0),
                  ),
                  child: Image.network(
                    imageUrl,
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: 20.0,
                  right: 10.0,
                  child: Container(
                    alignment: Alignment.center,
                    width: 300,
                    padding: EdgeInsets.symmetric(
                      horizontal: 20.0,
                      vertical: 5.0,
                    ),
                    color: Colors.black54,
                    child: Text(
                      title,
                      style: TextStyle(
                        fontWeight: FontWeight.normal,
                        fontSize: 26.0,
                        color: Colors.white,
                      ),
                      softWrap: true,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  color: Colors.black,
                ),
                padding: EdgeInsets.symmetric(horizontal: 3, vertical: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.timelapse_outlined,
                          color: Colors.orange,
                        ),
                        SizedBox(
                          width: 5.0,
                        ),
                        Text(
                          '$duration min',
                          style: TextStyle(color: Colors.orange),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.food_bank_rounded,
                          color: Colors.orange,
                        ),
                        SizedBox(
                          width: 5.0,
                        ),
                        Text(
                          complexityText,
                          style: TextStyle(color: Colors.orange),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.monetization_on,
                          color: Colors.orange,
                        ),
                        SizedBox(
                          width: 5.0,
                        ),
                        Text(
                          affordabilityText,
                          style: TextStyle(color: Colors.orange),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
