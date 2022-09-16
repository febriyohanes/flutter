import 'package:bmi/view/bmi_result_screen.dart';
import 'package:bmi/view/constants/constant.dart';
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
                Expanded(child: BmiCard()),
                Expanded(
                    child: Container(
                  decoration: BoxDecoration(
                      color: Color(0xff00456a),
                      borderRadius: BorderRadius.circular(15)),
                  margin: EdgeInsets.all(15),
                  child: GenderIconText(
                    title: 'Female',
                    icon: Icons.female,
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

class BmiCard extends StatelessWidget {
  const BmiCard({
    Key? key, this.child,

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
      child: GenderIconText(
        title: 'Male',
        icon: Icons.male,
      ),
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
          style: genderTextStyle,
        )
      ],
    );
  }
}
