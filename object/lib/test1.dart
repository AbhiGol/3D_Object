import 'package:flutter/material.dart';
import 'package:cubixd/cubixd.dart';

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedCubixD(
        shadow: false,
        onSelected: ((SelectedSide opt) =>
            opt == SelectedSide.bottom ? true : false),
        size: 200.0,
        left: Container(
          decoration: const BoxDecoration(color: Colors.red),
        ),
        front: Container(
          decoration: const BoxDecoration(color: Colors.green),
        ),
        back: Container(  
          decoration: const BoxDecoration(color: Colors.yellow),
        ),
        top: Container(
          decoration: const BoxDecoration(color: Colors.blue),
        ),
        bottom: Container(
          decoration: const BoxDecoration(color: Colors.blueAccent),
        ),
        right: Container(
          decoration: const BoxDecoration(color: Colors.amber),
        ),
        
      ),
    );
  }
}
