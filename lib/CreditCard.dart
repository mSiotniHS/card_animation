import 'dart:math';
import 'package:flutter/material.dart';

class CreditCard extends StatefulWidget {
  static final color = Color.fromRGBO(225, 234, 244, 1);
  static final number = "5213 2400 7309 3159";
  static final holderName = "Gleb Frolov";
  static final cvv = "613";

  final foreground = Container(
    width: 315.0,
    height: 198.0,
    color: color,
    child: Padding(
      padding: EdgeInsets.all(35.0),
      child: Stack(
        children: <Widget>[
          Text("Debit card", style: TextStyle(fontSize: 20.0)),
          Positioned(
            right: 0,
            child: Text(
              "Increased cashback",
              style: TextStyle(
                  fontSize: 8.0, color: Color.fromRGBO(172, 172, 172, 1)),
            ),
          ),
          Positioned(
            bottom: 0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "Card number:",
                  style: TextStyle(
                      fontSize: 8.0, color: Color.fromRGBO(172, 172, 172, 1)),
                ),
                SizedBox(height: 2.0),
                Text(number, style: TextStyle(fontSize: 16.0)),
              ],
            ),
          ),
          Positioned(
            right: 0,
            bottom: 0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Text(
                  "MM / YY",
                  style: TextStyle(
                      fontSize: 8, color: Color.fromRGBO(172, 172, 172, 1)),
                ),
                Text(
                  "12 / 22",
                  style: TextStyle(fontSize: 16),
                )
              ],
            ),
          ),
        ],
      ),
    ),
  );
  final background = Container(
    width: 315.0,
    height: 198.0,
    color: color,
    child: Stack(
      children: <Widget>[
        Positioned(
          top: 25.0,
          child: Container(
            width: 335,
            height: 50.0,
            color: Color.fromRGBO(78, 78, 78, 1),
          ),
        ),
        Positioned(
          top: 98.0,
          left: 35.0,
          child: Text(holderName, style: TextStyle(fontSize: 16)),
        ),
        Positioned(
            bottom: 23.5,
            left: 35.0,
            child: Text("Minimalistic design of product",
                style: TextStyle(
                    fontSize: 8.0, color: Color.fromRGBO(172, 172, 172, 1))))
      ],
    ),
  );

  @override
  State<StatefulWidget> createState() => CreditCardState();
}

class CreditCardState extends State<CreditCard> {
  var angle = 0.0;

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      duration: const Duration(milliseconds: 500),
      tween: Tween<double>(begin: 0, end: angle),
      builder: (BuildContext context, double angle, Widget __) {
        this.angle = angle;
        return Transform(
          transform: Matrix4.identity()
            ..setEntry(3, 2, 0.0017)
            ..rotateY(angle),
          alignment: Alignment.center,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15.0),
            child: GestureDetector(
              onTap: () =>
                  setState(() => this.angle = this.angle == 0 ? -pi : 0),
              child: IndexedStack(
                index: angle <= -pi / 2 ? 1 : 0,
                children: <Widget>[
                  widget.foreground,
                  Transform(
                    transform: Matrix4.identity()..rotateY(pi),
                    alignment: Alignment.center,
                    child: widget.background,
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
