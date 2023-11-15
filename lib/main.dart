import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
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
  RangeValues _values = const RangeValues(0, 200);
  RangeValues _values1 = const RangeValues(0, 300);
  String calans='Loading...';

  double _counter = 0.0;

  calculateBMI() {
    double height = double.parse(_values.end.toStringAsFixed(1));
    double weight = double.parse(_values1.end.toStringAsFixed(1));
    print(weight);
    print(height);
    height=height/100;
    print("%%%%%%%%%%");
    print(height);
    double ans1 = (weight / (height * height));
    setState(() {
      _counter =double.parse(ans1.toStringAsFixed(1));
      print(_counter);
      getWeightStatus(_counter);
    });
    return ans1;
  }

  String getWeightStatus(double bmi) {
    if (bmi < 18.5) {
      calans='Underweight';
      return 'Underweight';
    } else if (bmi >= 18.5 && bmi < 25) {
      calans='Normal Weight';

      return 'Normal Weight';
    } else if (bmi >= 25 && bmi < 30) {
      calans='Overweight';

      return 'Overweight';
    } else {
      calans='Obese';

      return 'Obese';
    }
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
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              height: 00.0,
              width: double.infinity,
              color: Colors.green,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children:  [
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
                    height: 10,
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                        '$_counter', // Removing const from here
                      style: TextStyle(
                        fontSize: 50,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),



                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Text(
                        "Your condition:",
                        style: TextStyle(
                            fontWeight: FontWeight.normal, fontSize: 20,color: Colors.purple),
                      ),
                      Text(
                        calans,
                        style: TextStyle(
                          fontSize: 20,
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
                       'Choose Data', // Convert RangeValues to String
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
                                  '${_values.end.toStringAsFixed(1)}',
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
                          max: 200,
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
                                '${_values1.end.toStringAsFixed(1)}',
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
                          max: 300,
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 30),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50.0)
                            ),
                            height: 40,
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: () {
                                // double weight = double.parse(_values.end.toStringAsFixed(1));
                                // double height = double.parse(_values1.end.toStringAsFixed(1));
                                calculateBMI();
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
