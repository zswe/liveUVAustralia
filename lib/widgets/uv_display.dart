//uv_display.dart
//Visual display of the current UV Level and it's category as shown on the uv_screen

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:live_uv_australia/state/provider.dart';
import 'dart:core';

import '../constants/app.dart';
import '../models/uv_rating.dart';
import '../state/notifier.dart';

class UVDisplayModule extends ConsumerWidget {
  const UVDisplayModule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    String selectedValue = ref.watch(selectedLocationIDState);

    UVRating currentVenue = ref
        .watch(uvDataProvider)
        .where((element) => element.id == selectedValue)
        .first;

    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: LiveUVLayout.margin,
              vertical: LiveUVLayout.margin * 2),
          child: Center(
            child: Container(
              height: MediaQuery.of(context).size.height / 4,
              width: MediaQuery.of(context).size.height / 4,
              decoration: BoxDecoration(
                color: uvRatingLevelColor(currentVenue.uvReading),
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Text(
                  currentVenue.uvReading.toString(),
                  style: Theme.of(context)
                      .textTheme
                      .displayLarge!
                      .copyWith(color: Colors.white),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: LiveUVLayout.margin, vertical: 0.0),
          child: Text(
            uvRatingLevelString(currentVenue.uvReading),
            style: Theme.of(context)
                .textTheme
                .displayLarge!
                .copyWith(color: uvRatingLevelColor(currentVenue.uvReading)),
          ),
        ),
      ],
    );
  }
}
