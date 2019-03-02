import 'package:flutter/material.dart';
 
void main() {
  runApp(new HelloWorld());
}
 
class HelloWorld extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'First App',
      home:Scaffold(
        appBar: AppBar(
          title: Text('Home Page'),
        ),
        body: Center(
          child: Text('Hello World!'),
        )
      )
    );
  }
}
