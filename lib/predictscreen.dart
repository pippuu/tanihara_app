// ignore_for_file: unnecessary_const

import 'package:flutter/material.dart';
import 'package:tanihara_app/model/plant.dart';

class PredictScreen extends StatefulWidget {
  const PredictScreen({Key? key}) : super(key: key);

  @override
  State<PredictScreen> createState() => _PredictScreenState();
}

class _PredictScreenState extends State<PredictScreen> {
  var weekList = ["This Week", "Next Week"];
  var dayList = [
    "Tuesday, Aug 16",
    "Wednesday, Aug 17",
    "Monday, Aug 22",
    "Tuesday, Aug 23"
  ];
  var reminderList = ["Friday, Aug 19", "Saturday, Aug 27"];
  var ppmList = ["293,9 Ppm", "283,9 Ppm"];
  var graphList = [
    "images/vector1_1.png",
    "images/vector1_2.png",
    "images/vector2_1.png",
    "images/vector2_2.png"
  ];

  var primaryIdx = 0;
  var secondaryIdx = 0;
  var thirdIdx = 0;
  var forthIdx = 0;
  var fifthIdx = 0;

  var dropdownVal = datasNames[0];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              IconButton(
                tooltip: "Back to home screen",
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_back),
              ),
              const Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Text(
                  "Weekly Report",
                  style: const TextStyle(
                      color: const Color(0xFF06AA50),
                      fontSize: 29,
                      fontWeight: FontWeight.w700),
                ),
              ),
              const SizedBox(height: 27),
              Center(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.arrow_back_ios),
                          onPressed: () {
                            if (primaryIdx != 0) {
                              setState(() {
                                primaryIdx -= 1;
                                secondaryIdx -= 2;
                                thirdIdx -= 1;
                                forthIdx -= 1;
                                graphList[0] = "images/vector1_1.png";
                                graphList[1] = "images/vector1_2.png";
                              });
                            }
                          },
                        ),
                        Text(weekList[primaryIdx],
                            style: const TextStyle(
                                color: Color(0xFF06AA50),
                                fontSize: 17,
                                fontWeight: FontWeight.w700)),
                        IconButton(
                          icon: const Icon(Icons.arrow_forward_ios),
                          onPressed: () {
                            if (primaryIdx != weekList.length - 1) {
                              setState(() {
                                primaryIdx += 1;
                                secondaryIdx += 2;
                                thirdIdx += 1;
                                forthIdx += 1;
                                graphList[0] = "images/vector2_1.png";
                                graphList[1] = "images/vector2_2.png";
                              });
                            }
                          },
                        ),
                      ],
                    ),
                    Card(
                      elevation: 2,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      child: SizedBox(
                        width: 308,
                        height: 327,
                        child: Stack(
                          children: [
                            Positioned(
                              top: 10,
                              left: 10,
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20)),
                                width: 134,
                                child: DropdownButtonFormField<String>(
                                  value: dropdownVal,
                                  decoration: InputDecoration(
                                    isDense: true,
                                    contentPadding: const EdgeInsets.symmetric(
                                        vertical: 5, horizontal: 10),
                                    filled: true,
                                    fillColor: const Color.fromARGB(
                                        255, 219, 236, 220),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20),
                                      borderSide: const BorderSide(
                                          width: 0.0,
                                          color: Colors.transparent),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20),
                                      borderSide: const BorderSide(
                                          width: 0.0,
                                          color: Colors.transparent),
                                    ),
                                  ),
                                  dropdownColor:
                                      const Color.fromARGB(255, 219, 236, 220),
                                  items: datasNames
                                      .map<DropdownMenuItem<String>>(
                                          (String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value),
                                    );
                                  }).toList(),
                                  onChanged: (String? newVal) {
                                    setState(() {
                                      dropdownVal = newVal!;
                                    });
                                  },
                                ),
                              ),
                            ),
                            Positioned(
                                left: 10,
                                top: 52,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "CALCULATION",
                                      style: TextStyle(
                                          color: Color(0xFF06AA50),
                                          fontSize: 10),
                                    ),
                                    Text(
                                      ppmList[thirdIdx],
                                      style: TextStyle(
                                          color: Color(0xFF06AA50),
                                          fontSize: 30,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ],
                                )),
                            Positioned(
                                top: 120,
                                child: Image(image: AssetImage(graphList[0]))),
                            Positioned(
                                top: 120,
                                child: Image(image: AssetImage(graphList[1]))),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 38),
              Center(
                child: Card(
                  elevation: 2,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  child: SizedBox(
                      width: 170,
                      height: 83,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            dayList[secondaryIdx],
                            style: const TextStyle(fontSize: 12),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              IconButton(
                                icon: const Icon(Icons.arrow_back_ios),
                                onPressed: () {
                                  if (weekList[primaryIdx] == "This Week") {
                                    if (secondaryIdx != 0) {
                                      setState(() {
                                        secondaryIdx -= 1;
                                      });
                                    }
                                  } else {
                                    if (secondaryIdx != 2) {
                                      setState(() {
                                        secondaryIdx -= 1;
                                      });
                                    }
                                  }
                                },
                              ),
                              Text(ppmList[thirdIdx],
                                  style: const TextStyle(
                                      color: Color(0xFF06AA50),
                                      fontSize: 17,
                                      fontWeight: FontWeight.w700)),
                              IconButton(
                                icon: const Icon(Icons.arrow_forward_ios),
                                onPressed: () {
                                  if (weekList[primaryIdx] == "This Week") {
                                    if (secondaryIdx != 1) {
                                      setState(() {
                                        secondaryIdx += 1;
                                      });
                                    }
                                  } else {
                                    if (secondaryIdx != 3) {
                                      setState(() {
                                        secondaryIdx += 1;
                                      });
                                    }
                                  }
                                },
                              ),
                            ],
                          ),
                        ],
                      )),
                ),
              ),
              const SizedBox(height: 32),
              Center(
                child: Card(
                  elevation: 2,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  child: SizedBox(
                      width: 285,
                      height: 99,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image(
                              width: 18,
                              height: 17,
                              image: AssetImage("images/vectorplant.png")),
                          Text(
                            "This plant needs fertilizer on",
                            style: TextStyle(
                                fontSize: 15, color: Color(0xFF06AA50)),
                          ),
                          Text(
                            reminderList[forthIdx],
                            style: TextStyle(
                                fontSize: 15,
                                color: Color(0xFF06AA50),
                                fontWeight: FontWeight.w700),
                          ),
                        ],
                      )),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
