import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  //stateful widget create the changes
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  double size = 0;

  String inputValue = " ";
  String calculatorValue = " ";
  String operator = "";
  @override
  Widget build(BuildContext context) {
    size =
        MediaQuery.of(context).size.width / 5; //control the screen size equally

    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: ListView(
          //listview is used to scroll the data content or avoid the overflow
          children: [
            Column(
              children: [
                Container(
                  alignment: Alignment.bottomRight,
                  child: Text(
                    inputValue,
                    style: TextStyle(color: Colors.white, fontSize: 100),
                  ),
                ),
                Row(
                  children: [
                    calcButton("7", Colors.white38, size),
                    calcButton("8", Colors.white38, size),
                    calcButton("9", Colors.white38, size),
                    calcButton("/", Colors.orange, size),
                  ],
                ),
                Row(
                  children: [
                    calcButton("4", Colors.white38, size),
                    calcButton("5", Colors.white38, size),
                    calcButton("6", Colors.white38, size),
                    calcButton("*", Colors.orange, size),
                  ],
                ),
                Row(
                  children: [
                    calcButton("1", Colors.white38, size),
                    calcButton("2", Colors.white38, size),
                    calcButton("3", Colors.white38, size),
                    calcButton("-", Colors.orange, size),
                  ],
                ),
                Row(
                  children: [
                    calcButton("0", Colors.white38, size),
                    calcButton(".", Colors.white38, size),
                    calcButton("=", Colors.orange, size),
                    calcButton("+", Colors.orange, size),
                  ],
                ),
                calcButton("Clear", Colors.black, size),
              ],
            ),
          ],
        ),
      ),
    );
  }

  //create the common structure of the all buttons
  Widget calcButton(String text, Color bgColor, double size) {
    return InkWell(
      //create the tab access
      onTap: () {
        //creating the clear content
        if (text == "Clear") {
          setState(() {
            inputValue = " ";
            calculatorValue = " ";
            operator = " ";
          });
        } else if (text == "+" || text == "-" || text == "*" || text == "/") {
          setState(() {
            calculatorValue = inputValue;
            inputValue = "";

            operator = text;
          });
        } else if (text == "=") {
          setState(() {
            //inputValue = calculatorValue + inputValue;
            double calc = double.parse(calculatorValue);
            double input = double.parse(inputValue);

            if (operator == "+") {
              inputValue = (calc + input).toString();
            } else if (operator == "-") {
              inputValue = (calc - input).toString();
            } else if (operator == "*") {
              inputValue = (calc * input).toString();
            } else if (operator == "/") {
              inputValue = (calc / input).toString();
            }
          });
        } else {
          setState(() {
            inputValue = inputValue + text; //concatenate the value
          });
        }
      },
      child: Container(
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(100),
        ),
        margin: EdgeInsets.all(10),
        height: size,
        width: size,
        alignment: Alignment.center,
        child: Text(text, style: TextStyle(color: Colors.white, fontSize: 30)),
      ),
    );
  }
}
