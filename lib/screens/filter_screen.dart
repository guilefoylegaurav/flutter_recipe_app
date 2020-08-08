import 'package:flutter/material.dart';

class Filter extends StatefulWidget {
  bool patch;
  Function applyFilter;
  Filter({this.patch, this.applyFilter});
  @override
  _FilterState createState() => _FilterState();
}

class _FilterState extends State<Filter> {
  bool _isVeg;
  @override
  void initState() {
    _isVeg = widget.patch;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Apply filters"),
      ),
      body: Container(
        child: _buildVegTile("Only show veg", _isVeg, (newV) {
          setState(() {
            _isVeg = newV;
            widget.applyFilter(_isVeg);
          });
        }),
      ),
    );
  }
}

Widget _buildVegTile(String title, bool p, Function _updateValue) {
  return SwitchListTile(
    title: Text(title),
    value: p,
    onChanged: _updateValue,
  );
}
