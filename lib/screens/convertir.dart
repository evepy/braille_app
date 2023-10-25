import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ConvertirPg extends StatefulWidget {
  const ConvertirPg({super.key});

  @override
  State<ConvertirPg> createState() => _ConvertirPgState();
}

class _ConvertirPgState extends State<ConvertirPg> {
  //controlador para texto
  TextEditingController _controllertxt = TextEditingController();
  TextEditingController _braillecontrollertxt = TextEditingController();

  String traducirTextoABraille(String textoBase) {
    String textoBraille = '';

    for (int i = 0; i < textoBase.length; i++) {
      String letra = textoBase[i];
      int valorUnicode = letra.codeUnitAt(0) - 65 + 0x2801;

      // Solo convertir letras de la 'A' a la 'Z'
      if (valorUnicode >= 0x2801 && valorUnicode <= 0x283A) {
        textoBraille += String.fromCharCode(valorUnicode);
      } else {
        // Mantener caracteres no válidos tal como están
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
                    _braillecontrollertxt.text = texto;
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
            Padding(
          padding: const EdgeInsets.all(16.0),
          child: TextField(
            controller: _braillecontrollertxt ,
            decoration: InputDecoration(labelText: 'Texto Base'),
          ),
        ),
        ElevatedButton(
          onPressed: () {
            String textoBase = _braillecontrollertxt.text.toUpperCase();
            String textoBraille = traducirTextoABraille(textoBase);
            _braillecontrollertxt.text = textoBraille;
          },
          child: Text('Traducir a Braille'),
        ),
            ],
        ));
  }
}
