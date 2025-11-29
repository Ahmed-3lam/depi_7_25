// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:depi_7_25/counter/bloc/bloc/counter_bloc.dart';
import 'package:depi_7_25/counter/counter_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Counter increments smoke test', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: BlocProvider(
          create: (context) => CounterBloc(),
          child: CounterScreen(),
        ),
      ),
    );

    await tester.tap(find.byKey(Key("FloatinBtn")));
    await tester.pump();

    await tester.tap(find.byKey(Key("FloatinBtn")));
    await tester.pump();
    expect(find.text("2"), findsOneWidget);
  });
}
