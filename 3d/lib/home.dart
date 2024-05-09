import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cube/flutter_cube.dart';
import 'package:flutter_tilt/flutter_tilt.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late Object jet;
  @override
  void initState() {
    jet = Object(fileName: "/Tractor/Tractor.obj");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Cube(
          onSceneCreated: (Scene scene) {
            scene.world.add(jet);
            scene.camera.zoom = 8;
          },
        ),
      ),
    );
  }
}
