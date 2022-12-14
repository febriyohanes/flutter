import 'dart:html';

import 'package:bmi/view/bmi_result_screen.dart';
import 'package:bmi/view/constants/constant.dart';
import 'package:flutter/material.dart';

class BmiDataScreen extends StatefulWidget {
  const BmiDataScreen({Key? key}) : super(key: key);

  @override
  State<BmiDataScreen> createState() => _BmiDataScreenState();
}

class _BmiDataScreenState extends State<BmiDataScreen> {
  int height = 100;
  int weight = 100;
  int age = 20;

  double calculateBmi(){

    double heightinMeter = height / 100;
    double bmi = weight / (heightinMeter * heightinMeter);
    return bmi;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff051937),
      appBar: AppBar(
        title: Text("BMI CALCULATOR"),
      ),
      body: Column(
        children: [
          Expanded(
              child: Container(
            child: Row(
              children: [
                Expanded(
                    child: BmiCard(
                        child: GenderIconText(
                  title: 'Male',
                  icon: Icons.male,
                ))),
                Expanded(
                    child: BmiCard(
                        child: GenderIconText(
                  title: 'Female',
                  icon: Icons.female,
                )))
              ],
            ),
          )),
          Expanded(
              child: Container(
            child: BmiCard(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "HEIGHT",
                    style: labelTextstyle!
                        .copyWith(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        "$height",
                        style: numberTextStyle,
                      ),
                      Text(
                        "cm",
                        style: labelTextstyle,
                      ),
                    ],
                  ),
                  Slider(
                    value: height.toDouble(),
                    min: 80,
                    max: 200,
                    thumbColor: Colors.red,
                    inactiveColor: Colors.blue,
                    activeColor: Colors.white,
                    onChanged: (value) {
                      height = value.toInt();
                      setState(() {});
                    },
                  )
                ],
              ),
            ),
          )),
          Expanded(
              child: Container(
            child: Row(
              children: [
                Expanded(
                    child: BmiCard(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Weight",
                        style: labelTextstyle,
                      ),
                      Text("$weight", style: numberTextStyle),
                      SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RawMaterialButton(
                            onPressed: () {
                              weight++;
                              setState(() {

                              });
                            },
                            elevation: 0,
                            child: Icon(
                              Icons.add,
                              color: Colors.white,
                            ),
                            shape: CircleBorder(),
                            fillColor: Color(0xff212747),
                            constraints:
                                BoxConstraints.tightFor(width: 56, height: 56),
                          ),
                          SizedBox(width: 10),
                          RawMaterialButton(
                            onPressed: () {
                              weight--;
                              setState(() {

                              });
                            },
                            elevation: 0,
                            child: Icon(
                              Icons.remove,
                              color: Colors.white,
                            ),
                            shape: CircleBorder(),
                            fillColor: Color(0xff212747),
                            constraints:
                                BoxConstraints.tightFor(width: 56, height: 56),
                          ),
                        ],
                      )
                    ],
                  ),
                )),
                Expanded(
                    child: BmiCard(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Age",
                        style: labelTextstyle,
                      ),
                      Text("$age", style: numberTextStyle),
                      SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RawMaterialButton(
                            onPressed: () {
                              age++;
                              setState(() {

                              });
                            },
                            elevation: 0,
                            child: Icon(
                              Icons.add,
                              color: Colors.white,
                            ),
                            shape: CircleBorder(),
                            fillColor: Color(0xff212747),
                            constraints:
                                BoxConstraints.tightFor(width: 56, height: 56),
                          ),
                          SizedBox(width: 10),
                          RawMaterialButton(
                            onPressed: () {
                              age--;
                              setState(() {

                              });
                            },
                            elevation: 0,
                            child: Icon(
                              Icons.remove,
                              color: Colors.white,
                            ),
                            shape: CircleBorder(),
                            fillColor: Color(0xff212747),
                            constraints:
                                BoxConstraints.tightFor(width: 56, height: 56),
                          ),
                        ],
                      )
                    ],
                  ),
                )),
              ],
            ),
          )),
          GestureDetector(
            onTap: () {
              print(calculateBmi());
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return BmiResultScreen(
                  bmi: calculateBmi(),
                );
              }));
            },
            child: Container(
              height: 80,
              color: Colors.orange,
              child: Center(child: Text("Calculate BMI",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.bold
                  ),)),
            ),
          )
        ],
      ),
    );
  }
}

class BmiCard extends StatelessWidget {
  const BmiCard({
    Key? key,
    this.child,
  }) : super(key: key);
  final Widget? child;

  //Materi 7 menit ke 11.46
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xff00456a),
        borderRadius: BorderRadius.circular(15),
      ),
      margin: EdgeInsets.all(15),
      child: child,
    );
  }
}

class GenderIconText extends StatelessWidget {
  const GenderIconText({
    Key? key,
    required this.title,
    required this.icon,
  }) : super(key: key);

  final String title;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, size: 80, color: Color(0xffe7efff)),
        const SizedBox(height: 15),
        Text(
          title,
          style: labelTextstyle,
        )
      ],
    );
  }
}
