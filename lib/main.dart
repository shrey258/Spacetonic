// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home_Page(),
    );
  }
}

class Home_Page extends StatefulWidget {
  @override
  State<Home_Page> createState() => _Home_PageState();
}

class _Home_PageState extends State<Home_Page> {
  var weightController = TextEditingController();

  var feetController = TextEditingController();

  var inchesController = TextEditingController();

  var result = "";

  var bgColor = Colors.indigo.shade200;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI CALCULATOR'),
      ),
      body: Container(
        color: bgColor,
        child: Center(
          child: Container(
            width: 300,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "BMI",
                  style: TextStyle(
                    fontSize: 34,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(
                  height: 21,
                ),
                TextField(
                  controller: weightController,
                  decoration: InputDecoration(
                    label: Text('Your Weight'),
                    prefixIcon: Icon(Icons.line_weight),
                  ),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(
                  height: 11,
                ),
                TextField(
                  controller: feetController,
                  decoration: InputDecoration(
                    label: Text('Your Height(feet)'),
                    prefixIcon: Icon(Icons.height),
                  ),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(
                  height: 11,
                ),
                TextField(
                  controller: inchesController,
                  decoration: InputDecoration(
                    label: Text('Your Height(remaining inches)'),
                    prefixIcon: Icon(Icons.height),
                  ),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(
                  height: 16,
                ),
                ElevatedButton(
                  onPressed: () {
                    var weight = weightController.text.toString();
                    var feet = feetController.text.toString();
                    var inches = inchesController.text.toString();

                    if (weight != "" && feet != "" && inches != "") {
                      var iWeight = int.parse(weight);
                      var iFeet = int.parse(feet);
                      var iInches = int.parse(inches);

                      var tInches = (iFeet * 12) + iInches;

                      var tM = (tInches * 2.54) / 100;
                      var bmi = iWeight / (tM * tM);

                      var msg = "";

                      if (bmi > 25) {
                        msg = "You are overweight!";
                        bgColor = Colors.orange.shade200;
                      } else if (bmi < 18) {
                        msg = "You are underweight!";
                        bgColor = Colors.red.shade200;
                      } else {
                        msg = "You are healthy!";
                        bgColor = Colors.green.shade200;
                      }

                      setState(() {
                        result =
                            "$msg \n Your BMI is: ${bmi.toStringAsFixed(2)}";
                      });
                    } else {
                      setState(() {
                        result = "Please fill all the required blanks";
                      });
                    }
                  },
                  child: Text("Calculate"),
                ),
                SizedBox(
                  height: 11,
                ),
                Text(
                  result,
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
