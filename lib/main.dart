// ignore: depend_on_referenced_packages
import 'package:calculatorapp/calcbutton.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void updateUserInput(String buttonLabel) {
    setState(() {
      userInput += buttonLabel;
    });
  }
  var userInput='';
  var answer='';
  var total=0;
  late TextEditingController controller=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text("Calculator App"),
      ),
      body: SingleChildScrollView(
       child:Column(
      children: [
        Container(
          alignment: Alignment.centerRight,
          child: Padding(
            padding: const EdgeInsets.only(top: 160.0),
          child:Text(
            userInput,
          style:  const TextStyle(color: Colors.white,fontSize: 20),
              ),
          ),
        ),
        Container(
          alignment: Alignment.centerRight,
            child:Text(
              answer,
              style:  const TextStyle(color: Colors.white,fontSize: 20),
            ),
          ),
         DecoratedBox(decoration: const BoxDecoration(color: Colors.transparent),
         child:Column(
           children: [
           Row(
          children: [
            CalcButton(
                label: 'C',
                backcolor: Colors.grey,
                size: 70,
                onTap: (){
                  setState(() {
                    userInput='';
                    answer='0';
                  });
                }
            ),
            CalcButton(
                label: '/',
                size: 70,
                backcolor: Colors.grey,
                onTap: (){
                  setState(() {
                    userInput+='/';
                  });
                }
            ),
            CalcButton(
                label: '%',
                size: 70,
                backcolor: Colors.grey,
                onTap: (){
                  setState(() {
                    userInput+='%';
                  });
                }
            ),
            CalcButton(
                label: '<=',
                size: 70,
                backcolor: Colors.orange,
                onTap: (){
                  setState(() {
                    userInput = userInput.substring(0, userInput.length - 1);
                  });
                }
            ),
            ]),
            Row(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CalcButton(
                    label: '7',
                    size: 70,
                    onTap: (){
                      setState(() {
                        updateUserInput("7");
                      });
                    }
                ),
                CalcButton(
                    label: '8',
                    size: 70,
                    onTap: (){
                      setState(() {
                        updateUserInput("8");
                      });
                    }
                ),
                CalcButton(
                    label: '9',
                    size: 70,
                    onTap: (){
                      setState(() {
                        updateUserInput("9");
                      });
                    }
                ),
                CalcButton(
                    label: 'x',
                    size: 70,
                    onTap: (){
                      setState(() {
                        updateUserInput("x");
                      });
                    }
                ),
              ]),
            Row(mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CalcButton(
                    label: '4',
                    size: 70,
                    onTap: (){
                      setState(() {
                        updateUserInput("4");
                      });
                    }
                ),
                CalcButton(
                    label: '5',
                    size: 70,
                    onTap: (){
                      setState(() {
                        updateUserInput("5");
                      });
                    }
                ),
                CalcButton(
                    label: '6',
                    size: 70,
                    onTap: (){
                      setState(() {
                        updateUserInput("6");
                      });
                    }
                ),
                CalcButton(
                    label: '-',
                    size: 70,
                    onTap: (){
                      setState(() {
                        updateUserInput("-");
                      });
                    }
                ),
            ]),
            Row(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CalcButton(
                    label: '1',
                    size: 70,
                    onTap: (){
                      setState(() {
                        updateUserInput("1");
                      });
                    }
                ),
                CalcButton(
                    label: '2',
                    size: 70,
                    onTap: (){
                      setState(() {
                        updateUserInput("2");
                      });
                    }
                ),
                CalcButton(
                    label: '3',
                    size: 70,
                    onTap: (){
                      setState(() {
                        updateUserInput("3");
                      });
                    }
                ),
                CalcButton(
                    label: '+',
                    size: 70,
                    onTap: (){
                      setState(() {
                        updateUserInput("+");
                      });
                    }
                ),
            ]),
            Row(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CalcButton(
                    label: '00',
                    size: 70,
                    onTap: (){
                      setState(() {
                        updateUserInput("00");
                      });
                    }
                ),
                CalcButton(
                    label: '0',
                    size: 70,
                    onTap: (){
                      setState(() {
                        updateUserInput("0");
                      });
                    }
                ),
                CalcButton(
                    label: '.',
                    size: 70,
                    onTap: (){
                      setState(() {
                        updateUserInput(".");
                      });
                    }
                ),
                CalcButton(
                    label: '=',
                    size: 70,
                    backcolor: Colors.orange,
                    onTap: (){
                      setState(() {
                        String finaluserinput = userInput;
                        finaluserinput = userInput.replaceAll("x", "*");

                        Parser p = Parser();
                        Expression exp = p.parse(finaluserinput);
                        ContextModel cm = ContextModel();
                        double eval = exp.evaluate(EvaluationType.REAL, cm);
                        if (eval.truncate() == eval) {
                          // The answer is a whole number
                          answer = eval.truncate().toString();
                        } else {
                          // The answer is a decimal
                          answer = eval.toString();
                        }
                      });
                    }
                ),
          ]),
                  ]
                )
              ),
            ],
          )
      ),
    );
  }
}

