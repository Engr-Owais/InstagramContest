import 'package:flutter/material.dart';

class listt extends StatefulWidget {
  @override
  _listtState createState() => _listtState();
}

class _listtState extends State<listt> {
  int _selectedItemIndex = 0;
  @override
  Widget build(BuildContext context) {
    List<Widget> items = [
      ListTile(
        leading: Icon(Icons.local_activity, size: 50),
        title: Text('Activity'),
        subtitle: Text('Description here'),
      ),
      ListTile(
        leading: Icon(Icons.local_airport, size: 50),
        title: Text('Airport'),
        subtitle: Text('Description here'),
      ),
      ListTile(
        leading: Icon(Icons.local_atm, size: 50),
        title: Text('ATM'),
        subtitle: Text('Description here'),
      ),
      ListTile(
        leading: Icon(Icons.local_bar, size: 50),
        title: Text('Bar'),
        subtitle: Text('Description here'),
      ),
      ListTile(
        leading: Icon(Icons.local_cafe, size: 50),
        title: Text('Cafe'),
        subtitle: Text('Description here'),
      ),
      ListTile(
        leading: Icon(Icons.local_car_wash, size: 50),
        title: Text('Car Wash'),
        subtitle: Text('Description here'),
      ),
      ListTile(
        leading: Icon(Icons.local_convenience_store, size: 50),
        title: Text('Heart Shaker'),
        subtitle: Text('Description here'),
      ),
      ListTile(
        leading: Icon(Icons.local_dining, size: 50),
        title: Text('Dining'),
        subtitle: Text('Description here'),
      ),
      ListTile(
        leading: Icon(Icons.local_drink, size: 50),
        title: Text('Drink'),
        subtitle: Text('Description here'),
      ),
      ListTile(
        leading: Icon(Icons.local_florist, size: 50),
        title: Text('Florist'),
        subtitle: Text('Description here'),
      ),
      ListTile(
        leading: Icon(Icons.local_gas_station, size: 50),
        title: Text('Gas Station'),
        subtitle: Text('Description here'),
      ),
      ListTile(
        leading: Icon(Icons.local_grocery_store, size: 50),
        title: Text('Grocery Store'),
        subtitle: Text('Description here'),
      ),
    ];

    return Scaffold(
        appBar: AppBar(
          title: Text('Woolha.com Flutter Tutorial'),
        ),
        body: Center(
            child: ListWheelScrollView(
          itemExtent: 75,
          children: items,
          magnification: 1.5,
          useMagnifier: true,
          physics: FixedExtentScrollPhysics(),
          diameterRatio: 1.5,
          squeeze: 0.8,
          onSelectedItemChanged: (index) => {
            setState(() {
              _selectedItemIndex = index;
            })
          },
        )));
  }
}
