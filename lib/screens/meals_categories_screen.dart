import 'package:flutter/material.dart';
//import 'package:flutter/services.dart';
import '../data/meals_data.dart';
import '../widgets/category_item_shape.dart';

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return //Scaffold(
        // backgroundColor: Colors.black,
        // appBar: AppBar(
        //   backwardsCompatibility: false,
        //   systemOverlayStyle: SystemUiOverlayStyle(statusBarColor: Colors.black),
        //   centerTitle: true,
        //   title: Text(
        //     '',
        //     style: TextStyle(
        //       color: Colors.black,
        //       fontSize: 24,
        //       fontWeight: FontWeight.bold,
        //     ),
        //   ),
        //   elevation: 0.0,
        //   backgroundColor: Colors.transparent,
        //   actions: [
        //     IconButton(
        //       iconSize: 26.0,
        //       icon: Icon(Icons.notifications_none),
        //       onPressed: () {},
        //       color: Colors.grey[700],
        //       //alignment: Alignment.topRight,
        //     ),
        //     IconButton(
        //       iconSize: 26.0,
        //       icon: Icon(Icons.more_vert),
        //       onPressed: () {},
        //       color: Colors.grey[700],
        //       //alignment: Alignment.topRight,
        //     )
        //   ],
        // ),
        Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.0),
          child: Container(
            width: MediaQuery.of(context).size.width * 0.55,
            padding: EdgeInsets.all(2.0),
            decoration: BoxDecoration(
                color: Colors.orange,
                borderRadius: BorderRadius.circular(10.0)),
            child: Container(
              margin: EdgeInsets.only(left: 18.0),
              child: Row(
                children: [
                  Text(
                    'Meals Recipes',
                    style: TextStyle(
                      color: Colors.grey[700],
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0,
                    ),
                  ),
                  SizedBox(
                    width: 5.0,
                  ),
                  Icon(
                    Icons.food_bank_sharp,
                    color: Colors.grey[700],
                    size: 40.0,
                  )
                ],
              ),
            ),
          ),
        ),
        SizedBox(
          height: 3.0,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 0.0),
          child: Row(
            children: [
              Container(
                padding: EdgeInsets.all(7.0),
                decoration: BoxDecoration(
                  color: Colors.grey[700],
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Text(
                  'Meals Recipes Dictionary',
                  style: TextStyle(
                    color: Colors.orange,
                    fontWeight: FontWeight.bold,
                    fontSize: 12.0,
                    fontStyle: FontStyle.normal,
                  ),
                ),
              ),
              SizedBox(
                width: 3.0,
              ),
              Container(
                padding: EdgeInsets.all(7.0),
                decoration: BoxDecoration(
                  color: Colors.orange,
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Text(
                  'POWERED BY : OMAR ElDEEB ',
                  style: TextStyle(
                    color: Colors.grey[700],
                    fontWeight: FontWeight.bold,
                    fontSize: 12.0,
                    fontStyle: FontStyle.normal,
                  ),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.68,
            child: GridView(
              
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200,
                childAspectRatio: 3 / 2,
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 10.0,
              ),
              children: [
                ...CATEGORIES
                    .map((listElement) => CategoryItem(
                          id: listElement.id,
                          title: listElement.title,
                          color: listElement.color,
                        ))
                    .toList(),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
