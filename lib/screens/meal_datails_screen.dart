import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:meal_recipes/data/meals_data.dart';

class MealDetails extends StatelessWidget {
  static const routName = '/meal-details-screen';
  final Function toggleFavorite;
  final Function isFavorite;

  MealDetails(this.toggleFavorite, this.isFavorite);
  // final String mealID;

  // MealDetails({
  //   @required this.mealID,
  // });

  @override
  Widget build(BuildContext context) {
    final routeArge = ModalRoute.of(context).settings.arguments as String;
    final mealID = routeArge;

    // get the meal() item that has the same mealID sended from CategoryMealsScreen() from MEALS List |<FIRST WAY>| |same output|
    final selectedMeal = MEALS.firstWhere((meal) => meal.id == mealID);

    // get the meal() item that has the same mealID sended from CategoryMealsScreen() from MEALS List |<SECOND WAY>| |same output|
    final getSelectedMealDatail = MEALS.firstWhere((meal) {
      return meal.id.contains(mealID);
    });

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        actions: [
          IconButton(
            icon: Icon(Icons.more_vert_outlined),
            onPressed: () {},
            color: Colors.grey[700],
          ),
        ],
        iconTheme: IconThemeData(
          color: Colors.orange,
        ),
        backwardsCompatibility: false,
        systemOverlayStyle: SystemUiOverlayStyle(statusBarColor: Colors.black),
        centerTitle: true,
        title: Text(
          '${selectedMeal.title}',
          style: TextStyle(
            color: Colors.grey[700],
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        elevation: 0.0,
        backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              height: 250.0,
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                margin: EdgeInsets.only(
                  right: 15.0,
                  left: 15.0,
                  bottom: 15.0,
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10.0),
                    topRight: Radius.circular(10.0),
                    bottomLeft: Radius.circular(10.0),
                    bottomRight: Radius.circular(10.0),
                  ),
                  child: Image.network(
                    getSelectedMealDatail.imageUrl,
                    // selectedMeal.imageUrl,
                    height: 300,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(left: 20.0, right: 20.0),
              width: double.infinity,
              padding: EdgeInsets.all(5.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Text(
                ' MEAL INGREDIENTS : ',
                style: TextStyle(
                  fontSize: 18.0,
                  fontFamily: 'Raleway',
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(10.0),
              margin: EdgeInsets.all(20.0),
              width: double.infinity,
              height: 250.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: Colors.white,
              ),
              child: ListView.builder(
                itemCount: selectedMeal.ingredients.length,
                itemBuilder: (context, index) => Card(
                  color: Colors.black,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      selectedMeal.ingredients[index],
                      style: TextStyle(
                          color: Colors.orange,
                          fontSize: 16.0,
                          fontWeight: FontWeight.normal),
                    ),
                  ),
                ),
              ),
            ),
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(left: 20.0, right: 20.0),
              width: double.infinity,
              padding: EdgeInsets.all(5.0),
              decoration: BoxDecoration(
                color: Colors.grey[700],
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Text(
                'COOKING STEPS : ',
                style: TextStyle(
                  fontSize: 18.0,
                  fontFamily: 'Raleway',
                  color: Colors.orange,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(10.0),
              margin: EdgeInsets.all(20.0),
              width: double.infinity,
              height: 250.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: Colors.grey[700],
              ),
              child: ListView.builder(
                itemCount: selectedMeal.steps.length,
                itemBuilder: (context, index) => Column(
                  children: [
                    ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Colors.black,
                        child: Text(
                          '# ' + '${index + 1}',
                          style: TextStyle(color: Colors.orange),
                        ),
                      ),
                      title: Card(
                        color: Colors.black,
                        child: Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Text(
                            selectedMeal.steps[index],
                            style: TextStyle(
                              color: Colors.orange,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Divider(
                      thickness: 0.3,
                      color: Colors.black54,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.grey[900],
        onPressed:()=> toggleFavorite(mealID),
        child: Icon(
          
          isFavorite(mealID)
              ? Icons.favorite_outlined
              : Icons.favorite_border_outlined,
              color: Colors.orange,
        ),
      ),
    );
  }
}
