//location_selection.dart
//Allows user to view the currently selected venue as well as selecting a new
//venue based on the venue list currently in the uvDataProvider.

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:live_uv_australia/constants/colors.dart';
import 'package:live_uv_australia/state/provider.dart';
import 'dart:core';

import '../constants/app.dart';
import '../state/notifier.dart';

class LocationSelectionModule extends ConsumerWidget {
  const LocationSelectionModule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    String selectedValue = ref.watch(selectedLocationIDState);

    return Container(
      padding: EdgeInsets.symmetric(
          vertical: LiveUVSpacing.sp2, horizontal: LiveUVSpacing.sp4),
      margin: EdgeInsets.symmetric(horizontal: LiveUVSpacing.sp8),
      decoration: BoxDecoration(
          border: Border.all(
            color: LiveUVColor.primaryFull,
            width: 2,
          ),
          borderRadius: const BorderRadius.all(Radius.circular(20))),
      child: DropdownButton(
          key: const Key('locationSelection_dropDownButton'),
          borderRadius: BorderRadius.circular(LiveUVBorderRadius.roundedxl),
          elevation: 24,
          iconSize: 32,
          isExpanded: true,
          underline: const SizedBox(),
          dropdownColor: LiveUVColor.lightGrey,
          alignment: Alignment.center,
          style: Theme.of(context).textTheme.bodyLarge,
          items: ref.watch(uvDataProvider).map((e) {
            return DropdownMenuItem(
              key: Key('locationSelection_drowDownMenuItem_${e.id}'),
              value: e.id,
              child: Text(e.displayName),
            );
          }).toList(),
          value: ref.watch(uvDataProvider).length > 1 ? selectedValue : '-',
          onChanged: (valID) {
            if (valID != null) {
              ref.read(selectedLocationIDState.notifier).state = valID;
              updateLocationPreferences(valID);
            }
          }),
    );
  }
}
