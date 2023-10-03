//import 'package:braille_app/screens/detallealf.dart';
import 'package:flutter/material.dart';
import 'dart:convert';

import '../models/abc_min.dart';
import 'detallealf.dart';

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
              AbecedarioWidget(),
              AbecedarioWidget(),
              AbecedarioWidget(),
            ])));
  }
}

class AbecedarioWidget extends StatefulWidget {
  @override
  _AbecedarioWidgetState createState() => _AbecedarioWidgetState();
}

class _AbecedarioWidgetState extends State<AbecedarioWidget> {
  List<AbecedarioMi>? abecedarioData;
  @override
  void initState() {
    super.initState();
    loadJsonData();
  }

  Future<void> loadJsonData() async {
    final String jsonContent =
        await DefaultAssetBundle.of(context).loadString('assets/data.json');
    final jsonData = json.decode(jsonContent);
    final abecedarioMin = AbecedarioMin.fromJson(jsonData);
    setState(() {
      abecedarioData = abecedarioMin.abecedarioMi;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: 1,
        ),
        scrollDirection: Axis.vertical,
        padding: const EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
        itemCount: abecedarioData?.length ?? 0,
        itemBuilder: (context, index) {
          final item = abecedarioData![index];
          return GestureDetector(
              onTap: () {
                if (abecedarioData != null && abecedarioData!.isNotEmpty) {
                  //final item = abecedarioData![index];
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetalleA(
                        abecedarioData: abecedarioData,
                        initialIndex: index,
                      ),
                    ),
                  );
                }
              },
              child: Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                    color: const Color(0xC6E381FF),
                    borderRadius: BorderRadius.circular(10)),
                child: Center(
                  child: Text(item.letter ?? ''),
                ),
              ));
        });
  }
}

class DetalleA extends StatelessWidget {
  final List<AbecedarioMi>? abecedarioData;
  final int initialIndex;
  final PageController pageController;

  DetalleA({
    required this.abecedarioData, 
    required this.initialIndex
    }): pageController = PageController(initialPage: initialIndex, viewportFraction: 1.0, keepPage: false);
  @override
  Widget build(BuildContext context) {
    final itemCount = abecedarioData!.length;
    // Función para navegar circularmente en el PageView
    void navigatePage(int delta) {
      final currentPage = pageController.page!.toInt();
      final nextPage = (currentPage + delta) % itemCount;
      pageController.animateToPage(
        nextPage,
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }

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
            Column(
              children: [
                Expanded(
                  child: Stack(
                    children: [
                      PageView.builder(
                        itemCount: abecedarioData!.length,
                        controller: pageController,
                        itemBuilder: (context, index) {
                          final item = abecedarioData![index];
                          return Center(
                            child: Image.network(
                              item.imageUrl ?? '',
                              fit: BoxFit.contain, // Ajusta la imagen para que se ajuste al tamaño del contenedor
                            ),
                          );
                        },
                      ),
                      Positioned(
                        top: 0,
                        left: 0,
                        right: 0,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconButton(
                              icon: Icon(Icons.arrow_back),
                              onPressed: () {
                                if (pageController.page! > 0) {
                                  pageController.previousPage(
                                    duration: Duration(milliseconds: 300),
                                    curve: Curves.easeInOut,
                                  );
                                }
                              },
                            ),
                            IconButton(
                              icon: Icon(Icons.arrow_forward),
                              onPressed: () {
                                if (pageController.page! < abecedarioData!.length - 1) {
                                  pageController.nextPage(
                                    duration: Duration(milliseconds: 300),
                                    curve: Curves.easeInOut,
                                  );
                                }
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Text("a"),
            Text("a"),
            Text("a"),
          ],
        ),
      ),
    );
  }
}