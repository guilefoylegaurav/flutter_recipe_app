import 'package:flutter/material.dart';
import 'package:myapp/dummy_data.dart';
import 'package:myapp/widgets/drawer.dart';
import '../models/meal.dart';

class Recipe extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final id = routeArgs['id'];
    final Meal myMeal = DUMMY_MEALS.firstWhere((meal) => meal.id == id);

    return Scaffold(
      appBar: AppBar(
        title: Text(myMeal.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(10),
              child: Stack(
                children: [
                  Container(
                    width: double.infinity,
                    height: 200,
                    child: Center(
                      child: Text("Loading Image"),
                    ),
                  ),
                  Image(
                    image: NetworkImage(myMeal.imageUrl),
                    fit: BoxFit.cover,
                    width: double.infinity,
                  )
                ],
              ),
            ),
            Container(
              color: Colors.blue[700],
              child: ExpansionTile(
                title: Text(
                  "INGREDIENTS",
                  style: TextStyle(color: Colors.white),
                ),
                children: myMeal.ingredients.map((item) {
                  return Container(
                    color: Colors.white,
                    child: ListTile(
                      title: Text(item),
                    ),
                  );
                }).toList(),
              ),
            ),
            SizedBox(
              height: 1,
            ),
            Container(
              color: Colors.blue[700],
              child: ExpansionTile(
                title: Text(
                  "RECIPE",
                  style: TextStyle(color: Colors.white),
                ),
                children: myMeal.steps.map((item) {
                  return Container(
                    color: Colors.white,
                    child: ListTile(
                      leading: CircleAvatar(
                        child: Text('${(myMeal.steps.indexOf(item) + 1)}'),
                      ),
                      title: Text(item),
                    ),
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
