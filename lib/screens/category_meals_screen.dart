import 'package:flutter/material.dart';
import '../models/meal.dart';
import '../widgets/meal_item.dart';
import '../dummy_data.dart';

class CategoryMealsScreen extends StatelessWidget {
  static const routeName = '/category-meals';
  // final String categoryId;
  // final String categoryTitle;
  List<Meal> meals;

  CategoryMealsScreen({this.meals});

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final categoryTitle = routeArgs['title'];
    final categoryId = routeArgs['id'];
    //filter meals
    List<Meal> temp;
    temp = meals.where((element) {
      return element.categories.contains(categoryId);
    }).toList();

    return Scaffold(
        appBar: AppBar(
          title: Text(categoryTitle),
        ),
        body: buildMenu(temp));
  }
}

Widget buildMenu(List<Meal> items) {
  if (items.length == 0) {
    return Container(
      child: Center(
        child: Text("Sorry, there's nothing on your plate :( "),
      ),
    );
  }
  return SingleChildScrollView(
    child: Column(
        children: items.map((item) {
      return MealTile(
        id: item.id,
        title: item.title,
        url: item.imageUrl,
        duration: item.duration,
        difficulty: item.complexity,
      );
    }).toList()),
  );
}
