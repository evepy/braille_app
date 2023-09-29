//import 'package:braille_app/screens/detallealf.dart';
import 'package:flutter/material.dart';
import 'dart:convert';

class AlfabetoPg extends StatefulWidget {
  const AlfabetoPg({super.key});

  @override
  State<AlfabetoPg> createState() => _AlfabetoPgState();
}

class _AlfabetoPgState extends State<AlfabetoPg> {
 
 List<Map<String, String>> contentjson = [];
  @override
  void initState() {
    super.initState();
    loadJsonData();
  }

  Future<void> loadJsonData() async {
    final jsonContent = await DefaultAssetBundle.of(context).loadString('data.json');
    final jsonData = json.decode(jsonContent);
    setState(() {
      contentjson = jsonData['abecedario_mi'];
    });
  }
  
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
            body: TabBarView(
              children: [
              GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    childAspectRatio: 1,
                  ),
                  scrollDirection: Axis.vertical,
                  padding: const EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
                  itemCount: contentjson.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: (){},
                        child: Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                          color: const Color(0xC6E381FF),
                          borderRadius: BorderRadius.circular(10)),
                    ));
                  }
                  /*children: [
                      Padding(
                        padding:const EdgeInsetsDirectional.fromSTEB(10,10,10,10),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const DetalleA()),
                              );
                          },
                          child: Container(
                            width: 100,
                            height: 100,
                            decoration: BoxDecoration(
                              color: const Color(0xC6E381FF),
                              borderRadius: BorderRadius.circular(10)
                            ),
                          ),
                        ),
                      ),
                      
                    ],
                  ),*/

                  ),
                  Text('knkjn'),
                  Text('knkjn'),
                  Text('knkjn'),
            ])));
  }
}
