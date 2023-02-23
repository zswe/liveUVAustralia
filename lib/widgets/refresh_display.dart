//refresh_display.dart
//Inkwell which allows the user to refresh the data currently displayed on the screen,
//loading indicator is displayed as this occurs managed through the StateProvider

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:live_uv_australia/constants/colors.dart';
import 'package:live_uv_australia/state/provider.dart';
import 'dart:core';

import '../constants/app.dart';

class RefreshDisplayModule extends ConsumerWidget {
  const RefreshDisplayModule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool refreshLoadingIndicator = ref.watch(uvScreenLoadingIndicatorState);

    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: LiveUVLayout.margin, vertical: LiveUVLayout.margin),
      child: InkWell(
        onTap: () {
          ref.read(uvScreenLoadingIndicatorState.notifier).state = true;
          ref.watch(uvDataProvider.notifier).fetch().then((value) {
            ref.read(uvScreenLoadingIndicatorState.notifier).state = false;

            //If we receive back a false value it means we weren't able to retrieve any locations
            //so update the location to be the default blank location
            if (!value) {
              ref.read(selectedLocationIDState.notifier).state = '-';
            }
          });
        },
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (refreshLoadingIndicator)
              Container(
                  padding: const EdgeInsets.only(top: 4.0),
                  width: LiveUVIconSizes.sm,
                  height: LiveUVIconSizes.sm,
                  child: const CircularProgressIndicator(
                    strokeWidth: 2,
                  )),
            if (!refreshLoadingIndicator)
              Container(
                padding: const EdgeInsets.only(top: 4.0),
                child: Icon(
                  Icons.refresh,
                  size: LiveUVIconSizes.sm,
                ),
              ),
            SizedBox(
              width: LiveUVSpacing.sp2,
            ),
            if (!refreshLoadingIndicator)
              Text(
                'Refresh',
                style: Theme.of(context)
                    .textTheme
                    .displaySmall!
                    .copyWith(color: LiveUVColor.primaryFull),
              ),
          ],
        ),
      ),
    );
  }
}
