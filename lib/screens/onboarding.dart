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
      backgroundColor:const Color(0xFFFFFBE1) ,
        body: 
      Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(top:60, bottom:10),
            child: Center(
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color:Colors.black, width: 8.0,),
                  borderRadius: BorderRadius.circular(30)
                ),
                constraints: BoxConstraints(maxWidth: 500),
                child: Stack(
                  children: [
                    Positioned(
                        top: 0,
                        left: 0,
                        right: 0,
                        child: Container(
                          decoration: const BoxDecoration(
                            color: Color(0xFFFFFBE1),
                            borderRadius: BorderRadius.only(topLeft: Radius.circular(30),topRight: Radius.circular(30))
                          ),
                          
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
                        left: 0,
                        right: 0,
                        bottom: 0,
                        child: Container(
                          padding: const EdgeInsets.all(20),
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height,
                          decoration:  BoxDecoration(
                              color: const Color.fromARGB(255, 255, 255, 255),
                              borderRadius: BorderRadius.circular(30)),
                          child: SingleChildScrollView(
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
                                    ),),
                                    
                                    ),
                                    SizedBox(height: 40,)
                              ],
                            ),
                          ),
                        )),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top:12,
            left: 0,
            right: 0,
            child:  Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              Text("@Evepy", style:  GoogleFonts.anton(),)
            ],),
          )
          ,
          Padding(
            padding: const EdgeInsets.only(top:50),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(color: Colors.black,borderRadius: BorderRadius.only(topLeft: Radius.circular(30),topRight: Radius.circular(30))),
                  width: 500,
                  height: 40,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top:65),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(color: Colors.white,borderRadius:BorderRadius.circular(30)),
                  width: 100,
                  height: 10,
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 10,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(color: Colors.black,borderRadius: BorderRadius.only(bottomLeft: Radius.circular(30),bottomRight: Radius.circular(30))),
                  width: 500,
                  height: 60,
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 30,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(15)),
                  width: 30,
                  height: 30,
                  child: Center(
                    child: Container(
                      decoration: BoxDecoration(color: Colors.black,borderRadius: BorderRadius.circular(15)),
                  width: 10,
                  height: 10,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ) 
    );
  }
}