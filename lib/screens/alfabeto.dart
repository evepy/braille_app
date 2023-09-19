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
              backgroundColor: Color(0xFFFDBF00),
              title: Align(alignment: Alignment.centerRight,
              child: Text("EDUSEA"),),
              bottom: TabBar(
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
                    gridDelegate:SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 3,
                                crossAxisSpacing: 10,
                                mainAxisSpacing: 10,
                                childAspectRatio: 1,
                              ),
                    scrollDirection: Axis.vertical,
                    children: [
                      Padding(
                        padding:EdgeInsetsDirectional.fromSTEB(10,10,10,10),
                        child: Container(
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(
                            color: Color(0xC6E381FF),
                            borderRadius: BorderRadius.circular(10)
                          ),
                        ),
                      ),
                      Padding(
                        padding:EdgeInsetsDirectional.fromSTEB(10,10,10,10),
                        child: Container(
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(
                            color: Color(0xC6E381FF),
                            borderRadius: BorderRadius.circular(10)
                          ),
                        ),
                      ),
                      Padding(
                        padding:EdgeInsetsDirectional.fromSTEB(10,10,10,10),
                        child: Container(
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(
                            color: Color(0xC6E381FF),
                            borderRadius: BorderRadius.circular(10)
                          ),
                        ),
                      ),
                      Padding(
                        padding:EdgeInsetsDirectional.fromSTEB(10,10,10,10),
                        child: Container(
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(
                            color: Color(0xC6E381FF),
                            borderRadius: BorderRadius.circular(10)
                          ),
                        ),
                      ),
                      Padding(
                        padding:EdgeInsetsDirectional.fromSTEB(10,10,10,10),
                        child: Container(
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(
                            color: Color(0xC6E381FF),
                            borderRadius: BorderRadius.circular(10)
                          ),
                        ),
                      ),
                      Padding(
                        padding:EdgeInsetsDirectional.fromSTEB(10,10,10,10),
                        child: Container(
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(
                            color: Color(0xC6E381FF),
                            borderRadius: BorderRadius.circular(10)
                          ),
                        ),
                      ),
                    ],
                  ),
                  Icon(Icons.headphones_battery_sharp),
                  Icon(Icons.headphones_battery_sharp),
                  Icon(Icons.headphones_battery_sharp),
                ]
                ),
            ));
  }
}
