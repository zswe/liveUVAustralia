//uv_screen.dart
//The core screen of the initial stage of the application. Allows a user to select
//a venue, view the latest UV reading and read the disclaimer. A series of Modules
//are used for the key visual components, as available in the widgets folder.

//Import flutter packages
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:live_uv_australia/widgets/location_selection.dart';
import 'package:live_uv_australia/widgets/refresh_display.dart';
import 'package:live_uv_australia/widgets/uv_display.dart';
import 'dart:core';

import '../constants/app.dart';
import '../widgets/arpansa_info.dart';

class UVScreen extends ConsumerWidget {
  const UVScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.only(
              left: LiveUVLayout.margin,
              right: LiveUVLayout.margin,
              top: LiveUVLayout.verticalMargin,
              bottom: LiveUVLayout.verticalMargin),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(bottom: LiveUVSpacing.sp2),
                child: Text(
                  'Location',
                  style: Theme.of(context).textTheme.displayMedium,
                ),
              ),
              const LocationSelectionModule(),
              const UVDisplayModule(),
              const RefreshDisplayModule(),
              const Expanded(
                child: SizedBox(),
              ),
              const ARPANSAModule(),
            ],
          ),
        ),
      ),
    );
  }
}
