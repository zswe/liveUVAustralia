//themes.dart
//Defines the ThemeData for the application, including primary colour, text themes

import 'package:flutter/material.dart';

import 'colors.dart';
import 'app.dart';

class LiveUVThemes {
  static ThemeData get liveUVLight {
    return ThemeData(
      primaryColor: LiveUVColor.primaryFull,
      colorScheme: ColorScheme.light(
        primary: LiveUVColor.primaryFull,
      ),
      fontFamily: '.SF UI Text',
      textTheme: TextTheme(
        displayLarge: TextStyle(
            fontSize: 36,
            color: LiveUVColor.darkGrey,
            height: 1.214285,
            fontWeight: FontWeight.w700,
            fontFamily: '.SF Pro Display'),
        displayMedium: TextStyle(
            fontSize: 24,
            color: LiveUVColor.darkGrey,
            height: 1.4,
            fontWeight: FontWeight.w700,
            fontFamily: '.SF Pro Text'),
        displaySmall: TextStyle(
            fontSize: 17,
            color: LiveUVColor.darkGrey,
            height: 1.4,
            fontWeight: FontWeight.w600,
            fontFamily: '.SF Pro Text'),
        bodyLarge: const TextStyle(
            fontSize: 17,
            color: Colors.black,
            height: 1.4,
            fontWeight: FontWeight.w400,
            fontFamily: '.SF Pro Display'),
        bodySmall: const TextStyle(
          fontSize: 13,
          color: Colors.black,
          height: 1.3846,
          fontWeight: FontWeight.w400,
        ),
        labelLarge: const TextStyle(
          fontSize: 14,
          color: Colors.white,
          fontWeight: FontWeight.normal,
          height: 1.3846,
        ),
        labelSmall: const TextStyle(
            fontSize: 12,
            color: Colors.white,
            fontWeight: FontWeight.normal,
            height: 1.3846,
            letterSpacing: 1),
      ),
      iconTheme: IconThemeData(
        color: LiveUVColor.primaryFull,
      ),
      appBarTheme: AppBarTheme(
        elevation: 0.0,
        backgroundColor: Colors.white,
        foregroundColor: LiveUVColor.lightGrey,
        titleTextStyle: TextStyle(
            color: Colors.black,
            fontSize: LiveUVFontSizes.sm,
            fontWeight: FontWeight.w500),
      ),
      scaffoldBackgroundColor: Colors.white,
      bottomSheetTheme: BottomSheetThemeData(
          modalBackgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(LiveUVBorderRadius.roundedxl),
                  topRight: Radius.circular(LiveUVBorderRadius.roundedxl)))),
      // elevatedButtonTheme: ElevatedButtonThemeData(
      //   style: ButtonStyle(
      //     fixedSize: MaterialStateProperty.resolveWith<Size?>((_) {
      //       return const Size(double.infinity, 56.0);
      //     }),
      //     elevation: MaterialStateProperty.all(0.0),
      //     shape: MaterialStateProperty.resolveWith<OutlinedBorder?>((_) {
      //       return RoundedRectangleBorder(
      //           borderRadius:
      //               BorderRadius.circular(LiveUVBorderRadius.roundedxl));
      //     }),
      //     backgroundColor: MaterialStateProperty.resolveWith<Color?>((states) {
      //       if (states.contains(MaterialState.disabled)) {
      //         return LiveUVColor.lightGrey;
      //       }
      //       return LiveUVColor.darkGrey;
      //     }),
      //     foregroundColor: MaterialStateProperty.resolveWith<Color?>((_) {
      //       return Colors.white;
      //     }),
      //     minimumSize: MaterialStateProperty.resolveWith<Size?>((_) {
      //       return const Size.fromHeight(56);
      //     }),
      //   ),
      // ),
      // textButtonTheme: TextButtonThemeData(
      //   style: TextButton.styleFrom(
      //     foregroundColor: Colors.white,
      //   ),
      // ),
      // inputDecorationTheme: InputDecorationTheme(
      //   border: OutlineInputBorder(
      //     borderRadius: BorderRadius.circular(LiveUVBorderRadius.roundedxl),
      //     borderSide: const BorderSide(
      //       width: 0,
      //       style: BorderStyle.none,
      //     ),
      //   ),
      //   filled: true,
      //   fillColor: LiveUVColor.lightGrey,
      //   hintStyle: TextStyle(
      //       color: LiveUVColor.lightGrey, fontSize: LiveUVFontSizes.lg),
      //   isDense: true,
      //   contentPadding: const EdgeInsets.only(left: 5),
      //   labelStyle: TextStyle(
      //       fontSize: LiveUVFontSizes.sm, color: LiveUVColor.darkGrey),
      //   helperStyle: TextStyle(
      //       fontSize: LiveUVFontSizes.sm, color: LiveUVColor.darkGrey),
      //   floatingLabelBehavior: FloatingLabelBehavior.never,
      //   focusedBorder: OutlineInputBorder(
      //       borderRadius: BorderRadius.circular(LiveUVBorderRadius.roundedxl),
      //       borderSide: BorderSide(width: 2, color: LiveUVColor.primaryFull)),
      //   errorBorder: OutlineInputBorder(
      //       borderRadius: BorderRadius.circular(LiveUVBorderRadius.roundedxl),
      //       borderSide: const BorderSide(width: 2, color: Colors.red)),
      // ),
      dividerTheme: DividerThemeData(
        color: LiveUVColor.lightGrey,
        endIndent: 0,
        indent: 0,
        thickness: 1.0,
      ),
      // tabBarTheme: TabBarTheme(
      //   labelColor: Colors.black,
      //   labelStyle: TextStyle(
      //       color: LiveUVColor.darkGrey,
      //       fontSize: LiveUVFontSizes.sm,
      //       fontWeight: FontWeight.w600),
      //   indicator: ShapeDecoration(
      //       shape: RoundedRectangleBorder(
      //           borderRadius:
      //               BorderRadius.circular(LiveUVBorderRadius.roundedxl)),
      //       color: LiveUVColor.lightGrey),
      //   indicatorSize: TabBarIndicatorSize.label,
      //   unselectedLabelStyle: TextStyle(
      //       color: LiveUVColor.darkGrey,
      //       fontSize: LiveUVFontSizes.sm,
      //       fontWeight: FontWeight.w600),
      // ),
      // bottomNavigationBarTheme: BottomNavigationBarThemeData(
      //   type: BottomNavigationBarType.fixed,
      //   elevation: 0,
      //   backgroundColor: LiveUVColor.lightGrey,
      //   selectedItemColor: LiveUVColor.darkGrey,
      //   selectedIconTheme:
      //       IconThemeData(size: 24.0, color: LiveUVColor.darkGrey),
      //   selectedLabelStyle: TextStyle(
      //       color: LiveUVColor.darkGrey,
      //       fontSize: 10.0,
      //       fontWeight: FontWeight.w500,
      //       height: 1.5),
      //   showUnselectedLabels: true,
      //   unselectedItemColor: LiveUVColor.mediumGrey,
      //   unselectedIconTheme:
      //       IconThemeData(size: 24.0, color: LiveUVColor.mediumGrey),
      //   unselectedLabelStyle: TextStyle(
      //       color: LiveUVColor.mediumGrey,
      //       fontSize: 10.0,
      //       fontWeight: FontWeight.w500,
      //       height: 1.5),
      // ),
    );
  }
}
