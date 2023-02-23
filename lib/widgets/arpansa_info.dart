//apransa_info.dart
//Shows the ARPANSA disclaimer at the bottom of the sceren and allows
//user to read the full disclaimer by pressing the Disclaimer button

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:live_uv_australia/constants/colors.dart';
import 'dart:core';

import '../constants/app.dart';

class ARPANSAModule extends ConsumerWidget {
  const ARPANSAModule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: LiveUVLayout.margin, vertical: 0),
          child: Text(
            'UV observations courtesy of ARPANSA',
            style: Theme.of(context).textTheme.labelLarge!.copyWith(
                color: LiveUVColor.mediumGrey, fontWeight: FontWeight.w400),
            textAlign: TextAlign.center,
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: LiveUVLayout.margin, vertical: 8.0),
          child: InkWell(
            key: const Key('arpansaInfo_disclaimerButton'),
            onTap: () {
              showModalBottomSheet(
                  context: context,
                  builder: (BuildContext context) {
                    return Container(
                      padding: EdgeInsets.all(
                        LiveUVLayout.margin,
                      ),
                      // height: 290,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.only(bottom: LiveUVSpacing.sp4),
                            child: Text(
                              'Disclaimer',
                              style: Theme.of(context)
                                  .textTheme
                                  .displayLarge!
                                  .copyWith(
                                      fontSize: 17.0,
                                      fontWeight: FontWeight.w600,
                                      color: const Color(0xff252729)),
                            ),
                          ),
                          const Divider(
                            height: 5,
                            thickness: 3,
                            color: Color(0xffF5F6F7),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                top: LiveUVSpacing.sp4,
                                bottom: LiveUVSpacing.sp4),
                            child: Text(
                              'ARPANSA and this app does not accept any liability for any injury, loss, damage or costs incurred, or any consequences resulting direclty or indirectly by use of or reliance on the information shown above.',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
                                      fontSize: 17.0,
                                      fontWeight: FontWeight.w400,
                                      color: const Color(0xff252729)),
                            ),
                          ),
                        ],
                      ),
                    );
                  });
            },
            child: Container(
              decoration: BoxDecoration(
                  border: Border.all(
                    color: LiveUVColor.mediumGrey,
                    width: 2,
                  ),
                  borderRadius: const BorderRadius.all(Radius.circular(20))),
              padding:
                  const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
              child: Text(
                'Disclaimer',
                style: Theme.of(context).textTheme.labelSmall!.copyWith(
                      color: LiveUVColor.mediumGrey,
                      fontWeight: FontWeight.w600,
                    ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
