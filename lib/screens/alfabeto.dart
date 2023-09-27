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
              title: const Align(alignment: Alignment.centerRight,
              child: Text("EDUSEA"),),
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
            body: 
              TabBarView(
                children: [
                  GridView(
                    gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 3,
                                crossAxisSpacing: 10,
                                mainAxisSpacing: 10,
                                childAspectRatio: 1,
                              ),
                    scrollDirection: Axis.vertical,
                    children: [
                      Padding(
                        padding:const EdgeInsetsDirectional.fromSTEB(10,10,10,10),
                        child: Container(
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(
                            color: const Color(0xC6E381FF),
                            borderRadius: BorderRadius.circular(10)
                          ),
                        ),
                      ),
                      Padding(
                        padding:const EdgeInsetsDirectional.fromSTEB(10,10,10,10),
                        child: Container(
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(
                            color: const Color(0xC6E381FF),
                            borderRadius: BorderRadius.circular(10)
                          ),
                        ),
                      ),
                      Padding(
                        padding:const EdgeInsetsDirectional.fromSTEB(10,10,10,10),
                        child: Container(
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(
                            color: const Color(0xC6E381FF),
                            borderRadius: BorderRadius.circular(10)
                          ),
                        ),
                      ),
                      Padding(
                        padding:const EdgeInsetsDirectional.fromSTEB(10,10,10,10),
                        child: Container(
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(
                            color: const Color(0xC6E381FF),
                            borderRadius: BorderRadius.circular(10)
                          ),
                        ),
                      ),
                      Padding(
                        padding:const EdgeInsetsDirectional.fromSTEB(10,10,10,10),
                        child: Container(
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(
                            color: const Color(0xC6E381FF),
                            borderRadius: BorderRadius.circular(10)
                          ),
                        ),
                      ),
                      Padding(
                        padding:const EdgeInsetsDirectional.fromSTEB(10,10,10,10),
                        child: Container(
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(
                            color: const Color(0xC6E381FF),
                            borderRadius: BorderRadius.circular(10)
                          ),
                        ),
                      ),
                    ],
                  ),
                  const Icon(Icons.headphones_battery_sharp),
                  const Icon(Icons.headphones_battery_sharp),
                  const Icon(Icons.headphones_battery_sharp),
                ]
                ),
            ));
  }
}
