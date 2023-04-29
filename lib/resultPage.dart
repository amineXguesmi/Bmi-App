import 'package:flutter/material.dart';

import 'Constants.dart';
import 'calculation.dart';
import 'card.dart';
import 'input_page.dart';

class ResultPage extends StatelessWidget {
  final CalculatorBrain result;
  ResultPage(this.result) {}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BMI CALCULATOR"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            flex: 1,
            child: Container(
              padding: EdgeInsets.only(
                top: 30,
              ),
              child: Center(
                child: Text(
                  "Your Result",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 45,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 8,
            child: Re_Card(
              Active_color,
              Column(
                children: [
                  Expanded(
                    child: Container(
                      child: Center(
                          child: Text(
                        result.GetResult(),
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 22,
                            color: Color(0xFF24DB76)),
                      )),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      child: Center(
                        child: Text(
                          result.CalculateBMI(),
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 100,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      child: Center(
                        child: Text(
                          result.GetInterpretation(),
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 22,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => InputPage()));
            },
            child: Container(
              padding: EdgeInsets.only(bottom: 20, top: 10),
              child: Center(
                  child: Text(
                'RE-CAlCULATE',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              )),
              color: Color(0xFFEB1555),
              height: 80,
              margin: EdgeInsets.only(top: 10),
              width: double.infinity,
            ),
          ),
        ],
      ),
    );
  }
}
