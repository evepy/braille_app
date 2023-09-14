import 'package:braille_app/screens/inicio.dart';
import 'package:flutter/material.dart';

class Bienvenida extends StatefulWidget {
  const Bienvenida({super.key});

  @override
  State<Bienvenida> createState() => _HomeState();
}

class _HomeState extends State<Bienvenida> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Stack(
          children: [
            Positioned(
                top: 0,
                child: Container(
                  color: Color(0xFFFFFBE1),
                  width: MediaQuery.of(context).size.width,
                  height: 400,
                  child: Center(
                      child: CircleAvatar(
                    radius: 100,
                    backgroundImage: AssetImage('assets/images/logo.jpg'),
                  )),
                )),
            Positioned(
                top: 380,
                child: Container(
                  padding: EdgeInsets.all(20),
                  width: MediaQuery.of(context).size.width,
                  height: 400,
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 255, 255, 255),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30))),
                  child: Column(
                    children: [
                      Text(
                        "EDUSEA es una \norganización sin fines\n de lucro ",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 30),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        "Buscamos promover la ODS 3, 4 y 13!",
                        style: TextStyle(fontSize: 13),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const Inicio()),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFFFFC50F),
                            foregroundColor: Colors.white,
                            minimumSize: Size(120, 60),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(32.0)),
                          ),
                          child: Text("IR A APRENDER"))
                    ],
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
