import 'package:calculator/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets("Multiply one digit number", (WidgetTester tester) async {
    // // Build our app and trigger a frame.
    await tester.pumpWidget(MaterialApp(
      home: HomePage(name: "Kan Ouivirach"),
    ));

    // tester.pump(); // ใช้กับ widget ที่มี animation
    // tester.pumpAndSettle(); // ใช้กับ widget ที่ไม่มี animation

    // เหมือนเราใส่ attribute key เพิ่มใน HTML เพื่อให้หา element เจอ
    final button7 = find.byKey(const Key("button-7"));
    expect(button7, findsOneWidget);

    // // Verify that our counter starts at 0.
    // expect(find.text('0'), findsOneWidget);
    // expect(find.text('1'), findsNothing);

    // // Tap the '+' icon and trigger a frame.
    // await tester.tap(find.byIcon(Icons.add));
    // await tester.pump();

    // // Verify that our counter has incremented.
    // expect(find.text('0'), findsNothing);
    // expect(find.text('1'), findsOneWidget);
  });
}
