import 'package:calculator_flutter/calculator_button.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class CalcScreen extends StatefulWidget {
  const CalcScreen({Key? key}) : super(key: key);

  @override
  State<CalcScreen> createState() => _CalcScreenState();
}

class _CalcScreenState extends State<CalcScreen> {

  String userInput = '';
  String answer = '';

  List<String> buttons = [
    'C',
    '+/-',
    '%',
    'DEL',
    '7',
    '8',
    '9',
    '/',
    '4',
    '5',
    '6',
    'x',
    '1',
    '2',
    '3',
    '-',
    '0',
    '.',
    '=',
    '+',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(0.2),
        child: Column(
          children: [
            Expanded(
                child: Container(
                  padding: const EdgeInsets.all(0.1),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        child: Text(userInput, style: const TextStyle(fontSize: 36)),
                      ),
                      Container(
                        child: Text(answer, style: const TextStyle(fontSize: 22)),
                      )
                    ],
                  ),
                )
            ),
            Expanded(
                flex: 2,
                child: Container(
                  padding: const EdgeInsets.all(0.1),
                  child: GridView.builder(
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
                      itemCount: buttons.length,
                      itemBuilder: (context, index){
                        if(index == 0 || index == 3){
                          return CalButton(
                              Colors.redAccent,
                              buttons[index],
                              Colors.black,
                              (){onButtonTap(index);}
                          );
                        }
                        else if(index == 1 || index == 2 || index == 7 || index == 11 || index == 15 || index == 19){
                          return CalButton(
                              Colors.blue,
                              buttons[index],
                              Colors.black,
                              (){onButtonTap(index);}
                          );
                        }
                        else if(index == 18){
                          return CalButton(
                              Colors.green,
                              buttons[index],
                              Colors.white,
                              (){onButtonTap(index);}
                          );
                        }
                        else{
                          return CalButton(
                              Colors.yellow,
                              buttons[index],
                              Colors.black,
                              (){onButtonTap(index);}
                          );
                        }
                      }
                  ),
                )
            )
          ],
        ),
      ),
    );
  }

  onButtonTap(int index){
    if(index == 0){
      setState(() {
        userInput = '';
        answer = '';
      });
    }
    else if(index == 3){
      setState(() {
        userInput = userInput.substring(0, userInput.length - 1);
      });
    }
    else if(index == 18){
      equalPressed();
    }
    else{
      setState(() {
        if(index == 1){
          userInput = '(-$userInput)';
        }
        else {
          userInput += buttons[index];
        }
      });
    }
  }

  equalPressed() {
    String finalUserInput = userInput;
    finalUserInput = userInput.replaceAll('x', '*');

    Parser p = Parser();
    Expression exp = p.parse(finalUserInput);
    ContextModel cm = ContextModel();
    try {
      double eval = exp.evaluate(EvaluationType.REAL, cm);
      setState(() {
        answer = eval.toString();
      });
    }
    on Exception catch(e){
      print(e);
    }
  }

}
