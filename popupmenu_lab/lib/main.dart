import './CustomPopupMenu.dart';
import 'package:flutter/material.dart';

void main() =>
    runApp(MaterialApp(title: "Popup Menu Button", home: MainActivity()));

class MainActivity extends StatefulWidget {
  @override
  _MainActivityState createState() => _MainActivityState();
}

List<CustomPopupMenu> choices = <CustomPopupMenu>[
  CustomPopupMenu(title: 'Home', icon: Icons.home, bgcolor: Colors.indigo),
  CustomPopupMenu(title: 'Bookmarks', icon: Icons.bookmark, bgcolor: Colors.lightBlue),
  CustomPopupMenu(title: 'Settings', icon: Icons.settings, bgcolor: Colors.red),
  CustomPopupMenu(title: 'Mo\' Money', icon: Icons.attach_money, bgcolor: Colors.green),
];

class _MainActivityState extends State<MainActivity> {
  CustomPopupMenu _selectedChoices = choices[0];

  void _select(CustomPopupMenu choice) {
    setState(() {
      _selectedChoices = choice;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Popup Menu Button'),
        backgroundColor: Colors.lightGreen,
        actions: <Widget>[
          PopupMenuButton<CustomPopupMenu>(
            elevation: 3.2,
            initialValue: choices[1],
            onCanceled: () {
              print('You have not chossed anything');
            },
            tooltip: 'This is a tooltip',
            onSelected: _select,
            itemBuilder: (BuildContext context) {
              return choices.map((CustomPopupMenu choice) {
                return PopupMenuItem<CustomPopupMenu>(
                  value: choice,
                  child: Text(choice.title,
                              style: TextStyle(fontSize: 18)),
                  height: 50.0,
                );
              }).toList();
            },
          )
        ],
      ),
      body: bodyWidget(),
    );
  }

  bodyWidget() {
    return Container(
      child: SelectedOption(choice: _selectedChoices),
    );
  }
}

class SelectedOption extends StatelessWidget {
  CustomPopupMenu choice;

  SelectedOption({Key key, this.choice}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: new BoxDecoration(color: choice.bgcolor),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(choice.icon, size: 140.0, color: Colors.white),
            Text(
              choice.title,
              style: TextStyle(color: Colors.white, fontSize: 30),
            )
          ],
        ),
      ),
    );
  }
}
