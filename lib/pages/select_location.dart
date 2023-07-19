import 'package:flutter/material.dart';

class SelectLocation extends StatefulWidget {
  const SelectLocation({super.key});

  @override
  State<SelectLocation> createState() => _SelectLocationState();
}

class _SelectLocationState extends State<SelectLocation> {
  void getData() async {
    // simulate network request for a username
    String username = await Future.delayed(Duration(seconds: 3), () {
      return 'yoshi';
    });

    // simulate network request to get bio of the username
    String bio = await Future.delayed(Duration(seconds: 2), () {
      return 'vegan, musician';
    });

    print('$username - $bio'); // Future is synchronise
  }

  @override
  void initState() {
    super.initState();
    getData();
    print('hey there!');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        centerTitle: true,
        elevation: 0,
        title: Text('Select a location'),
      ),
      body: Text('Choose a location'),
    );
  }
}
