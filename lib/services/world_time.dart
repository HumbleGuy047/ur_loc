import 'dart:convert';

import 'package:http/http.dart';
import 'package:intl/intl.dart';

class WorldTime {
  String location; // location name for the UI
  late String time; // time of the location
  String flag; // url to an asset flag icon
  String url; // location url for api endpoint
  late bool isDaytime;

  WorldTime({required this.location, required this.flag, required this.url});

  Future<void> getTime() async {
    try {
      Response response =
          await get(Uri.parse("http://worldtimeapi.org/api/timezone/$url"));
      Map data = jsonDecode(response.body);
      // get properties from data
      String datetime = data['utc_datetime'];
      String offset = data['utc_offset'];
      DateTime now = DateTime.parse(datetime);
      if (offset.contains('-')) {
        now = now.subtract(Duration(hours: int.parse(offset.substring(1, 3))));
      } else {
        now = now.add(Duration(hours: int.parse(offset.substring(1, 3))));
      }

      // set time property;
      isDaytime = now.hour > 6 && now.hour < 20 ? true : false;
      time = DateFormat.jm().format(now);
    } catch (e) {
      time = "Couldn't get time data";
    }
  }
}
