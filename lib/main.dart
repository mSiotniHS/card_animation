import 'package:flutter/material.dart';
import 'CreditCard.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Card Animation',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
//        appBar: AppBar(title: Text("Card Animation")),
        backgroundColor: Color.fromRGBO(246, 250, 254, 1),
        body: Center(
          child: CreditCard(),
        ),
      ),
    );
  }
}
