// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:myfirstapp/main.dart'; // assuming main.dart exports MyApp and HomePageWidget

void main() {
  testWidgets('HomePageWidget renders all expected elements', (
    WidgetTester tester,
  ) async {
    // Build widget inside MaterialApp for context
    await tester.pumpWidget(const MaterialApp(home: HomePageWidget()));

    await tester.pumpAndSettle();

    // ✅ Image is present
    expect(find.byType(Image), findsOneWidget);

    // ✅ Title text
    expect(
      find.text('Log in to track and respond to emergencies'),
      findsOneWidget,
    );

    // ✅ Labels
    expect(find.text('Agency Login Name:'), findsOneWidget);
    expect(find.text('Email:'), findsOneWidget);
    expect(find.text('Password:'), findsOneWidget);

    // ✅ Dropdown hint
    expect(find.text('Select agency name'), findsOneWidget);

    // ✅ Email field
    expect(
      find.widgetWithText(TextFormField, 'Write your Email'),
      findsOneWidget,
    );

    // ✅ Password field
    expect(
      find.widgetWithText(TextFormField, 'Write Your Password'),
      findsOneWidget,
    );

    // ✅ Buttons
    expect(find.widgetWithText(ElevatedButton, 'Log In'), findsOneWidget);
    expect(
      find.widgetWithText(ElevatedButton, 'Cant Sign in?'),
      findsOneWidget,
    );
  });
}
