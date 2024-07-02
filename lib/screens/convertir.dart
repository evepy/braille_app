import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../models/braille_map.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:math' as math;

class ConvertirPg extends StatefulWidget {
  const ConvertirPg({super.key});

  @override
  State<ConvertirPg> createState() => _ConvertirPgState();
}

class _ConvertirPgState extends State<ConvertirPg> {
  //controlador para texto
  TextEditingController _controllertxt = TextEditingController();
  TextEditingController _braillecontrollertxt = TextEditingController();

  String traducirTextoABraille2(String textoBase) {
  String textoBraille = '';
  bool signoNumeralAgregado = false;
  bool signoMayusculaAgregado = false;

  for (int i = 0; i < textoBase.length; i++) {
    String letra = textoBase[i];

    if ('0'.codeUnitAt(0) <= letra.codeUnitAt(0) && letra.codeUnitAt(0) <= '9'.codeUnitAt(0)) {
      if (!signoNumeralAgregado) {
        textoBraille += brailleUnicodeMap['#'] ?? '';
        signoNumeralAgregado = true;
      }
      textoBraille += brailleUnicodeMap[letra] ?? '';
    } else if (brailleUnicodeMap.containsKey(letra)) {
      // Si la letra es una letra válida en Braille, agrégala al texto Braille
      textoBraille += brailleUnicodeMap[letra] ?? '';
    } else if (letra == ' ') {
      // Reiniciar los indicadores de signo de numeral y mayúsculas en un espacio en blanco
      signoNumeralAgregado = false;
      signoMayusculaAgregado = false;
      textoBraille += ' '; // Agregar espacio en blanco
    } else if (letra == letra.toUpperCase()) {
      // Si es una letra mayúscula
      if (!signoMayusculaAgregado) {
        textoBraille += brailleUnicodeMap['..'] ?? '';
        signoMayusculaAgregado = true;
      }
      textoBraille += brailleUnicodeMap[letra.toLowerCase()] ?? '';
    } else {
      textoBraille += letra;
    }
  }

  return textoBraille;
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false ,
      backgroundColor: const Color(0xFFFFFBE1),
        appBar: PreferredSize(
      preferredSize: const Size.fromHeight(60),
      child: AppBar(
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
        //automaticallyImplyLeading: false,
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
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20),
          )
        ),
      ),
    ),
        body: Padding(
          padding: const EdgeInsets.only(left: 40, right: 40),
          child: Column(
            children: [
              const SizedBox(height: 20,),
              Text("Convertir", style: GoogleFonts.mukta(fontWeight: FontWeight.w900, fontSize: 31, letterSpacing: 0.8)),
              const SizedBox(height: 30,),
              Expanded(
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Center(
                    child: Container(
                      constraints: BoxConstraints(maxWidth: 600),
                      child: Column(
                        children: [
                          const Align( alignment: Alignment.topLeft,
                            child: Text("Texto:",style: TextStyle(fontSize: 20 , fontWeight: FontWeight.w500))),
                             const SizedBox(height: 8,),
                        Container(
                        child: TextFormField(
                          controller: _controllertxt,
                          decoration: InputDecoration(
                            fillColor: Colors.white,
                            filled: true,
                            contentPadding: const EdgeInsets.all(18),
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.white, width: 3),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Color(0xFFFDBF00), width: 3),
                              borderRadius: BorderRadius.circular(10)
                            )
                          ),
                          maxLines: 7,
                          onChanged: (texto) {
                            _braillecontrollertxt.text = traducirTextoABraille2(texto);
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Align(alignment: Alignment.topLeft,
                        child: Text("Texto en Braille:",style: TextStyle(fontSize: 20 , fontWeight: FontWeight.w500))),
                      const SizedBox(height: 8,),
                      TextFormField(
                        
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          suffixIcon: Padding(
                            padding: const EdgeInsetsDirectional.only(bottom:120),
                            child: IconButton(
                              icon: const Icon(Icons.content_copy, color: Colors.black,),
                              onPressed: () {
                                Clipboard.setData(
                                        ClipboardData(text: _braillecontrollertxt.text))
                                    .then((_) {
                                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                                      content: Text('Texto copiado al portapapeles')));
                                });
                              },
                            ),
                          ),
                          fillColor: Colors.white,
                          filled: true,
                          contentPadding: const EdgeInsets.all(27),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        maxLines: 9,
                        style: const TextStyle(fontFamily: 'Braille'),
                        controller: _braillecontrollertxt,
                        readOnly: true,
                      ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
             SizedBox(height: 50,)
            ],
          ),
        ));
  }
}
