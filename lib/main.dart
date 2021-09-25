import 'package:budget_tracker_ui/pages/root_app.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:budget_tracker_ui/providers/counter.dart';

void main() {
  runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: Counter(),
        ),
      ],

    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      home: RootApp(),
    ),
  ));
}
