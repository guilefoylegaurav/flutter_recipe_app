import 'package:flutter/material.dart';

import '../screens/meal_detail_screen.dart';
import '../models/meal.dart';

class MealTile extends StatelessWidget {
  final String id;
  final url;
  final title;
  final int duration;
  final Complexity difficulty;
  void headtoRecipe(BuildContext c) {
    Navigator.of(c).pushNamed('/mealsCat', arguments: {'id': id});
  }

  MealTile({this.id, this.title, this.url, this.duration, this.difficulty});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => headtoRecipe(context),
      child: Card(
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                  width: double.infinity,
                  height: 200,
                  child: Center(child: Text("Loading Image")),
                ),
                Image.network(url, width: double.infinity, fit: BoxFit.cover),
                Positioned(
                  right: 20.0,
                  bottom: 20.0,
                  child: Container(
                    color: Colors.black.withOpacity(0.25),
                    padding: EdgeInsets.all(20),
                    child: Text(
                      this.title,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                      overflow: TextOverflow.clip,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Container(
                    child: Row(
                      children: <Widget>[
                        Icon(
                          Icons.timer,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(duration.toString() + " min"),
                      ],
                    ),
                  ),
                  Container(
                    child: Row(
                      children: <Widget>[
                        Icon(
                          Icons.drafts,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(difficulty.toString().split('.').last),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
