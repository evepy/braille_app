import 'package:flutter/material.dart';

class ConvertirPg extends StatefulWidget {
  const ConvertirPg({super.key});

  @override
  State<ConvertirPg> createState() => _ConvertirPgState();
}

class _ConvertirPgState extends State<ConvertirPg> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
              backgroundColor: Color(0xFFFDBF00),
              title: Align(alignment: Alignment.centerRight,
              child: Text("EDUSEA"),),),
        body:Column(
          children: [
            Text("Convertir"),
            SizedBox(height: 30,),
            Text("Texto:"),
            TextFormField(
              maxLines: 6,
            ),
            SizedBox(height: 20,),
            Text("Texto en Braille:"),
            TextFormField(
              decoration: InputDecoration(
                fillColor: Colors.white
              ),
            )
          ],
        )
    );
  }
}