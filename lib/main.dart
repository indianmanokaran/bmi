import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BMI Calculator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const BMIPage(),
    );
  }
}

class BMIPage extends StatefulWidget {
  const BMIPage({Key? key}) : super(key: key);

  @override
  _BMIPageState createState() => _BMIPageState();
}

class _BMIPageState extends State<BMIPage> {
  RangeValues _values = const RangeValues(0, 100);
  RangeValues _values1 = const RangeValues(0, 100);
  double ans=0.0;

  calculateBMI(double weight, double heightInCentimeters) {
    print(weight);
    print(heightInCentimeters);
    double ans1 = weight / (heightInCentimeters * heightInCentimeters);
    print(ans1);
    setState(() {
      ans = ans1;
      print(ans);
    });
    return ans1;
  }


  @override
  Widget build(BuildContext context) {
    // print(_values.end.toStringAsFixed(1));
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            flex: 2,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              height: 00.0,
              width: double.infinity,
              color: Colors.green,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    'BMI',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 50.0,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Calculator',
                    style: TextStyle(
                        color: Colors.purple,
                        fontSize: 35.0,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      ans != null ? ans.toStringAsFixed(1) : '0.0',
                      style: TextStyle(
                        fontSize: 50,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),


                  SizedBox(
                    height: 50,
                  ),
                  Row(
                    children: [
                      Text(
                        "condition:",
                        style: TextStyle(
                            fontWeight: FontWeight.normal, fontSize: 28),
                      ),
                      Text(
                        "UnderWeight",
                        style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Container(
              width: double.infinity,
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Text(
                        '${_values.end.toStringAsFixed(1)}', // Convert RangeValues to String
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.green,
                        ),
                      ),

                    ),
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Row(
                            children: [
                              Text(
                                "Height    :",
                                style: TextStyle(fontSize: 30),
                              ),
                              SizedBox(width: 20), // Adjust the width as needed
                              Text(
                                "167.74 cm",
                                style: TextStyle(fontSize: 30),
                              ),
                            ],
                          ),
                        ),
                        RangeSlider(
                          values: _values,
                          onChanged: (RangeValues newValues) {
                            setState(() {
                              _values = newValues;
                            });
                          },
                          min: 0,
                          max: 100,
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Row(
                            children: [
                              Text(
                                "Weight    :",
                                style: TextStyle(fontSize: 30),
                              ),
                              SizedBox(width: 20), // Adjust the width as needed
                              Text(
                                "56 kg",
                                style: TextStyle(fontSize: 30),
                              ),
                            ],
                          ),
                        ),
                        RangeSlider(
                          values: _values1,
                          onChanged: (RangeValues newValues) {
                            setState(() {
                              _values1 = newValues;
                            });
                          },
                          min: 0,
                          max: 100,
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 50),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50.0)
                            ),
                            height: 40,
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: () {
                                double weight = double.parse(_values.end.toStringAsFixed(1));
                                double height = double.parse(_values1.end.toStringAsFixed(1));
                                calculateBMI(weight, height);
                              },

                              style: ElevatedButton.styleFrom(
                                primary: Color.fromRGBO(25, 68, 26, 100),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(230),
                                  // Adjust the value as needed
                                ),
                              ),
                              child: Text("Calculate",style: TextStyle(fontWeight:FontWeight.bold,),),
                            )

                          ),
                        )


                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),

          // Add BMI calculation widgets here
        ],
      ),
    );
  }
}
