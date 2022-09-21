import 'package:bmi/view/bmi_data_screen.dart';
import 'package:bmi/view/constants/constant.dart';
import 'package:flutter/material.dart';
import 'dart:ui';

class BmiResultScreen extends StatelessWidget {
  const BmiResultScreen({Key? key, required this.bmi}) : super(key: key);
  final double bmi;

  bmicategory(double bmiValue) {
    String CategoryBmi = "";
    if (bmiValue < 25) {
      CategoryBmi = underweightSevere;
    } else if (bmiValue > 25 && bmiValue < 50) {
      CategoryBmi = underweightMild;
    } else{
      CategoryBmi = underweightModerate;
    }
    return CategoryBmi;
  }
  getDescription(String category) {
    String dec = "";

    switch (category) {
      case underweightSevere:
        dec = "Severe ya mas ";
        break;
      case underweightMild:
        dec = "Mild ya mas ";
        break;
      case underweightModerate:
        dec = "Moderate ya mas ";
        break;
    }

    return dec;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hasil hitung"),
      ),
      body: Column(
        children: [
          Expanded(
              child: Container(
            child: Center(
              child: Text(
                "Result",
                style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue),
              ),
            ),
          )),
          Expanded(
              flex: 5,
              child: Container(
                width: MediaQuery.of(context).size.width,
                child: BmiCard(
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          bmicategory(bmi),
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                        Text("${bmi.toStringAsFixed(1)}",
                            style: TextStyle(
                                fontSize: 100,
                                fontWeight: FontWeight.bold,
                                color: Colors.white)),
                        Text(getDescription(bmicategory(bmi)),
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.white)),
                      ],
                    ),
                  ),
                ),
              )),
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              height: 80,
              color: Colors.orange,
              child: Center(
                  child: Text(
                "Re-Calculate BMI",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.bold),
              )),
            ),
          )
        ],
      ),
    );
  }
}
