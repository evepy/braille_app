import 'package:flutter/material.dart';

class DetalleA extends StatelessWidget {
  final String imageUrl;

  DetalleA({required this.imageUrl});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
              backgroundColor: const Color(0xFFFDBF00),
              title: const Align(alignment: Alignment.centerRight,
              child: Text("EDUSEA"),),
            ),
        body: Center(
          child: Image.network(imageUrl),
        ),
    );
  }
}