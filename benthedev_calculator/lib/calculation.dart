import 'package:flutter/material.dart';
import 'calculator_button.dart';
import 'result_display.dart';

class Calculation extends StatefulWidget {
  @override
  _CalculationState createState() => _CalculationState();
}

class _CalculationState extends State<Calculation> {
  var result;
  var operator;
  var firstOperand;
  var secondOperand;
  late double width;

  @override
  void didChangeDependencies() {
    width = MediaQuery.of(context).size.width;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.start, children: [
      Expanded(
        flex: 5,
        child: ResultDisplay(
          text: _getDisplayText(),
        ),
      ),
      Flexible(
        flex: 1,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _getButton(text: '7', tapped: () => numberPressed(7)),
            _getButton(text: '8', tapped: () => numberPressed(8)),
            _getButton(text: '9', tapped: () => numberPressed(9)),
            _getButton(
                text: 'x',
                tapped: () => operatorPressed('*'),
                backgroundColor: Color.fromRGBO(220, 220, 220, 1)),
          ],
        ),
      ),
      Flexible(
        flex: 1,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _getButton(text: '4', tapped: () => numberPressed(4)),
            _getButton(text: '5', tapped: () => numberPressed(5)),
            _getButton(text: '6', tapped: () => numberPressed(6)),
            _getButton(
                text: '/',
                tapped: () => operatorPressed('/'),
                backgroundColor: Color.fromRGBO(220, 220, 220, 1)),
          ],
        ),
      ),
      Flexible(
        flex: 1,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _getButton(text: '1', tapped: () => numberPressed(1)),
            _getButton(text: '2', tapped: () => numberPressed(2)),
            _getButton(text: '3', tapped: () => numberPressed(3)),
            _getButton(
                text: '+',
                tapped: () => operatorPressed('+'),
                backgroundColor: Color.fromRGBO(220, 220, 220, 1))
          ],
        ),
      ),
      Flexible(
        flex: 1,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _getButton(
                text: '=',
                tapped: calculateResult,
                backgroundColor: Colors.black,
                textColor: Colors.white),
            _getButton(text: '0', tapped: () => numberPressed(0)),
            _getButton(
                text: 'C',
                tapped: clear,
                backgroundColor: Color.fromRGBO(220, 220, 220, 1)),
            _getButton(
                text: '-',
                tapped: () => operatorPressed('-'),
                backgroundColor: Color.fromRGBO(220, 220, 220, 1)),
          ],
        ),
      ),
    ]);
  }

  Widget _getButton(
      {required String text,
      required void Function()? tapped,
      Color backgroundColor = Colors.white,
      Color textColor = Colors.black}) {
    return CalculatorButton(
      label: text,
      tapped: tapped,
      size: width / 4 - 12,
      backgroundColor: backgroundColor,
      labelColor: textColor,
    );
  }

  operatorPressed(String operator) {
    setState(() {
      if (firstOperand == null) {
        firstOperand = 0;
      }
      this.operator = operator;
    });
  }

  numberPressed(int number) {
    setState(() {
      if (result != null) {
        result = null;
        firstOperand = number;
        return;
      }
      if (firstOperand == null) {
        firstOperand = number;
        return;
      }
      if (operator == null) {
        firstOperand = int.parse('$firstOperand$number');
        return;
      }
      if (secondOperand == null) {
        secondOperand = number;
        return;
      }
      secondOperand = int.parse('$secondOperand$number');
    });
  }

  calculateResult() {
    if (operator == null || secondOperand == null) {
      return;
    }
    setState(() {
      switch (operator) {
        case '+':
          result = firstOperand + secondOperand;
          break;
        case '-':
          result = firstOperand - secondOperand;
          break;
        case '*':
          result = firstOperand * secondOperand;
          break;
        case '/':
          if (secondOperand == 0) {
            return;
          }
          result = firstOperand ~/ secondOperand;
          break;
      }
      firstOperand = result;
      operator = null;
      secondOperand = null;
      result = null;
    });
  }

  clear() {
    setState(() {
      result = null;
      operator = null;
      secondOperand = null;
      firstOperand = null;
    });
  }

  String _getDisplayText() {
    if (result != null) {
      return '$result';
    }
    if (secondOperand != null) {
      return '$firstOperand$operator$secondOperand';
    }
    if (operator != null) {
      return '$firstOperand$operator';
    }
    if (firstOperand != null) {
      return '$firstOperand';
    }
    return '0';
  }
}
