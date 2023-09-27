import 'package:flutter/material.dart';

class DetalleA extends StatelessWidget {
  const DetalleA({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
              backgroundColor: const Color(0xFFFDBF00),
              title: const Align(alignment: Alignment.centerRight,
              child: Text("EDUSEA"),),
            ),
        body: Center(
          child: Image.network("https://res.cloudinary.com/drx46bxzy/image/upload/v1695824932/braille/Proyecto_nuevo_pocfnf.webp"),
        ),
    );
  }
}