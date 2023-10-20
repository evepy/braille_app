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
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                child: TextFormField(
        decoration: InputDecoration(
          fillColor: Colors.white,
          filled: true,
          contentPadding: EdgeInsets.all(27),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.white,
              width: 3
            ),
            borderRadius: BorderRadius.circular(10),
          ), 
          
        ),
      ),
              ),
            ),
            SizedBox(height: 20,),
            Text("Texto en Braille:", style: TextStyle(fontFamily: 'Braille'),),
            TextFormField(
        decoration: InputDecoration(
          fillColor: Colors.white,
          filled: true,
          contentPadding: EdgeInsets.all(27),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.white,
              width: 3
            ),
            borderRadius: BorderRadius.circular(10),
          ), 
          
        ),
      ),
          ],
        )
    );
  }
}