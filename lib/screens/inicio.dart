import 'package:braille_app/screens/alfabeto.dart';
import 'package:braille_app/screens/convertir.dart';
import 'package:flutter/material.dart';

class Inicio extends StatelessWidget {
  const Inicio({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(
      backgroundColor: Color(0xFFFDBF00)
    ),
    body: Padding(
      padding: const EdgeInsets.all(15),
      child: Column(children: [
        //imagen
        SizedBox(height: 20,),
        Center(child: Image.asset("assets/images/lapiz.png",height: 100,
                  width: 100,)),
        SizedBox(height: 10,),          
        //titulo
        Text("¿Qué es el Braille?",style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 30),),
        //parrafo
        SizedBox(height: 10,),
        Padding(
          padding: const EdgeInsets.all(15),
          child: Text("El Braille es un sistema de escritura táctil creado para personas ciegas. El Braille es esencial para la educación y comunicación de personas con discapacidad visual, y ha evolucionado con la tecnología, incluyendo el Braille digital. Ofrece acceso a información escrita y autonomía.", textAlign: TextAlign.center,style: TextStyle(fontSize: 20),),
        ),
        //opciones
        Padding(
          padding: const EdgeInsets.all(25),
          child: Row(
            children: [
              Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const AlfabetoPg()),
                            );
                    },
                    child: Container(
                                  width: 150,
                                  height: 150,
                                  decoration: BoxDecoration(
                    color: Color.fromARGB(221, 223, 163, 240),
                            borderRadius: BorderRadius.all(Radius.circular(10),),),
                                  child: Center(
                    child: Image.network("https://cdn.pixabay.com/photo/2012/04/26/13/52/abc-42518_1280.png", height: 100, width: 100,),
                                  ),
                                ),
                  ),
              Text("Alfabeto")
                ],
              ),
              SizedBox(width: 50,),
              GestureDetector(
                onTap: (){
                  Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const ConvertirPg()),
                            );
                },
                child: Column(
                  children: [
                    Container(
                  width: 150,
                  height: 150,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(221, 223, 163, 240),
                            borderRadius: BorderRadius.all(Radius.circular(10),),),
                  child: Center(
                    child: Image.network("https://cdn-icons-png.flaticon.com/512/50/50446.png", height: 100, width: 100,),
                  ),
                ),
                Text("Convertidor")
                  ],
                ),
              ),
            ],
          ),
        ),
        
      ]),
    ),
    );
  }
}