import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};

  @override
  Widget build(BuildContext context) {
    data = data.isNotEmpty
        ? data
        : ModalRoute.of(context)!.settings.arguments as Map;

    String bgImage = data['isDaytime'] ? 'day_time.jpg' : 'night_time.jpg';
    Color bgColor = data['isDaytime'] ? Colors.blue : Colors.indigo;

    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
          child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/$bgImage'),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 120, 0, 0),
          child: Column(
            children: <Widget>[
              TextButton.icon(
                  onPressed: () async {
                    dynamic result =
                        await Navigator.pushNamed(context, '/location');
                    setState(() {
                      data = {
                        "time": result["time"],
                        "location": result["location"],
                        "isDaytime": result["isDaytime"],
                        "flag": result["flag"]
                      };
                    });
                  },
                  icon: Icon(
                    Icons.edit_location,
                    color: Colors.grey[900],
                  ),
                  label: Text("Edit Location")),
              SizedBox(
                height: 20.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    data['location'],
                    style: TextStyle(
                        fontSize: 20.0,
                        letterSpacing: 2.0,
                        color: Colors.grey[900]),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Text(
                data['time'],
                style: TextStyle(fontSize: 66.0, color: Colors.grey[900]),
              )
            ],
          ),
        ),
      )),
    );
  }
}
