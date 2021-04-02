import 'dart:math';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:meal_recipes/screens/meals_based_on_category_screen.dart';

class CategoryItem extends StatelessWidget {
  final String id;
  final String title;
  final Color color;

  // to show rndom images for categories...................
  // final randomImagesUrl = [
  //   'https://upload.wikimedia.org/wikipedia/commons/thumb/2/20/Spaghetti_Bolognese_mit_Parmesan_oder_Grana_Padano.jpg/800px-Spaghetti_Bolognese_mit_Parmesan_oder_Grana_Padano.jpg',
  //   'https://cdn.pixabay.com/photo/2018/07/11/21/51/toast-3532016_1280.jpg',
  //   'https://cdn.pixabay.com/photo/2014/10/23/18/05/burger-500054_1280.jpg',
  //   'https://cdn.pixabay.com/photo/2018/03/31/19/29/schnitzel-3279045_1280.jpg',
  //   'https://cdn.pixabay.com/photo/2017/05/01/05/18/pastry-2274750_1280.jpg',
  //   'https://cdn.pixabay.com/photo/2018/06/18/16/05/indian-food-3482749_1280.jpg',
  //   'https://cdn.pixabay.com/photo/2014/10/23/18/05/burger-500054_1280.jpg',
  //   'https://cdn.pixabay.com/photo/2018/03/31/19/29/schnitzel-3279045_1280.jpg',
  //   'https://cdn.pixabay.com/photo/2016/10/25/13/29/smoked-salmon-salad-1768890_1280.jpg',
  //   'https://cdn.pixabay.com/photo/2017/05/01/05/18/pastry-2274750_1280.jpg',
  //   'https://cdn.pixabay.com/photo/2018/07/10/21/23/pancake-3529653_1280.jpg',
  //   'https://www.pexels.com/photo/appetizing-pasta-bolognese-served-with-parsley-6287525.jpg'
  // ];
  //
  //

  final randomImagesAssets = [
    'assets/images/c1.jpg',
    'assets/images/c2.jpg',
    'assets/images/c3.jpg',
    'assets/images/c4.webp',
    'assets/images/c5.png',
    'assets/images/c6.png',
    'assets/images/c7.jpg',
    'assets/images/c8.jpg',
    'assets/images/c9.jpg',
  ];

  CategoryItem({@required this.id, @required this.title, @required this.color});

  void selectedCategory(BuildContext _context) {
    Navigator.of(_context).pushNamed(
      CategoryMealsScreen.routeName,
      arguments: {
        'id': id,
        'title': title,
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        return selectedCategory(context);
      },
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.only(topLeft: Radius.circular(20.0)),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15.0),
              bottomRight: Radius.circular(15.0),
            ),
            // child: Image.network(
            //   randomImagesUrl[Random().nextInt(10)],
            //   height: 250,
            //   width: double.infinity,
            //   fit: BoxFit.cover,
            // ),
            child: Image.asset(
              randomImagesAssets[Random().nextInt(9)],
              height: 250,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  color,
                  color.withOpacity(0.2),
                ],
                begin: Alignment.center,
                end: Alignment.center,
              ),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15.0),
                bottomRight: Radius.circular(15.0),
                //topRight: Radius.circular(10.0),
              ),
            ),
            alignment: Alignment.bottomRight,
            width: double.infinity,
            height: double.infinity,
            padding: EdgeInsets.all(20.0),
            child: Container(
              color: Colors.black54,
              padding: EdgeInsets.symmetric(vertical: 2, horizontal: 5),
              child: Text(
                title,
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
