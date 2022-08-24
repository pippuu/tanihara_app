import 'package:flutter/material.dart';

class LocationScreen extends StatefulWidget {
  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    if (screenSize.width < 700) {
      // Mobile screen
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Row(children: [
                  const CircleAvatar(
                      radius: 25,
                      backgroundImage: AssetImage("images/avatar.png"),
                      backgroundColor: Colors.grey),
                  const SizedBox(width: 10),
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          "Hello,",
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 17,
                          ),
                        ),
                        Text(
                          "Patrick William",
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 20,
                            color: Color(0xFF06AA50),
                          ),
                        )
                      ]),
                ]),
                IconButton(
                    color: const Color(0xFF06AA50),
                    onPressed: () => {},
                    icon: const Icon(Icons.notifications_outlined))
              ]),
              const SizedBox(height: 18),
              Container(child: Text("")),
            ],
          ),
        ),
      );
    } else {
      return Text("Ipad screen not done");
    }
  }
}