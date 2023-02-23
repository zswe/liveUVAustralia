//notifier.dart
//Handles all of the key state based logic and business logic throughout the application.
//This includes retrieving the UV Data, determining the UV category and colours
//for widget components.

import 'package:flutter/material.dart';
import 'dart:core';

import 'package:http/http.dart' as http;
import 'package:live_uv_australia/constants/colors.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:xml/xml.dart';

import '../models/uv_rating.dart';

//Retrieve the UV data from the XML data file through HTTP read call. This function
//is called from StateNotifierProvider
Future<List<UVRating>> retrieveUVData() async {
  //To handle offline persistence, specifically with the dropdown always include an empty UV Rating
  List<UVRating> returnList = [returnEmptyUVRating()];
  var url = Uri.https('uvdata.arpansa.gov.au', '/xml/uvvalues.xml');
  try {
    await http.read(url).then(
      (value) {
        final document = XmlDocument.parse(value);
        final locations =
            document.findElements('stations').first.findElements('location');
        for (final location in locations) {
          returnList.add(uvRatingFromXML(location));
        }
      },
    );
  } catch (e) {
    debugPrint('No data was retrieved from HTTP call');
  }
  return returnList;
}

//Based on the input UV determine what level of UV the current venue has
String uvRatingLevelString(double value) {
  if (value < 2.5) {
    return 'Low';
  } else if (value < 5.5) {
    return 'Moderate';
  } else if (value < 7.5) {
    return 'High';
  } else if (value < 10.5) {
    return 'Very High';
  } else {
    return 'Extreme';
  }
}

//Based on the input UV determine what colour should be returned in the display
//widgets
Color uvRatingLevelColor(double value) {
  if (value < 2.5) {
    return LiveUVColor.lowUV;
  } else if (value < 5.5) {
    return LiveUVColor.moderateUV;
  } else if (value < 7.5) {
    return LiveUVColor.highUV;
  } else if (value < 10.5) {
    return LiveUVColor.veryHighUV;
  } else {
    return LiveUVColor.extremeUV;
  }
}

//Update the location preferences based on which venue the user has last selected
void updateLocationPreferences(String location) async {
  final prefs = await SharedPreferences.getInstance();
  prefs.setString('lastLocation', location);
}
