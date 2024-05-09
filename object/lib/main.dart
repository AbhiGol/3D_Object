import 'dart:math';

import 'package:flutter/material.dart';
import 'package:object/final.dart';
import 'package:object/home.dart';
import 'package:object/test.dart';
import 'package:object/test1.dart';
import 'package:object/test2.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const Center(child: Final()));
  }
}
