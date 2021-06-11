import 'package:flutter/material.dart';

class ResultDisplay extends StatelessWidget {
  final text;

  ResultDisplay({@required this.text});

  final result = null;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/LOGO_DISPLAY.png'),
              fit: BoxFit.cover),
        ),
        child: Container(
            alignment: Alignment.bottomRight,
            padding: EdgeInsets.only(right: 24, bottom: 24),
            child: Text(
              text,
              style: TextStyle(color: Colors.white, fontSize: 34),
            )));
  }
}
