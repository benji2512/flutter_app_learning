import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(CalculatorApp());
}

class CalculatorApp extends StatefulWidget{
  @override
  _CalculatorAppState createState() => _CalculatorAppState();
}

class _CalculatorAppState extends State<CalculatorApp> {
  @override
  void initState() {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
      )
    );
    super.initState();
  }
  
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "BenTheDev's Calculator",
      home: Scaffold(
        body: Calculation()
      ),
    );
  }
}

class Calculation extends StatefulWidget {
  @override
  _CalculationState createState() => _CalculationState();
}
class _CalculationState extends State<Calculation> {
  int result = 0;
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      ResultDisplay(text: '0'),
      Row(
        children: [
          CalculatorButton(
            label: '7',
            onTap: () => {},
            size: 90,
            backgroundColor: Colors.white,
            labelColor: Colors.black,
          )
        ],
      )
    ]
    );
  }
}

class ResultDisplay extends StatelessWidget{

  final int result = 0;
  final text;

  ResultDisplay({@required this.text});

  @override 
  Widget build(BuildContext context){
    return Container(
      width: double.infinity,
      height: 120,
      color: Colors.black,
      child: Container(
        alignment: Alignment.bottomRight,
        padding: EdgeInsets.only(right: 24, bottom: 24),
        child: Text(
          text,
          style: TextStyle(
            color: Colors.white,
            fontSize: 34
          ),
          )
      )
    );
  }
}

class CalculatorButton extends StatelessWidget{
  final String label;
  final VoidCallback onTap;
  final double size;
  final Color backgroundColor;
  final Color labelColor;

  Widget _getButton({String text, Function onTap, Color backgroundColor = Colors.white, Color textColor = Colors.black}) {
    return CalculatorButton({
      @required this.label,
      @required this.onTap,
      @required this.size,
      this.backgroundColor = Colors.white,
      this.labelColor = Colors.black
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(6),
      child: Ink(
        width: size,
        height: size,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
            color: Colors.grey,
            offset: Offset(1,1),
            blurRadius: 2
          ),
          ],
        borderRadius: BorderRadius.all(
          Radius.circular(size/2)
        ),
        color: backgroundColor,
      ),
      child: InkWell(
        customBorder: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(size/2)),
        ),
        onTap: onTap,
        child: Center(
          child: Text(
            label,
            style: TextStyle(fontSize: 24, color: labelColor),
          )
        ),
      ),
    )
    );
  }
}