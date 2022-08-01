import 'package:anical/constants/routes.dart';
import 'package:anical/views/mikrogramm_view.dart';
import 'package:anical/views/milligramm_view.dart';
import 'package:anical/views/result_view.dart';
import 'package:anical/views/start_view.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
      routes: {
        homeRoute: (context) => const HomePage(),
        milligrammRoute: (context) => const MilligrammView(),
        mikrogrammRoute: (context) => const MikrogrammView(),
        resultRoute: (context) => const ResultView(
              result: resultRoute,
              valueNameOne: resultRoute,
              valueNameTwo: resultRoute,
            ),
      },
    ),
  );
}
