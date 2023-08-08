
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:network_image_mock/network_image_mock.dart';
import 'package:nymble_app/src/binding/app_binding.dart';
import 'package:nymble_app/src/screens/home_screen/view/home_screen_view.dart';
import 'package:nymble_app/src/themes/themes.dart';

void main() {
  testWidgets('home screen view vital widgets', (WidgetTester tester) async {
    //Arrage
    final carousal = find.byKey(const Key('carousalWidget'));
    final circularCard = find.byKey(const Key('circularCard'));
    final squareCard = find.byKey(const Key('squareCardWidget'));
    final squareCardBuilder = find.byKey(const Key('squareCardBuilder'));
    final circularCardBuilder = find.byKey(const Key('circularCardBuilder'));

    //Act
  await mockNetworkImagesFor(() async => await tester.pumpWidget(GetMaterialApp(
        initialBinding: AppBinding(),
        theme: Themes().lightTheme,
        darkTheme: Themes().darkTheme,
        home: const HomeScreenView())));
    await tester.pump();

    //Assert
    expect(find.byType(Image), findsOneWidget);
    expect(find.text('Welcome onBoard'), findsOneWidget);
    expect(carousal, findsOneWidget);
    expect(squareCardBuilder, findsWidgets);
    expect(circularCard, findsWidgets);
    expect(squareCard, findsWidgets);
    expect(circularCardBuilder, findsWidgets);
  });
}

