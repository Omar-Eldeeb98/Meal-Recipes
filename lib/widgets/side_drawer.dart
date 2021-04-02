import 'package:flutter/material.dart';
import 'package:meal_recipes/screens/about_us_screen.dart';
import 'package:meal_recipes/screens/filtered_meals_screen.dart';
//import 'package:meal_recipes/screens/tabs_screen.dart';

class SideDrawer extends StatelessWidget {
  Widget buildDrawerListTile(String title, IconData icon, Function tapHandler) {
    return ListTile(
      leading: Icon(
        icon,
        color: Colors.orange,
        size: 24.0,
      ),
      title: Text(
        title,
        style: TextStyle(
          color: Colors.orange,
          fontSize: 20.0,
        ),
      ),
      onTap: tapHandler,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.black,
        width: double.infinity,
        height: double.infinity,
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 220.0,
              color: Colors.orange,
              child: Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 35.0),
                    child: Image.asset(
                      'assets/images/bg.jpg',
                      height: 220.0,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Colors.orange,
                          Colors.orange.withOpacity(0.3),
                        ],
                        begin: Alignment.center,
                        end: Alignment.center,
                      ),
                    ),
                    alignment: Alignment.bottomLeft,
                    padding: EdgeInsets.all(20.0),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        color: Colors.black54,
                      ),
                      padding: EdgeInsets.symmetric(vertical: 4, horizontal: 5),
                      child: Text(
                        'COOKING YOUR LOVELY MEAL ',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                            fontWeight: FontWeight.normal,
                            fontFamily: 'Raleway'),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 25.0,
            ),
            buildDrawerListTile(
              'Home ',
              Icons.home,
              () {
                Navigator.of(context).pushReplacementNamed('/');
               
              },
            ),
            Divider(
              color: Colors.grey[700],
              thickness: 0.3,
            ),
            buildDrawerListTile(
              'Settings',
              Icons.settings_applications,
              () {
                Navigator.of(context).pushNamed(
                  FilterMealsScreen.routeName,
                );
              },
            ),
            Divider(
              color: Colors.grey[700],
              thickness: 0.3,
            ),
            buildDrawerListTile(
              'About',
              Icons.info,
              () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => AboutUs(),
                  ),
                );
              },
            ),
            Divider(
              color: Colors.grey[700],
              thickness: 0.3,
            ),
            buildDrawerListTile(
              'More Apps',
              Icons.apps,
              () {},
            ),
            Divider(
              color: Colors.grey[700],
              thickness: 0.3,
            ),
          ],
        ),
      ),
    );
  }
}
