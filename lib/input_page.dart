import 'package:bmi/result_page.dart';
import 'package:flutter/material.dart';
import 'reusablecard.dart';
import 'qcont.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'constants.dart';
import 'result_page.dart';
import 'brain.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

int age = 16;
int weight = 60;
int height = 180;
Gender selectedGender;

class _InputPageState extends State<InputPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('BullBull'),
        ),
        body: Column(
          children: <Widget>[
            Expanded(
                child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    onPressed: () {
                      setState(() {
                        selectedGender = Gender.male;
                      });
                    },
                    colur: (selectedGender == Gender.male)
                        ? kactcardColor
                        : kdeactcardColor,
                    cardChild: Qcont(
                      icon: FontAwesomeIcons.mars,
                      text: 'Male',
                    ),
                  ),
                ),
                Expanded(
                    child: ReusableCard(
                  colur: (selectedGender == Gender.female)
                      ? kactcardColor
                      : kdeactcardColor,
                  onPressed: () {
                    setState(() {
                      selectedGender = Gender.female;
                    });
                  },
                  cardChild:
                      Qcont(icon: FontAwesomeIcons.venus, text: 'FEMALE'),
                )),
              ],
            )),
            Expanded(
                child: ReusableCard(
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'HEIGHT',
                    style: TextStyle(fontSize: 22, color: Colors.white),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(height.toString(), style: kNumberStyle),
                      Text('cm', style: kNumberStyle)
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      activeTrackColor: Colors.grey,
                      thumbColor: Color(0xFFeb1555),
                      overlayColor: Color(0x30eb1555),
                      thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15),
                      overlayShape:
                          RoundSliderOverlayShape(overlayRadius: 30.0),
                    ),
                    child: Slider(
                        value: height.toDouble(),
                        min: 120.0,
                        max: 220.0,
                        //activeColor: Colors.grey[100],
                        inactiveColor: Colors.grey,
                        onChanged: (double newValue) {
                          setState(() {
                            height = newValue.round();
                          });
                        }),
                  )
                ],
              ),
              colur: kactcardColor,
            )),
            Expanded(
                child: Row(
              children: <Widget>[
                Expanded(
                    child: ReusableCard(
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'WEIGHT',
                        style: kTextStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: [
                          Text(
                            weight.toString(),
                            style: kNumberStyle,
                          ),
                          Text(
                            'kg',
                            style: kTextStyle,
                          )
                        ],
                      ),
                      SizedBox(height: 10.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RoundIconButton(
                              onPressed: () {
                                setState(() {
                                  weight++;
                                });
                              },
                              child: Icon(
                                FontAwesomeIcons.plus,
                                color: Colors.white,
                              )),
                          SizedBox(width: 10),
                          RoundIconButton(
                              onPressed: () {
                                setState(() {
                                  weight--;
                                });
                              },
                              child: Icon(
                                FontAwesomeIcons.minus,
                                color: Colors.white,
                              )),
                        ],
                      )
                    ],
                  ),
                  colur: kactcardColor,
                )),
                Expanded(
                    child: ReusableCard(
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'AGE',
                        style: kTextStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: [
                          Text(
                            age.toString(),
                            style: kNumberStyle,
                          ),
                          Text(
                            'yrs',
                            style: kTextStyle,
                          )
                        ],
                      ),
                      SizedBox(height: 10.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RoundIconButton(
                              onPressed: () {
                                setState(() {
                                  age++;
                                });
                              },
                              child: Icon(
                                FontAwesomeIcons.plus,
                                color: Colors.white,
                              )),
                          SizedBox(width: 10),
                          RoundIconButton(
                              onPressed: () {
                                setState(() {
                                  age--;
                                });
                              },
                              child: Icon(
                                FontAwesomeIcons.minus,
                                color: Colors.white,
                              )),
                        ],
                      )
                    ],
                  ),
                  colur: kactcardColor,
                )),
              ],
            )),
            GestureDetector(
              onTap: () {
                Brain brain = Brain(height: height, weight: weight);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ResultPage(
                              wordresult: brain.result(),
                              bmivalue: brain.calculator(),
                              message: brain.review(),
                            )));
              },
              child: Container(
                child: Center(
                  child: Text(
                    "CALCULATE",
                    style: kcalciButtonFont,
                  ),
                ),
                margin: EdgeInsets.only(top: 8),
                color: Colors.redAccent,
                width: double.infinity,
                height: kbottomContainerHeight,
              ),
            ),
          ],
        ));
  }
}

class RoundIconButton extends StatelessWidget {
  RoundIconButton({this.onPressed, this.child});
  final Function onPressed;
  final Icon child;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: child,
      disabledElevation: 8.0,
      fillColor: Colors.grey[700],
      shape: CircleBorder(),
      constraints: BoxConstraints.tightFor(
        width: 84.0,
        height: 84.0,
      ),
      onPressed: onPressed,
    );
  }
}
