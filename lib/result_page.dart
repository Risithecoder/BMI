import 'package:flutter/material.dart';
import 'constants.dart';

class ResultPage extends StatelessWidget {
  ResultPage({this.wordresult, this.bmivalue, this.message});

  final String wordresult;
  final String bmivalue;
  final String message;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('BMI CALCULATOR')),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(height: 84),
          Text(
            "Your Result",
            style: kNumberStyle.copyWith(
                fontSize: 84, fontWeight: FontWeight.w700),
          ),
          SizedBox(height: 10),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: kactcardColor,
                borderRadius: BorderRadius.circular(12),
              ),
              margin: EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Expanded(
                      child: Center(
                    child: Text(
                      wordresult,
                      style: TextStyle(
                        color: Colors.greenAccent,
                        fontSize: 21,
                      ),
                    ),
                  )),
                  Expanded(
                      child: Text(
                    bmivalue.toString(),
                    style: kNumberStyle,
                  )),
                  Expanded(
                      child: Text(message,
                          textAlign: TextAlign.center,
                          style: kTextStyle.copyWith(
                            fontSize: 24,
                          ))),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Container(
              child: Center(
                child: Text(
                  "RE-CALCULATE",
                  style: kcalciButtonFont,
                ),
              ),
              margin: EdgeInsets.only(top: 8),
              color: Colors.redAccent,
              width: double.infinity,
              height: kbottomContainerHeight,
            ),
          )
        ],
      ),
    );
  }
}
