import 'package:flutter/material.dart';
import 'package:ur_loc/services/world_time.dart';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  void setupWorldTime() async {
    WorldTime instance = WorldTime(
        location: 'Vancouver', flag: 'canada.png', url: 'America/Vancouver');
    await instance.getTime();
    Navigator.pushNamed(context, "/home", arguments: {
      "location": instance.location,
      "time": instance.time,
      "flag": instance.flag,
      "isDaytime": instance.isDaytime
    });
  }

  @override
  void initState() {
    super.initState();
    setupWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text('Loading...'),
    );
  }
}
