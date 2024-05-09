import 'package:flutter/material.dart';
import 'package:flutter_cube/flutter_cube.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late Object jet;
  @override
  void initState() {
    jet = Object(fileName: "assets/Elephant/Elephant.obj");
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
            scene.camera.zoom = 10;
          },
        ),
      ),
    );
  }
}
