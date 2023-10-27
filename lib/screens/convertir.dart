import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../models/braille_map.dart';

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
  bool signoNumeralAgregado = false; // Variable para rastrear si ya se agregó el signo de numeral

  for (int i = 0; i < textoBase.length; i++) {
    String letra = textoBase[i].toUpperCase(); // Asegúrate de que esté en mayúsculas

    if ('0'.codeUnitAt(0) <= letra.codeUnitAt(0) && letra.codeUnitAt(0) <= '9'.codeUnitAt(0)) {
      // Si la letra es un número, agrégala al texto Braille y agrega el signo de numeral si aún no se ha agregado
      if (!signoNumeralAgregado) {
        textoBraille += brailleUnicodeMap['#'] ?? '';
        signoNumeralAgregado = true;
      }
      textoBraille += brailleUnicodeMap[letra] ?? '';
    } else if (brailleUnicodeMap.containsKey(letra)) {
      // Si la letra es una letra válida en Braille, agrégala al texto Braille
      textoBraille += brailleUnicodeMap[letra] ?? '';
    } else {
      // Mantén otros caracteres tal como están
      textoBraille += letra;
    }
  }

  return textoBraille;
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFFFDBF00),
          title: Align(
            alignment: Alignment.centerRight,
            child: Text("EDUSEA"),
          ),
        ),
        body: Column(
          children: [
            Text("Convertir"),
            SizedBox(
              height: 30,
            ),
            Text("Texto:"),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                child: TextFormField(
                  controller: _controllertxt,
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    contentPadding: EdgeInsets.all(27),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white, width: 3),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onChanged: (texto) {
                    _braillecontrollertxt.text = traducirTextoABraille2(texto);
                  },
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text("Texto en Braille:"),
TextFormField(
  decoration: InputDecoration(
    suffixIcon: IconButton(
      icon: Icon(Icons.content_copy),
       onPressed: () {
        Clipboard.setData(ClipboardData(text: _braillecontrollertxt.text))
            .then((_) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text('Texto copiado al portapapeles')));
        });
      },
    ),
    fillColor: Colors.white,
    filled: true,
    contentPadding: EdgeInsets.all(27),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.white, width: 3),
      borderRadius: BorderRadius.circular(10),
    ),
  ),
  style: TextStyle(fontFamily: 'Braille'),
  controller: _braillecontrollertxt,
  readOnly: true,
),
        
            ],
        ));
  }
}
