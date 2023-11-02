import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  return runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.red,
        appBar: AppBar(
          title: const Text('Dicee'),
          backgroundColor: Colors.red,
        ),
        body: DicePage(),
      ),
    ),
  );
}

class DicePage extends StatefulWidget {
  const DicePage({super.key});

  @override
  State<DicePage> createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  int left = 1;
  int right = 1;
  int total = 2;
  String result = "Dice roll are equal";
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          children: [
            Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextButton(
                    onPressed: (){
                      setState(() {
                        ChangeValue();
                      });
                    },
                    child: Image.asset('images/dice$left.png'),
                  ),
                )
            ),
            Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextButton(
                    onPressed: (){
                      setState(() {
                        ChangeValue();
                      });
                    },
                    child: Image.asset('images/dice$right.png'),
                  ),
                )
            ),
          ],
        ),
        const SizedBox(
          height: 20.0,
        ),
        Text(
          'The total roll is $total',
          style: const TextStyle(
            fontSize: 26.0,
            fontFamily: 'Arial',
          ),
        ),
        Text(
          '$result',
          style: const TextStyle(
            fontSize: 26.0,
            fontFamily: 'Arial',
          ),
        ),
      ],
    );
  }

  void ChangeValue(){
    left = 1 + Random().nextInt(6);
    right = 1 + Random().nextInt(6);
    total = left + right;
    if (left>right){
      result = "Left dice rolls higher";
    }else if (right>left){
      result = "Right dice rolls higher";
    }else{
      result = "Dice roll are equal";
    }
  }
}

