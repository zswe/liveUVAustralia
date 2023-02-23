//main.dart
//Main file for initialisation of the app, establishment of ProviderScope
//and of navigatino routes.

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:live_uv_australia/constants/themes.dart';
import 'package:live_uv_australia/screens/splash_screen.dart';
import 'package:live_uv_australia/screens/uv_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const ProviderScope(child: LiveUVApp()));
}

class LiveUVApp extends StatelessWidget {
  const LiveUVApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Live UV Australia',
      initialRoute: '/splashScreen',
      routes: {
        '/uvScreen': (context) => const UVScreen(),
        '/splashScreen': (context) => const SplashScreen(),
      },
      theme: LiveUVThemes.liveUVLight,
    );
  }
}
