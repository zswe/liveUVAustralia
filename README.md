# Live UV Australia

Live UV Australia - Displays for users the live UV, sourced from ARPANSA (Australian Radiation Protection and Nuclear Safety Agency) for a range of locations around Australia. Please note that utilising the app when the sun is not above the horizon will lead to a result of 0.0.

## Functional Implementation

1. The live UV data is sourced from ARPANSA's website through a XML Data file which is updated continuously throughout the day (https://uvdata.arpansa.gov.au/xml/uvvalues.xml).
2. This data is received through a HTTP read, with the data then manipulated utilising the xml package from pub_dev
3. The XML data is transferred into a list of UVRating, a model which reflects the data provided in the XML
4. The user can select any of the locations retrieved from the HTTP call, with the UV rating shown and then associated level of UV exposure calculated based on the current UV level.
5. When a user selects a location this is stored locally utilising shared preferences so when the app is opened again it defaults to the last location selected.
6. As defined by the ARPANSA website a disclaimer is provided about the information.

## Technical Implementation

- File Structure:
    - Constants/Theming: lib/constants
    - Models: lib/models
    - Screens: lib/screens
    - State Variables: lib/state
    - Widgets: lib/widgets 
- State Management: State is handled utilising riverpod, with both a StateNotifierProvider for the UV data and StateProvider utilised. These providers are located in lib/state/provider.dart. Given the relative simplicity of the project state is handled in a single location rather than broken into different modules.
- Local Storage: The LocationID of the user's last selected location is stored utilising Shared Preferences.
- Theming: All theming, including common spacing, colors and the definition of the overall theme are located in the lib/constants folder.
- Data Handling: Data is read in utilising a HTTP read, then processed utilising the xml package.
- Icons/Spalsh: flutter_icons and flutter_native_splash are utilised to handle the (very simple) app icon and splash screen.
- Testing: A basic Integration Test has been written in the integration_test folder.
- Graphics Engine: Impeller is enabled on iOS.


## Versioning & Platform Management:

App was last tested on 23rd February 2023 utilising:
- Flutter 3.7.5 (stable)
- Dart 2.19.2
- MacOS 12.4

Platform Testing and Validation:
- Android: CPH2333 - Oppo A96 (ColorOS 13.0, Android 13)
- iOS: iPhone SE 2020 (iOS 16.1.1)



Zachary Sweeney
23rd Feb 2023
