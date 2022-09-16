import 'package:bmi/bmi_result_screen.dart';
import 'package:flutter/material.dart';

class BmiDataScreen extends StatefulWidget {
  const BmiDataScreen({Key? key}) : super(key: key);

  @override
  State<BmiDataScreen> createState() => _BmiDataScreenState();
}

class _BmiDataScreenState extends State<BmiDataScreen> {
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
                        child: Container(
                          decoration: BoxDecoration(
                            color: Color(0xff00456a),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          margin: EdgeInsets.all(15),
                          child: Column( 
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [Icon(Icons.male, size: 80,color: Color(0xffe7efff)), Text(
                              "Male",
                              style: TextStyle(
                                fontSize: 18,
                                color: Color(0xffe7efff)
                              ),
                            )],
                          ),
                        )),
                    Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            color: Color(0xff00456a),
                            borderRadius: BorderRadius.circular(15)
                          ),
                          margin: EdgeInsets.all(15),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [Icon(Icons.female, size: 80, color: Color(0xffe7efff),), Text("Female",
                              style: TextStyle(
                                  fontSize: 18,
                                  color: Color(0xffe7efff)
                              ),)],
                          ),
                        ))
                  ],
                ),
              )),
          Expanded(child: Container(color: Colors.green)),
          Expanded(child: Container(color: Colors.blue)),
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return BmiResultScreen();
              }));
            },
            child: Container(
              height: 100,
              color: Colors.orange,
              child: Center(child: Text("Hitung BMI")),
            ),
          )
        ],
      ),
    );
  }
}
