// ignore_for_file: unnecessary_const
import 'package:flutter/material.dart';
import 'dart:developer';
import 'package:tanihara_app/model/plant.dart';

class MeasurementScreen extends StatefulWidget {
  const MeasurementScreen({Key? key}) : super(key: key);

  @override
  State<MeasurementScreen> createState() => _MeasurementScreenState();
}

class _MeasurementScreenState extends State<MeasurementScreen> {
  void addData(PlantsData data) {
    setState(() {
      datas.add(data);
      datasNames.add(data.name);
    });
  }

  Future<void> _returnData(BuildContext context) async {
    final result = await Navigator.push(context,
        MaterialPageRoute(builder: (context) => const AddMoreDataScreen()));

    if (!mounted) return;

    if (result != null) {
      addData(result);
    }
  }

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
                  "My Data",
                  style: const TextStyle(
                      color: const Color(0xFF06AA50),
                      fontSize: 29,
                      fontWeight: FontWeight.w700),
                ),
              ),
              const SizedBox(height: 12),
              Center(
                child: Card(
                  semanticContainer: true,
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  elevation: 2,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Image(
                    fit: BoxFit.fill,
                    image: AssetImage("images/minimaps.png"),
                  ),
                ),
              ),
              const SizedBox(height: 23),
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: datas.length,
                itemBuilder: (context, index) {
                  return Card(
                    margin:
                        const EdgeInsets.symmetric(horizontal: 17, vertical: 6),
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    DisplayDataScreen(data: datas[index])));
                      },
                      borderRadius: BorderRadius.circular(15),
                      child: ListTile(
                        dense: true,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        tileColor: const Color.fromARGB(255, 244, 244, 244),
                        title: Text(
                          datas[index].name,
                          style: const TextStyle(
                              color: Color(0xFF06AA50),
                              fontSize: 17,
                              fontWeight: FontWeight.w700),
                        ),
                        subtitle: const Text("1 Samples"),
                        trailing: Container(
                          decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 205, 205, 205),
                              borderRadius: BorderRadius.circular(10)),
                          padding: const EdgeInsets.all(5),
                          child: const Icon(Icons.arrow_forward_ios, size: 20),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: Container(
        margin: const EdgeInsets.fromLTRB(0, 0, 0, 35),
        height: 40,
        width: 150,
        child: FloatingActionButton.extended(
          elevation: 2,
          onPressed: () {
            _returnData(context);
          },
          backgroundColor: const Color(0xFF06AA50),
          icon: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(100),
            ),
            child: const Icon(Icons.add_rounded, color: Color(0xFF06AA50)),
          ),
          label: const Text("Add data", style: const TextStyle(fontSize: 19)),
        ),
      ),
    );
  }
}

class AddMoreDataScreen extends StatefulWidget {
  const AddMoreDataScreen({Key? key}) : super(key: key);

  @override
  State<AddMoreDataScreen> createState() => _AddMoreDataScreenState();
}

class _AddMoreDataScreenState extends State<AddMoreDataScreen> {
  var dropdownVal = "NPK P201";

  var _plantNameController = TextEditingController();
  var _deviceEUIController = TextEditingController();
  var _deviceIDController = TextEditingController();
  var _deviceAdrController = TextEditingController();

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
                  "Add Data",
                  style: const TextStyle(
                      color: const Color(0xFF06AA50),
                      fontSize: 29,
                      fontWeight: FontWeight.w700),
                ),
              ),
              const Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Text(
                  "Please enter your data below",
                  style: const TextStyle(
                      color: const Color(0xFF888888), fontSize: 16),
                ),
              ),
              const SizedBox(height: 53),
              Center(
                child: SizedBox(
                  width: 320,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Select Your Tools",
                          style: const TextStyle(
                              fontSize: 18,
                              color: Color(0xFF06AA50),
                              fontWeight: FontWeight.w700),
                        ),
                        DropdownButtonFormField<String>(
                          value: dropdownVal,
                          decoration: InputDecoration(
                            isDense: true,
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 16, horizontal: 16),
                            filled: true,
                            fillColor: Colors.transparent,
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                              borderSide: const BorderSide(
                                  width: 1.0, color: Color(0xFF06AA50)),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                              borderSide: const BorderSide(
                                  width: 1.0, color: Color(0xFF06AA50)),
                            ),
                          ),
                          focusColor: const Color(0xFF06AA50),
                          items: <String>['NPK P201', 'NPK P202', 'NPK P203']
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value,
                                  style: const TextStyle(
                                      color: const Color(0xFF06AA50))),
                            );
                          }).toList(),
                          onChanged: (String? newVal) {
                            setState(() {
                              dropdownVal = newVal!;
                            });
                          },
                        ),
                      ]),
                ),
              ),
              const SizedBox(height: 5),
              Center(
                child: SizedBox(
                  width: 320,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Plant Name",
                          style: const TextStyle(
                              fontSize: 18,
                              color: Color(0xFF06AA50),
                              fontWeight: FontWeight.w700),
                        ),
                        TextFormField(
                          controller: _plantNameController,
                          decoration: InputDecoration(
                            floatingLabelBehavior: FloatingLabelBehavior.never,
                            labelText: "Enter here...",
                            isDense: true,
                            filled: true,
                            fillColor: const Color.fromARGB(255, 244, 244, 244),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: const BorderSide(color: Colors.grey),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: const BorderSide(color: Colors.grey),
                            ),
                          ),
                        )
                      ]),
                ),
              ),
              const SizedBox(height: 5),
              Center(
                child: SizedBox(
                  width: 320,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "LoRa.id Device EUI",
                          style: const TextStyle(
                              fontSize: 18,
                              color: Color(0xFF06AA50),
                              fontWeight: FontWeight.w700),
                        ),
                        TextFormField(
                          controller: _deviceEUIController,
                          decoration: InputDecoration(
                            floatingLabelBehavior: FloatingLabelBehavior.never,
                            labelText: "Enter here...",
                            isDense: true,
                            filled: true,
                            fillColor: const Color.fromARGB(255, 244, 244, 244),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: const BorderSide(color: Colors.grey),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: const BorderSide(color: Colors.grey),
                            ),
                          ),
                        )
                      ]),
                ),
              ),
              const SizedBox(height: 5),
              Center(
                child: SizedBox(
                  width: 320,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "LoRa.id Device ID",
                          style: const TextStyle(
                              fontSize: 18,
                              color: Color(0xFF06AA50),
                              fontWeight: FontWeight.w700),
                        ),
                        TextFormField(
                          controller: _deviceIDController,
                          decoration: InputDecoration(
                            floatingLabelBehavior: FloatingLabelBehavior.never,
                            labelText: "Enter here...",
                            isDense: true,
                            filled: true,
                            fillColor: const Color.fromARGB(255, 244, 244, 244),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: const BorderSide(color: Colors.grey),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: const BorderSide(color: Colors.grey),
                            ),
                          ),
                        )
                      ]),
                ),
              ),
              const SizedBox(height: 5),
              Center(
                child: SizedBox(
                  width: 320,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "LoRa.id Device Address",
                          style: const TextStyle(
                              fontSize: 18,
                              color: Color(0xFF06AA50),
                              fontWeight: FontWeight.w700),
                        ),
                        TextFormField(
                          controller: _deviceAdrController,
                          decoration: InputDecoration(
                            floatingLabelBehavior: FloatingLabelBehavior.never,
                            labelText: "Enter here...",
                            isDense: true,
                            filled: true,
                            fillColor: const Color.fromARGB(255, 244, 244, 244),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: const BorderSide(color: Colors.grey),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: const BorderSide(color: Colors.grey),
                            ),
                          ),
                        )
                      ]),
                ),
              ),
              const SizedBox(height: 44),
              Center(
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: const Color(0xFF06AA50),
                          elevation: 0,
                          fixedSize: const Size(320, 44),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10))),
                      onPressed: () {
                        if (_plantNameController.text != "" &&
                            _deviceEUIController != "" &&
                            _deviceIDController != "" &&
                            _deviceAdrController != "") {
                          Navigator.pop(
                              context,
                              PlantsData(
                                  dropdownVal,
                                  _plantNameController.text,
                                  _deviceEUIController.text,
                                  _deviceIDController.text,
                                  _deviceAdrController.text));
                        } else {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: const Text("Warning!"),
                                  content: const Text(
                                      "All fields are required to be filled"),
                                  actions: [
                                    Center(
                                      child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          fixedSize: const Size(100, 20),
                                          primary: const Color(0xFF06AA50),
                                        ),
                                        child: const Text("OK"),
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                      ),
                                    ),
                                  ],
                                );
                              });
                        }
                      },
                      child: const Text("Submit",
                          style: const TextStyle(fontSize: 21))))
            ],
          ),
        ),
      ),
    );
  }
}

class DisplayDataScreen extends StatelessWidget {
  const DisplayDataScreen({Key? key, required this.data}) : super(key: key);

  final PlantsData data;

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
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        data.name,
                        style: const TextStyle(
                            color: const Color(0xFF06AA50),
                            fontSize: 29,
                            fontWeight: FontWeight.w700),
                      ),
                      const Text(
                        "1 samples",
                        style:
                            TextStyle(color: Color(0xFF888888), fontSize: 16),
                      ),
                    ]),
              ),
              const SizedBox(height: 34),
              Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Tools",
                      style: TextStyle(
                          color: Color(0xFF06AA50),
                          fontSize: 17,
                          fontWeight: FontWeight.w700),
                    ),
                    Card(
                      elevation: 3,
                      clipBehavior: Clip.antiAlias,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Container(
                          padding: const EdgeInsets.all(10),
                          color: const Color.fromARGB(255, 223, 223, 223),
                          height: 96,
                          width: 329,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text("LoRa.id Device EUI: " + data.eui),
                              Text("LoRa.id Device ID: " + data.id),
                              Text("LoRa.id Device Address: " + data.address)
                            ],
                          )),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 19),
              Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Text(
                      "Samples",
                      style: TextStyle(
                          color: Color(0xFF06AA50),
                          fontSize: 17,
                          fontWeight: FontWeight.w700),
                    ),
                    Card(
                      elevation: 2,
                      color: const Color.fromARGB(255, 244, 244, 244),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      child: SizedBox(
                        height: 170,
                        width: 329,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            const Text("1",
                                style: const TextStyle(
                                    fontSize: 98, color: Color(0xFF10733D))),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "N: 100.00",
                                  style: TextStyle(
                                      color: Color(0xFF888888),
                                      fontWeight: FontWeight.w500),
                                ),
                                const Text(
                                  "P: 9.01",
                                  style: TextStyle(
                                      color: Color(0xFF888888),
                                      fontWeight: FontWeight.w500),
                                ),
                                const Text(
                                  "K: 71.00",
                                  style: TextStyle(
                                      color: Color(0xFF888888),
                                      fontWeight: FontWeight.w500),
                                ),
                                const Text(
                                  "Moist: 1.00",
                                  style: TextStyle(
                                      color: Color(0xFF888888),
                                      fontWeight: FontWeight.w500),
                                ),
                                const Text(
                                  "pH: 1.00",
                                  style: TextStyle(
                                      color: Color(0xFF888888),
                                      fontWeight: FontWeight.w500),
                                ),
                                const Text(
                                  "Longitude: 107.613144",
                                  style: TextStyle(
                                      color: Color(0xFF888888),
                                      fontWeight: FontWeight.w500),
                                ),
                                const Text(
                                  "Latitude: -6.905977",
                                  style: TextStyle(
                                      color: Color(0xFF888888),
                                      fontWeight: FontWeight.w500),
                                ),
                                const Text(
                                  "Time: 06:57:34",
                                  style: TextStyle(
                                      color: Color(0xFF888888),
                                      fontWeight: FontWeight.w500),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
