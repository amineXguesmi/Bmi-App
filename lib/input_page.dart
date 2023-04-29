import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'Constants.dart';
import 'calculation.dart';
import 'card.dart';
import 'resultPage.dart';

enum Gender { male, female }

class InputPage extends StatefulWidget {
  const InputPage({Key? key}) : super(key: key);

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender SelectedGender = Gender.male;
  double height = 180;
  double weight = 60;
  double age = 20;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFF0A0E21),
          title: Center(child: Text("BMI CALCULATOR")),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              flex: 1,
              child: Row(
                children: [
                  Expanded(
                      child: GestureDetector(
                    onTap: () {
                      setState(() {
                        SelectedGender = Gender.male;
                      });
                    },
                    child: Re_Card(
                        SelectedGender == Gender.male
                            ? Active_color
                            : InActive_color,
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(FontAwesomeIcons.mars, size: 80),
                            SizedBox(
                              height: 15,
                            ),
                            Text(
                              "MALE",
                              style: LabelTexttStyle,
                            )
                          ],
                        )),
                  )),
                  Expanded(
                      child: GestureDetector(
                    onTap: () {
                      setState(() {
                        SelectedGender = Gender.female;
                      });
                    },
                    child: Re_Card(
                        SelectedGender == Gender.female
                            ? Active_color
                            : InActive_color,
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(FontAwesomeIcons.venus, size: 80),
                            SizedBox(
                              height: 15,
                            ),
                            Text(
                              "FEMALE",
                              style: LabelTexttStyle,
                            )
                          ],
                        )),
                  )),
                ],
              ),
            ),
            Expanded(
                flex: 1,
                child: Re_Card(
                    Active_color,
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Height",
                          style: LabelTexttStyle,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          mainAxisAlignment: MainAxisAlignment.center,
                          textBaseline: TextBaseline.alphabetic,
                          children: [
                            Text(
                              height.toInt().toString(),
                              style: NumTextStyle,
                            ),
                            Text(
                              "cm",
                              style: LabelTexttStyle,
                            )
                          ],
                        ),
                        SliderTheme(
                          data: SliderTheme.of(context).copyWith(
                            thumbShape:
                                RoundSliderThumbShape(enabledThumbRadius: 15.0),
                            overlayShape:
                                RoundSliderOverlayShape(overlayRadius: 30),
                            thumbColor: Color(0xFFEB1555),
                            activeTrackColor: Colors.white,
                            overlayColor: Color(0x29EB1555),
                          ),
                          child: Slider(
                            max: 220.0,
                            min: 120.0,
                            value: height,
                            inactiveColor: Color(0xFFBDE9B),
                            onChanged: (value) {
                              setState(() {
                                height = value;
                              });
                            },
                          ),
                        )
                      ],
                    ))),
            Expanded(
              flex: 1,
              child: Row(
                children: [
                  Expanded(
                      child: Re_Card(
                          Active_color,
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("WEIGHT", style: LabelTexttStyle),
                              Text(
                                weight.toString(),
                                style: NumTextStyle,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  RoundIconButton(
                                      Icon(
                                        Icons.add,
                                        color: Colors.white,
                                      ),
                                      () => {
                                            setState(() {
                                              weight++;
                                            })
                                          }),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  RoundIconButton(
                                      Icon(
                                        Icons.minimize,
                                        color: Colors.white,
                                      ),
                                      () => {
                                            setState(() {
                                              weight--;
                                            })
                                          })
                                ],
                              ),
                            ],
                          ))),
                  Expanded(
                      child: Re_Card(
                          Active_color,
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("AGE", style: LabelTexttStyle),
                              Text(
                                age.toString(),
                                style: NumTextStyle,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  RoundIconButton(
                                      Icon(
                                        Icons.add,
                                        color: Colors.white,
                                      ),
                                      () => {
                                            setState(() {
                                              age++;
                                            })
                                          }),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  RoundIconButton(
                                      Icon(
                                        Icons.minimize,
                                        color: Colors.white,
                                      ),
                                      () => {
                                            setState(() {
                                              age--;
                                            })
                                          })
                                ],
                              ),
                            ],
                          ))),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                CalculatorBrain result =
                    CalculatorBrain(this.weight, this.height);

                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ResultPage(result)));
              },
              child: Container(
                padding: EdgeInsets.only(bottom: 20, top: 10),
                child: Center(
                    child: Text(
                  'CAlCULATE',
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
        ));
  }
}

class RoundIconButton extends StatelessWidget {
  final Widget child;
  final VoidCallback onPress;
  RoundIconButton(@required this.child, @required this.onPress);
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: this.child,
      elevation: 6.0,
      onPressed: onPress,
      shape: CircleBorder(),
      fillColor: Color(0xFF4C4F5E),
      constraints: BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
    );
  }
}
