//provider.dart
//Handles all of the key State Provider definitions throughout the application
//and handles updates to this state throughout the application

import 'dart:core';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/uv_rating.dart';
import 'notifier.dart';

//uvDataProvider is the StateNotifierProvider which stores all of the location UV data
//selected as a StateNotifierProvider as it could be updated frequently in the application
//through user input and also doesn't rely on a WidgetRef to update value
final uvDataProvider =
    StateNotifierProvider<UVDataListNotifier, List<UVRating>>((ref) {
  return UVDataListNotifier(ref);
});

//State Notifier which holds the list of Location Data
class UVDataListNotifier extends StateNotifier<List<UVRating>> {
  UVDataListNotifier(ref) : super([]);

  //Fetch the UV Data from the notifier function, return back an array with no location
  //information is updated. Otherwise update the state. Future bool returned to notify
  //when the loading has been completed.
  Future<bool> fetch() async {
    bool returnValue = false;
    await retrieveUVData().then((value) {
      //If we only returned the blank object then update state but not the return value
      if (value.length == 1) {
        state = value;
      } else {
        state = value;
        returnValue = true;
      }
    });

    return returnValue;
  }

  //Access the ListNotifier state to return back information relating to the currently selected
  //venue. Function is stored within the StateNotifier rather than a separate StateProvider so there isn't
  //a need to update the current venue when a refresh occurs.
  UVRating selectedVenue(String selectedID) {
    int index = state.indexWhere((element) {
      if (element.id == selectedID) {
        return true;
      } else {
        return false;
      }
    });
    return state.elementAt(index);
  }
}

//Store the currently selected venue
final selectedLocationIDState = StateProvider<String>(
  (ref) => 'adl',
);

//Boolean flag for when a refresh event is occurring
final uvScreenLoadingIndicatorState = StateProvider<bool>(
  (ref) => false,
);
