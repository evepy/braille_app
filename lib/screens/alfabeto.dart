//import 'package:braille_app/screens/detallealf.dart';
import 'package:braille_app/screens/abecedariowg.dart';
import 'package:braille_app/screens/diacriticoswg.dart';
import 'package:braille_app/screens/numeroswg.dart';
import 'package:braille_app/screens/puntuacionwg.dart';
import 'package:flutter/material.dart';


class AlfabetoPg extends StatefulWidget {
  const AlfabetoPg({super.key});

  @override
  State<AlfabetoPg> createState() => _AlfabetoPgState();
}

class _AlfabetoPgState extends State<AlfabetoPg> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 4,
        child: Scaffold(
            appBar: AppBar(
              backgroundColor: const Color(0xFFFDBF00),
              title: const Align(
                alignment: Alignment.centerRight,
                child: Text("EDUSEA"),
              ),
              bottom: const TabBar(
                tabs: [
                  Tab(
                    text: "A",
                  ),
                  Tab(
                    text: "á",
                  ),
                  Tab(
                    text: "1",
                  ),
                  Tab(
                    text: "?",
                  ),
                ],
              ),
            ),
            body: TabBarView(children: [
              AbecedarioWidget(),
              DiacriticosWidget(),
              NumerosWidget(),
              PuntuacionWidget(),
            ])));
  }
}

