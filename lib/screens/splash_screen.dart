//splash_screen.dart
//Initial screen when we open the project, handles the retrieval of data and
//accessing existing shared preferences data. Stateful implemenation to manage
//the initialisation sequence, especially if future implementations such as
//authentication may take place.

import 'package:flutter/material.dart';
import 'dart:core';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../constants/colors.dart';
import '../state/provider.dart';

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({
    Key? key,
  }) : super(key: key);

  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends ConsumerState<SplashScreen>
    with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      initialiseVariables()
          .then((value) => Navigator.of(context).pushNamed('/uvScreen'));
    });
  }

  //Initialise variales and retrieve data from the XML file
  Future<bool> initialiseVariables() async {
    await ref.watch(uvDataProvider.notifier).fetch().then((value) async {
      final prefs = await SharedPreferences.getInstance();
      String previousLocation = prefs.getString('lastLocation') ?? '';
      if (previousLocation != '') {
        ref.read(selectedLocationIDState.notifier).state = previousLocation;
      }

      //If we haven't returned any locations then don't set a dropdown value
      if (!value) {
        ref.read(selectedLocationIDState.notifier).state = '-';
      }
    });
    return true;
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: LiveUVColor.primaryFull,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(8.0),
                  bottomLeft: Radius.circular(8.0),
                  topRight: Radius.circular(8.0),
                  bottomRight: Radius.circular(8.0),
                ),
                child: Container(
                  padding: EdgeInsets.zero,
                  height: 128,
                  width: 128,
                  child: Image.asset(
                    'assets/icons/live_uv_icon.png',
                    height: 128,
                    width: 128,
                    fit: BoxFit.cover,
                    errorBuilder: (BuildContext context, Object exception,
                        StackTrace? stackTrace) {
                      return const SizedBox(
                        height: 72,
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
