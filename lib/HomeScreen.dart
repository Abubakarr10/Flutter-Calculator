import 'package:calculator/constant.dart';
import 'package:flutter/material.dart';
import 'components/MyButton.dart';
import 'package:math_expressions/math_expressions.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var userInput = '';
  var answer = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: pureBlackColour,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(userInput.toString(),style: TextStyle(fontSize: 90, color: Colors.white, fontWeight: FontWeight.w100),),
                     // Text(answer.toString(),style: TextStyle(fontSize: 170, color: Colors.deepOrange, fontWeight: FontWeight.w300),)
                       Container(
                         height: 180,
                         child: Column(
                           children: [
                             DefaultTextStyle(
                              style: const TextStyle(
                                fontSize: 154,
                                color: Colors.white,
                                shadows: [
                                  Shadow(
                                    blurRadius: 7.0,
                                    color: Colors.white,
                                    offset: Offset(0, 0),
                                  ),
                                ],
                              ),
                               child: Align(
                                alignment: Alignment.bottomRight,
                                child: AnimatedTextKit(
                                  repeatForever: true,
                                  animatedTexts: [
                                    FlickerAnimatedText(answer.toString()),
                                  ],
                                ),
                              ),
                      ),
                           ],
                         ),
                       ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Column(
                    children: [
                      Row(
                        children: [
                          MyButton(title: 'AC', onPress: (){
                            userInput = '';
                            answer = '';
                            setState(() {

                            });
                            }, fontColour: pureBlackColour,),
                          MyButton(title: '+/-', onPress: (){
                            userInput += '+/-';
                            setState(() {
                            });
                          },fontColour: pureBlackColour,),
                          MyButton(title: '%', onPress: (){
                            userInput += '%';
                             setState(() {
                               });
                          },fontColour: pureBlackColour,),
                          MyButton(title: '÷',onPress: (){userInput += '/';
                          setState(() {

                          });}, colour: deOrangeColour,),
                        ],
                      ),
                      Row(
                        children: [
                          MyButton(title: '7', onPress: (){
                            userInput += '7';
                            setState(() {

                            });
                          },colour: darkGreyColour,),
                          MyButton(title: '8', onPress: (
                              ){
                            userInput += '8';
                            setState(() {

                            });
                            },colour: darkGreyColour,),
                          MyButton(title: '9', onPress: (){
                            userInput += '9';
                            setState(() {

                            });
                          },colour: darkGreyColour,),
                          MyButton(title: 'x',onPress: (){userInput += 'x';
                          setState(() {

                          });}, colour: deOrangeColour,),

                        ],
                      ),
                      Row(
                        children: [
                          MyButton(title: '4', onPress: (){
                            userInput += '4';
                            setState(() {

                            });
                          },colour: darkGreyColour,),
                          MyButton(title: '5', onPress: (){
                            userInput += '5';
                            setState(() {

                            });
                          },colour: darkGreyColour,),
                          MyButton(title: '6', onPress: (){
                            userInput += '6';
                            setState(() {

                            });
                          },colour: darkGreyColour,),
                          MyButton(title: '-',onPress: (){userInput += '-';
                          setState(() {

                          });}, colour: deOrangeColour,),

                        ],
                      ),
                      Row(
                        children: [
                          MyButton(title: '1', onPress: (){
                            userInput += '1';
                            setState(() {

                            });
                          },colour: darkGreyColour,),
                          MyButton(title: '2', onPress: (){
                            userInput += '2';
                            setState(() {

                            });
                          },colour: darkGreyColour,),
                          MyButton(title: '3', onPress: (){
                            userInput += '3';
                            setState(() {

                            });
                          },colour: darkGreyColour,),
                          MyButton(title: '+',onPress: (){userInput += '+';
                          setState(() {

                          });}, colour: deOrangeColour,),

                        ],
                      ),
                      Row(
                        children: [
                          MyButton(title: '0', onPress: (){
                            userInput += '0';
                            setState(() {

                            });
                          },colour: darkGreyColour,),
                          MyButton(title: '.', onPress: (){
                            userInput += '.';
                            setState(() {

                            });
                          },colour: darkGreyColour,),
                          MyButton(title: '⌫', onPress: (){
                            userInput = userInput.substring(0,userInput.length-1);
                            setState(() {

                            });
                          },colour: darkGreyColour,),
                          MyButton(title: '=',onPress: (){
                            equalPres();
                          setState(() {

                          });}, colour: deOrangeColour,),

                        ],
                      ),
                    ],
                ),
              ),
              SizedBox(height: 10,)
            ],
          ),
        ),
      ),
    );
  }

  void equalPres(){
    String finalUserInput = userInput.replaceAll('x', '*');
    Parser p = Parser();
    Expression expression = p.parse(finalUserInput);
    ContextModel contextModel = ContextModel();

    double eval = expression.evaluate(EvaluationType.REAL, contextModel);
    answer = eval.toString();
  }
}


