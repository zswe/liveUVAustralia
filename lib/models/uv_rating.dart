//uv_rating.dart
//Defines the UVRating model which aligns to the data structure available through
//the ARPANSA XML Data File

import 'package:xml/xml.dart';

class UVRating {
  String id;
  String displayName;
  double uvReading;
  String time;
  String date;
  String fullDate;
  String utcDate;
  String status;

  UVRating(
      {required this.displayName,
      required this.id,
      required this.uvReading,
      required this.time,
      required this.date,
      required this.fullDate,
      required this.utcDate,
      required this.status});

  UVRating.returnEmptyUVRating()
      : id = '-',
        displayName = '-',
        uvReading = 0.0,
        time = '',
        date = '',
        fullDate = '',
        utcDate = '',
        status = '';

  //
  factory UVRating.uvRatingFromXML(data) {
    XmlElement location = data;
    String displayName = location.attributes.toString();
    displayName = displayName.substring(5, displayName.length - 2);
    return UVRating(
      id: location.findElements('name').first.text,
      displayName: displayName,
      uvReading: double.parse(location.findElements('index').first.text),
      time: location.findElements('time').first.text,
      date: location.findElements('date').first.text,
      fullDate: location.findElements('fulldate').first.text,
      utcDate: location.findElements('utcdatetime').first.text,
      status: location.findElements('status').first.text,
    );
  }
}
