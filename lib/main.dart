import 'package:flutter/material.dart';
import 'dart:math';
import 'package:flutter/painting.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: MyHomePage(title: 'Calculator'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String output = "0.00";
  String _output="0";
double num1=0.0;
double num2=0.0;
String operand="";

  buttonPressed(String buttonText){

    if(buttonText=="AC"){
      _output="0";
      num1=0.0;
      num2=0.0;
      operand="";
    }
    else if(buttonText=="+" || buttonText=="-" || buttonText=="*" || buttonText=="/" || buttonText=="%" || buttonText=="^"){
      num1=double.parse(output);
      operand= buttonText;
      _output ="0";

    }
    else if( buttonText==".") {
      print("");
      return;
    }
    else if(buttonText=="="){
      num2=double.parse(output);
      if(operand=="+"){
        _output =(num1+num2).toString();
      }
      if(operand=="-"){
        _output =(num1-num2).toString();
      }
      if(operand=="*"){
        _output =(num1*num2).toString();
      }
      if(operand=="/"){
        _output =(num1/num2).toString();
      }
      if(operand=="%"){
        _output =((num1*num2)/100).toString();
      }
      if(operand=="^"){
        _output =(pow(num1, num2)).toString();
      }

      operand="";

    }
    else{
      _output=_output+buttonText;
    }

    print(_output);
    setState(()
    {
      output=double.parse(_output).toStringAsFixed(2);
    });
  }

  Widget buildButton(String buttonText) {
    return new Expanded(
      child: new OutlineButton(
        padding: new EdgeInsets.all(28.0),
        child: new Text(
          buttonText,
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'Chalkboard SE',

          ),
        ),
        onPressed: () => buttonPressed(buttonText),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: new Container(
          child: new Column(children: <Widget>[
            new Container(
                alignment: Alignment.centerRight,
                padding: new EdgeInsets.symmetric(
                  vertical: 50.0,
                  horizontal: 20.0,
                ),
                child: new Text(output,
                    style: new TextStyle(
                      color: Colors.black.withOpacity(0.6),
                      fontSize: 50.0,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic,
                    ))),
            new Expanded(
              child: new Divider(),
            ),
            Column(children: [
              Row(
                children: [
                  buildButton("AC"),
                  buildButton("%"),
                  buildButton("^"),
                  buildButton("/"),
                ],
              ),
              Row(
                children: [
                  buildButton("7"),
                  buildButton("8"),
                  buildButton("9"),
                  buildButton("*"),
                ],
              ),
              Row(
                children: [
                  buildButton("4"),
                  buildButton("5"),
                  buildButton("6"),
                  buildButton("-"),
                ],
              ),
              Row(
                children: [
                  buildButton("1"),
                  buildButton("2"),
                  buildButton("3"),
                  buildButton("+"),
                ],
              ),
              Row(
                children: [
                  buildButton("0"),
                  buildButton("."),
                  buildButton("="),
                ],
              ),
            ])
          ]),
        ));
  }
}
