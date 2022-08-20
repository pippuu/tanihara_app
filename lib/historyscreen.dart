import 'package:flutter/material.dart';
import 'package:tanihara_app/model/plant.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({Key? key}) : super(key: key);

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
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
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "History",
                      style: TextStyle(
                          color: Color(0xFF06AA50),
                          fontSize: 29,
                          fontWeight: FontWeight.w700),
                    ),
                    Text(
                      "You have " + datas.length.toString() + " tools",
                      style: TextStyle(color: Color(0xFF888888), fontSize: 16),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 32),
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
                            color: Color(0xFF06AA50),
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
                                style: TextStyle(
                                    fontSize: 98, color: Color(0xFF10733D))),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text(
                                  "N: 100.00",
                                  style: TextStyle(
                                      color: Color(0xFF888888),
                                      fontWeight: FontWeight.w500),
                                ),
                                Text(
                                  "P: 9.01",
                                  style: TextStyle(
                                      color: Color(0xFF888888),
                                      fontWeight: FontWeight.w500),
                                ),
                                Text(
                                  "K: 71.00",
                                  style: TextStyle(
                                      color: Color(0xFF888888),
                                      fontWeight: FontWeight.w500),
                                ),
                                Text(
                                  "Moist: 1.00",
                                  style: TextStyle(
                                      color: Color(0xFF888888),
                                      fontWeight: FontWeight.w500),
                                ),
                                Text(
                                  "pH: 1.00",
                                  style: TextStyle(
                                      color: Color(0xFF888888),
                                      fontWeight: FontWeight.w500),
                                ),
                                Text(
                                  "Longitude: 107.613144",
                                  style: TextStyle(
                                      color: Color(0xFF888888),
                                      fontWeight: FontWeight.w500),
                                ),
                                Text(
                                  "Latitude: -6.905977",
                                  style: TextStyle(
                                      color: Color(0xFF888888),
                                      fontWeight: FontWeight.w500),
                                ),
                                Text(
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
