import 'package:flutter/material.dart';

class Calculator extends StatefulWidget {
  Calculator({Key key}) : super(key: key);

  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  String equation = "0";
  String result = "0";
  String expression = "";
  buttonPressed(String buttonText) {
    //YOU WILL HAVE TO IMPLEMENT THIS METHOD
  }

  Widget buildButton(String buttonText, double buttonHeight, Color buttonColor,
      BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.1 * buttonHeight,
      color: buttonColor,
      child: FlatButton(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(0.0),
              side: BorderSide(
                  color: Colors.white, width: 1, style: BorderStyle.solid)),
          padding: EdgeInsets.all(16.0),
          onPressed: () => buttonPressed(buttonText),
          child: Text(
            buttonText,
            style: TextStyle(
                fontSize: 30.0,
                fontWeight: FontWeight.normal,
                color: Colors.white),
          )),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculator'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            alignment: Alignment.centerRight,
            padding: EdgeInsets.fromLTRB(10, 20, 10, 0),
            child: Text(
              equation,
              style: TextStyle(fontSize: 40, color: Colors.black54),
            ),
          ),
          Container(
            alignment: Alignment.centerRight,
            padding: EdgeInsets.fromLTRB(10, 30, 10, 0),
            child: Text(
              result,
              style: TextStyle(fontSize: 50),
            ),
          ),
          Expanded(child: Divider()),
          Row(
            children: [
              Container(
                width: MediaQuery.of(context).size.width * .75,
                child: Table(
                  children: [
                    TableRow(children: [
                      buildButton("AC", 1, Colors.redAccent, context),
                      buildButton("C", 1, Colors.blue, context),
                      buildButton("÷", 1, Colors.blue, context),
                    ]),
                    for (int i = 9; i > 0; i = i - 3)
                      TableRow(children: [
                        buildButton(
                            (i - 2).toString(), 1, Colors.black54, context),
                        buildButton(
                            (i - 1).toString(), 1, Colors.black54, context),
                        buildButton((i).toString(), 1, Colors.black54, context),
                      ]),
                    TableRow(children: [
                      buildButton(".", 1, Colors.black54, context),
                      buildButton("0", 1, Colors.black54, context),
                      buildButton("00", 1, Colors.black54, context),
                    ]),
                  ],
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width * .25,
                child: Table(
                  children: [
                    TableRow(children: [
                      buildButton("x", 1, Colors.blue, context),
                    ]),
                    TableRow(children: [
                      buildButton("-", 1, Colors.blue, context),
                    ]),
                    TableRow(children: [
                      buildButton("+", 1, Colors.blue, context),
                    ]),
                    TableRow(children: [
                      buildButton("=", 2, Colors.redAccent, context),
                    ]),
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
