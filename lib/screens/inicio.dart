import 'package:braille_app/screens/alfabeto.dart';
import 'package:braille_app/screens/convertir.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../widgets/appbar.dart';

class Inicio extends StatelessWidget {
  const Inicio({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color(0xFFFFFBE1),
    appBar: AppBarE(
          title: "EDUSEA",
          backgroundColor: const Color(0xFFFDBF00),
          titleSize: 18.0,
          titleColor: const Color.fromARGB(168, 255, 255, 255),),
    body: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18),
        child: Column(children: [
          //imagen
          const SizedBox(height: 20,),
          Center(child: Image.asset("assets/images/lapiz.png",height: 100,width: 100,)),
          const SizedBox(height: 5,),          
          GestureDetector(
            onTap:(){
              print('Screen width: ${size.width}, height: ${size.height}');
            },
            child: Text("¿Qué es el Braille?",style: GoogleFonts.mukta(fontWeight: FontWeight.w800, fontSize: 33))),
          const Padding(padding: EdgeInsets.only(top:5),
            child: Text("El Braille es un sistema de escritura táctil\n creado para personas ciegas. El Braille es\n esencial para la educación y \ncomunicación de personas con \ndiscapacidad visual, y ha evolucionado\n con la tecnología, incluyendo el Braille\n digital. Ofrece acceso a información escrita\n y autonomía.", textAlign: TextAlign.center,style: TextStyle(fontSize: 18),),
          ),
          //opciones
          Padding(
            padding: const EdgeInsets.only(top:8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
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
                      child: Container(width: 150,height: 150,
                             decoration: const BoxDecoration(
                                color: Color.fromARGB(97, 204, 108, 230),
                                borderRadius: BorderRadius.all(Radius.circular(10),),),
                              child: Center(
                                child: Image.network("https://cdn.pixabay.com/photo/2012/04/26/13/52/abc-42518_1280.png", height: 100, width: 100,),
                    ),),),
                Text("Alfabeto",style: GoogleFonts.mukta(fontWeight:FontWeight.w700, fontSize: 18),)
                  ],
                ),
                const SizedBox(width: 40,),
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
                      Container(width: 150,height: 150,
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(97, 204, 108, 230),
                              borderRadius: BorderRadius.all(Radius.circular(10),),),
                    child: Center(
                      child: Image.network("https://cdn-icons-png.flaticon.com/512/50/50446.png", height: 100, width: 100, scale: 0.5,),
                    ),
                  ),
                  Text("Convertir",style: GoogleFonts.mukta(fontWeight:FontWeight.w700, fontSize: 18),),
                  
                    ],
                  ),
                  
                ),
               
              ],
            ),
          ),
          SizedBox(height: 50,),
        ]
       
        ),
      ),
      
    ),
    );
  }
}