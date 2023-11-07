//import 'package:braille_app/screens/detallealf.dart';
import 'package:braille_app/screens/abecedariowg.dart';
import 'package:braille_app/screens/diacriticoswg.dart';
import 'package:braille_app/screens/numeroswg.dart';
import 'package:braille_app/screens/puntuacionwg.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:math' as math;

class AlfabetoPg extends StatefulWidget {
  const AlfabetoPg({super.key});

  @override
  State<AlfabetoPg> createState() => _AlfabetoPgState();
}

class _AlfabetoPgState extends State<AlfabetoPg>
    with SingleTickerProviderStateMixin {
  late TabController controller;

  @override
  void initState() {
    super.initState();
    controller = TabController(length: 4, vsync: this);
    controller.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFBE1),
        appBar: AppBar(
          elevation: 0,
          backgroundColor: const Color(0xFFFDBF00),
          leading: Transform.rotate(
          angle: 180 * math.pi / 180,
          child: IconButton(onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.forward)
          ),
        ),
          title: Align(
          alignment: Alignment.centerRight, 
          child: 
            Container(
              margin: const EdgeInsets.only(right: 40),
              child: Text("EDUSEA",style: GoogleFonts.lato(fontWeight: FontWeight.w900,fontSize: 18,color: const Color.fromARGB(168, 255, 255, 255), letterSpacing: 0.1
                          ),),
            )),
            shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(30),
            bottomRight: Radius.circular(30),
          )
        ),
          bottom: TabBar(
            labelColor: Colors.black,
            indicatorWeight: 5,
            indicatorColor: Colors.white,
            indicatorSize: TabBarIndicatorSize.label,
            controller: controller,
            tabs: [
              Tab(
                child: Text("A", style: GoogleFonts.lato(fontWeight: FontWeight.w800)),
              ),
              Tab(
                child: Text("á", style: GoogleFonts.lato(fontWeight: FontWeight.w900)),
                
              ),
              Tab(
                child: Text("1", style: GoogleFonts.lato(fontWeight: FontWeight.w900)),
                
              ),
              Tab(
                child: Text("?", style: GoogleFonts.lato(fontWeight: FontWeight.w900)),
                
              ),
            ],
          ),
          
        ),
        body: 
        TabBarView(
          controller: controller, 
          children: [
          AbecedarioWidget(),
          DiacriticosWidget(),
          NumerosWidget(),
          PuntuacionWidget(),
        ]));
  }
}
