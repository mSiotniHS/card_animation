import 'dart:math';
import 'package:flutter/material.dart';

class CreditCard extends StatefulWidget {
  final foreground = Container(
    width: 315.0,
    height: 198.0,
    color: Color.fromRGBO(238, 222, 244, 1),
    child: Stack(
      children: <Widget>[
        Positioned(
          top: 27.0,
          left: 33.0,
          child: Text("Debit card", style: TextStyle(fontSize: 20.0)),
        ),
        Positioned(
          top: 31.0,
          right: 35.0,
          child: Text(
            "Increased cashback",
            style: TextStyle(
                fontSize: 8.0, color: Color.fromRGBO(172, 172, 172, 1)),
          ),
        )
      ],
    ),
  );
  final background = Container(
    width: 315.0,
    height: 198.0,
    color: Color.fromRGBO(238, 222, 244, 1),
    child: Center(
      child: Text(
        "Background",
        style: TextStyle(fontSize: 25.0),
      ),
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
