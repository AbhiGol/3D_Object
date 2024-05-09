import 'package:flutter/material.dart';
import 'package:flutter_cube/flutter_cube.dart';

class DrawLineScreen extends StatefulWidget {
  const DrawLineScreen({super.key});

  @override
  _DrawLineScreenState createState() => _DrawLineScreenState();
}

class _DrawLineScreenState extends State<DrawLineScreen> {
  final List<Offset> _points = [];
  final List<List<Offset>> _lines = [];
  late Object jet;
  @override
  void initState() {
    jet = Object(fileName: "assets/Elephant/Elephant.obj");
    super.initState();
  }

  void _addPoint(Offset point) {
    setState(() {
      _points.add(point);
      if (_points.length == 2) {
        _lines.add(List.from(_points));
        _points.clear();
      }
    });
  }

  void _addPoint1(Offset point) {
    setState(() {
      _points.add(point);
      if (_points.length == 2) {
        _lines.add(List.from(_points));
        _points.clear();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Draw Line Example'),
      ),
      body: Center(
        child: Container(
          child: GestureDetector(
            onTapDown: (TapDownDetails details) {
              _addPoint(details.localPosition);
            },
            child: CustomPaint(
              painter: LinePainter(lines: _lines, currentPoints: _points),
              child: Cube(
                onSceneCreated: (Scene scene) {
                  scene.world.add(jet);

                  scene.camera.zoom = 10;
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class LinePainter extends CustomPainter {
  List<List<Offset>> lines;
  List<Offset> currentPoints;

  LinePainter({required this.lines, required this.currentPoints});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.black
      ..strokeWidth = 3.0;

    for (final line in lines) {
      canvas.drawLine(line[0], line[1], paint);
    }

    if (currentPoints.length == 2) {
      canvas.drawLine(currentPoints[0], currentPoints[1], paint);
    }
  }

  @override
  bool shouldRepaint(LinePainter oldDelegate) => true;
}
