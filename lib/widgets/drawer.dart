import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.fromLTRB(0, 30, 0, 20),
            width: double.infinity,
            decoration: BoxDecoration(color: Colors.greenAccent),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                RichText(
                    text: TextSpan(
                  children: <TextSpan>[
                    TextSpan(text: "Deli \n", style: TextStyle(fontSize: 50)),
                    TextSpan(text: " Meals ", style: TextStyle(fontSize: 20))
                  ],
                )),
              ],
            ),
          ),
          ListTile(
            title: Text("Meals"),
            leading: Icon(Icons.fastfood),
            onTap: () {
              Navigator.of(context).pushReplacementNamed("/");
            },
          ),
          ListTile(
            title: Text("Filters"),
            leading: Icon(Icons.settings),
            onTap: () {
              Navigator.of(context).pushNamed("/filter");
            },
          )
        ],
      ),
    );
  }
}
