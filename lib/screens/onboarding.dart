import 'package:braille_app/screens/inicio.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';


class Onboarding extends StatefulWidget {
  const Onboarding({super.key});

  @override
  State<Onboarding> createState() => _HomeState();
}

class _HomeState extends State<Onboarding> {
  bool isFirstTime = false;

  Future<void> checkFirstTime() async {
    final prefs = await SharedPreferences.getInstance();
    final hasRunBefore = prefs.getBool('hasRunBefore') ?? false;

    if (!hasRunBefore) {
      await prefs.setBool('hasRunBefore', true);
      setState(() {
        isFirstTime = true;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    checkFirstTime();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: 
      Stack(
        children: [
          Positioned(
              top: 0,
              child: Container(
                color: const Color(0xFFFFFBE1),
                width: MediaQuery.of(context).size.width,
                height: 400,
                child:const  Center(
                    child: CircleAvatar(
                  radius: 80,
                  backgroundImage: AssetImage('assets/images/logo.jpg'),
                )),
              )),
          Positioned(
              top: 380,
              child: Container(
                padding: const EdgeInsets.all(20),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                decoration:const  BoxDecoration(
                    color: Color.fromARGB(255, 255, 255, 255),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30))),
                child: Column(
                  children: [
                    Text(
                      "EDUSEA es una \norganización sin fines\n de lucro ",
                      style: GoogleFonts.lato(
                        fontWeight: FontWeight.w900,
                        fontSize: 28,
                        letterSpacing: 0.2,
                        color: const Color(0xFF0E194D),
                      ),
                      textAlign: TextAlign.center,
                      
                      
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Text(
                      "Buscamos promover la ODS\n 3, 4 y 13!",
                      style: 
                        GoogleFonts.notoSansKhudawadi(
                          fontSize: 11, 
                        color: const Color.fromARGB(255, 120, 120, 120),
                        letterSpacing: 0.3,
                        ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(
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
                          padding: const EdgeInsets.only(left: 30, right: 30,),
                          backgroundColor: const Color(0xFFFFC50F),
                          foregroundColor: Colors.white,
                          minimumSize: const Size(100, 50),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(32.0)),
                        ),
                        child: Text("IR A APRENDER", 
                        style: GoogleFonts.roboto(
                          fontWeight: FontWeight.w700
                        ),))
                  ],
                ),
              )),
        ],
      ) 
    );
  }
}
