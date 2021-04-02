import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AboutUs extends StatelessWidget {
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
          'About Us ',
          style: TextStyle(
            color: Colors.grey[700],
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        elevation: 0.0,
        backgroundColor: Colors.transparent,
      ),
      body: Container(
        margin: EdgeInsets.symmetric(vertical: 70.0),
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'MEAL RECIPES APP',
                style: TextStyle(
                    color: Colors.orange,
                    fontWeight: FontWeight.normal,
                    fontSize: 30.0),
              ),
              Divider(
                endIndent: 140.0,
                color: Colors.orange,
                thickness: 2.0,
              ),
              SizedBox(
                height: 10.0,
              ),
              Text(
                'Version',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 14.0,
                ),
              ),
              Text(
                '1.0.0.1',
                style: TextStyle(
                  color: Colors.orange,
                  fontSize: 22.0,
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Text(
                'Last Update',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 14.0,
                ),
              ),
              Text(
                'April 2021',
                style: TextStyle(
                  color: Colors.orange,
                  fontSize: 22.0,
                ),
              ),
              SizedBox(
                height: 40.0,
              ),

              Text(
                'Meal Recipes App , enable users to easly cooking lovely meals, and more .',
                style: TextStyle(
                  color: Colors.orange,
                  fontSize: 22.0,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
