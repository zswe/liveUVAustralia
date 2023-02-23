import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:live_uv_australia/main.dart' as app;

//Integration test to validate the key functionanlity of the Live UV Australia
//application.
void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('Integration Test - Full', () {
    //Basic Integration Testing
    //Desired Outcome: Validate functionality of selecting a location, all components
    //display correctly on the screen, user can view the disclaimer
    testWidgets('Live UV Australia Basic Integration Test', (tester) async {
      app.main();

      //Initialise the app and provide time to load in data
      await tester.pumpAndSettle();
      await Future.delayed(const Duration(seconds: 5));
      await tester.pumpAndSettle();
      await Future.delayed(const Duration(seconds: 2));

      //Ensure all of the key elements have been retrieved into the app and are
      //visible
      expect(find.textContaining('Location'), findsOneWidget);
      expect(find.textContaining('Disclaimer'), findsOneWidget);
      expect(find.textContaining('Adelaide'), findsOneWidget);
      expect(find.textContaining('Refresh'), findsOneWidget);
      expect(find.textContaining('.'), findsOneWidget);
      expect(find.textContaining('Location'), findsOneWidget);

      //Define the key touch elements
      final disclaimerInkWell =
          find.byKey(const Key('arpansaInfo_disclaimerButton'));
      final venueSelectionDropDownButton =
          find.byKey(const Key('locationSelection_dropDownButton'));

      //Open the disclaimer bottom module and ensure we can read all of the text
      await tester.tap(disclaimerInkWell);
      await tester.pumpAndSettle();
      await Future.delayed(const Duration(seconds: 5));

      expect(find.textContaining('Disclaimer'), findsWidgets);
      expect(find.textContaining('ARPANSA and this'), findsOneWidget);
      expect(find.textContaining('information shown above.'), findsOneWidget);

      await tester.tapAt(const Offset(50, 50));
      await tester.pumpAndSettle();
      await Future.delayed(const Duration(seconds: 1));
      await tester.pumpAndSettle();

      //Tap on the Location Button, check that we can view the venues and then
      //select the Gold Coast item
      expect(find.textContaining('Location'), findsOneWidget);
      await tester.tap(venueSelectionDropDownButton);
      await tester.pumpAndSettle();
      await Future.delayed(const Duration(seconds: 2));
      await tester.pumpAndSettle();

      expect(find.textContaining('Gold Coast'), findsWidgets);

      final dropDownSelectedMenuItemGC = find
          .byKey(
            const Key('locationSelection_drowDownMenuItem_gco'),
          )
          .last;

      await tester.tap(dropDownSelectedMenuItemGC, warnIfMissed: false);
      await tester.pumpAndSettle();
      await Future.delayed(const Duration(seconds: 5));
    });
  });
}
