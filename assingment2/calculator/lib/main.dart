import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:math_expressions/math_expressions.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.dark(),
      home: MyHomePage(title: 'Calculator'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool isequalto = false;
  String calculation = '';
  String result = '';
  var _myController = TextEditingController(text: '');

  void clearAll(buttonText) {
    setState(() {
      _myController.text = '';
      result = '';
    });
  }

  void equalsTo(buttonText) {
    setState(() {
      _myController.text = result;
      result = '';
      isequalto = true;
    });
  }

  void clearOne() {
    setState(() {
      try {
        _myController.text =
            _myController.text.substring(0, (_myController.text.length - 1));
        addTo('');
      } catch (e) {}
    });
  }

  void addTo(String buttonText) {
    setState(() {
      try {
        var last = _myController.text.substring(_myController.text.length - 1);

        if (['+', '-', '%', '×', '÷'].contains(last) &&
            ['+', '-', '%', '×', '÷'].contains(buttonText)) {
          clearOne();
        }
      } catch (e) {}

      if (isequalto) {
        _myController.text = '';
        isequalto = false;
      }

      _myController.text += buttonText;

      try {
        calculation = _myController.text;
        calculation = calculation.replaceAll('×', '*');
        calculation = calculation.replaceAll('÷', '/');
        Parser p = Parser();
        Expression exp = p.parse(calculation);
        ContextModel cm = ContextModel();
        result = exp
            .evaluate(EvaluationType.REAL, cm)
            .toStringAsPrecision(4)
            .replaceAll(RegExp(r"([.]*0)(?!.*\d)"), "");
      } catch (e) {
        result = result;
      }
    });
  }

  Widget buildiButton(Color buttonColor, Function callBack,
      {double size = 40.0}) {
    return Container(
      padding: EdgeInsets.all(0),
      child: MaterialButton(
          padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
          shape: CircleBorder(),
          onPressed: () => {callBack()},
          child: Icon(
            Icons.backspace_outlined,
            color: buttonColor,
          )),
    );
  }

  Widget buildButton(String buttonText, Color buttonColor, Function callBack,
      {double size = 40.0}) {
    return Container(
      padding: EdgeInsets.all(0),
      child: MaterialButton(
        padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
        shape: CircleBorder(),
        onPressed: () => {callBack(buttonText)},
        child: Text(
          buttonText,
          textScaleFactor: 1,
          textAlign: TextAlign.center,
          style: GoogleFonts.quicksand(fontSize: size, color: buttonColor),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
        body: SafeArea(
      child: Column(
        children: [
          Container(
            alignment: Alignment.centerRight,
            padding: EdgeInsets.fromLTRB(10, 20, 10, 10),
            child: EditableText(
                cursorColor: Colors.blueAccent,
                focusNode: FocusNode(),
                showCursor: true,
                readOnly: true,
                autofocus: true,
                textAlign: TextAlign.end,
                controller: _myController,
                backgroundCursorColor: Colors.blueAccent,
                style: GoogleFonts.sen(
                  fontSize: 80,
                  fontWeight: FontWeight.w300,
                )),
          ),
          Container(
            alignment: Alignment.centerRight,
            padding: EdgeInsets.fromLTRB(0, 0, 10, 10),
            child: Text(result,
                style: GoogleFonts.sen(
                    fontSize: 60,
                    fontWeight: FontWeight.w300,
                    color: Colors.grey)),
          ),
          Expanded(
              child: Row(
            children: [
              Container(
                  alignment: Alignment.bottomLeft,
                  padding: EdgeInsets.all(0),
                  width: MediaQuery.of(context).size.width * 0.7,
                  child: Table(
                    defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                    border: TableBorder(
                        right: BorderSide(width: 0.5, color: Colors.grey),
                        top: BorderSide(width: 0.5, color: Colors.grey)),
                    children: [
                      TableRow(
                        children: [
                          buildButton('7', Colors.white, addTo),
                          buildButton('8', Colors.white, addTo),
                          buildButton('9', Colors.white, addTo)
                        ],
                      ),
                      TableRow(
                        children: [
                          buildButton('4', Colors.white, addTo),
                          buildButton('5', Colors.white, addTo),
                          buildButton('6', Colors.white, addTo)
                        ],
                      ),
                      TableRow(
                        children: [
                          buildButton('1', Colors.white, addTo),
                          buildButton('2', Colors.white, addTo),
                          buildButton('3', Colors.white, addTo)
                        ],
                      ),
                      TableRow(
                        children: [
                          buildButton('0', Colors.white, addTo),
                          buildButton('.', Colors.white, addTo),
                          buildButton('', Colors.white, addTo)
                        ],
                      )
                    ],
                  )),
              Container(
                  alignment: Alignment.bottomCenter,
                  padding: EdgeInsets.all(0),
                  width: MediaQuery.of(context).size.width * 0.3,
                  child: Table(
                    defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                    border: TableBorder(
                        top: BorderSide(width: 0.5, color: Colors.grey)),
                    children: [
                      TableRow(
                        children: [
                          buildButton('÷', Colors.blueAccent, addTo),
                          buildButton('AC', Colors.blueAccent, clearAll,
                              size: 25),
                        ],
                      ),
                      TableRow(
                        children: [
                          buildButton('×', Colors.blueAccent, addTo),
                          buildiButton(Colors.blueAccent, clearOne)
                        ],
                      ),
                      TableRow(
                        children: [
                          buildButton('-', Colors.blueAccent, addTo),
                          buildButton(
                            '%',
                            Colors.blueAccent,
                            addTo,
                            size: 30,
                          )
                        ],
                      ),
                      TableRow(
                        children: [
                          buildButton('+', Colors.blueAccent, addTo),
                          buildButton('=', Colors.blueAccent, equalsTo),
                        ],
                      )
                    ],
                  ))
            ],
          )),
        ],
      ),
    )

        // This trailing comma makes auto-formatting nicer for build methods.
        );
  }
}
