import 'package:flutter/material.dart';
import 'package:object/test2.dart';
import 'package:simple_3d/simple_3d.dart';
import 'package:simple_3d_renderer/simple_3d_renderer.dart';
import 'package:util_simple_3d/util_simple_3d.dart';

class Final extends StatefulWidget {
  const Final({super.key});

  @override
  State<Final> createState() => _FinalState();
}

class _FinalState extends State<Final> {
  String shape = "cube";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            alignment: Alignment.topRight,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                DropdownButton(
                    value: shape,
                    items: const [
                      DropdownMenuItem(value: "cube", child: Text("cube")),
                      DropdownMenuItem(
                          value: "capsule", child: Text("capsule")),
                      DropdownMenuItem(value: "cone", child: Text("cone")),
                      DropdownMenuItem(value: "circle", child: Text("circle")),
                      DropdownMenuItem(value: "pillar", child: Text("pillar")),
                    ],
                    onChanged: (value) {
                      setState(() {
                        shape = value!;
                      });
                    })
              ],
            ),
          ),
          Sp3dRenderer(
            const Size(400, 400),
            const Sp3dV2D(200, 300),
            shapebuilder(shape),
            Sp3dCamera(Sp3dV3D(0, 0, 3000), 6000),
            Sp3dLight(Sp3dV3D(0, 0, -1), syncCam: true),
          ),
        ],
      ),
    );
  }

  Sp3dWorld shapebuilder(String shape) {
    if (shape == "capsule") {
      return Sp3dWorld([UtilSp3dGeometry.capsule(50, 160)]);
      //}else if (shape == "circle") {
      //return Sp3dWorld([UtilSp3dGeometry.circle(100)]);
    } else if (shape == "cone") {
      return Sp3dWorld([UtilSp3dGeometry.cone(50, 100)]);
    } else if (shape == "cube") {
      return Sp3dWorld([UtilSp3dGeometry.cube(100, 100, 100, 1, 1, 1)]);
    } else if (shape == "pillar") {
      return Sp3dWorld([UtilSp3dGeometry.pillar(50, 50, 150)]);
    } else if (shape == "circle") {
      return Sp3dWorld([UtilSp3dGeometry.sphere(100)]);
    } else {
      return Sp3dWorld([UtilSp3dGeometry.tile(100, 50, 40, 20)]);
    }
  }
}
