import 'package:flutter/material.dart';
import 'dart:convert';

import '../models/pun_min.dart';

class PuntuacionWidget extends StatefulWidget {
  @override
  _PuntuacionWidgetState createState() => _PuntuacionWidgetState();
}

class _PuntuacionWidgetState extends State<PuntuacionWidget> {
  List<PuntuacionMi>? puntuacionData;
  @override
  void initState() {
    super.initState();
    loadJsonData();
  }

  Future<void> loadJsonData() async {
    final String jsonContent =
        await DefaultAssetBundle.of(context).loadString('assets/data.json');
    final jsonData = json.decode(jsonContent);
    final puntuacionMin = PuntuacionMin.fromJson(jsonData);
    setState(() {
      puntuacionData = puntuacionMin.puntuacionMi;
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
        itemCount: puntuacionData?.length ?? 0,
        itemBuilder: (context, index) {
          final item = puntuacionData![index];
          return GestureDetector(
              onTap: () {
                if (puntuacionData != null && puntuacionData!.isNotEmpty) {
                  //final item = abecedarioData![index];
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetalleA(
                        puntuacionData: puntuacionData,
                        initialIndex: index,
                        //currentIndex: index,
                        //itemCount: abecedarioData!.length,
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
                  child: Text(item.puntuacion ?? ''),
                ),
              ));
        });
  }
}

class DetalleA extends StatefulWidget {
  final List<PuntuacionMi>? puntuacionData;
  final int initialIndex;

  DetalleA({
    required this.puntuacionData,
    required this.initialIndex,
  });

  @override
  _DetalleAState createState() => _DetalleAState();
}

class _DetalleAState extends State<DetalleA> {
  late PageController pageController;
  late int currentIndex;
  late int itemCount;
  bool isAtFirstPage = false;
  bool isAtLastPage = false;

  @override
  void initState() {
    super.initState();
    currentIndex = widget.initialIndex;
    itemCount = widget.puntuacionData!.length;
    isAtFirstPage = currentIndex == 0;
    isAtLastPage = currentIndex == itemCount - 1;
    pageController = PageController(initialPage: currentIndex, viewportFraction: 1.0, keepPage: false);
    pageController.addListener(onPageChanged);
  }

  void onPageChanged() {
    setState(() {
      currentIndex = pageController.page!.toInt();
      isAtFirstPage = currentIndex == 0;
      isAtLastPage = currentIndex == itemCount - 1;
    });
  }

  // Función para navegar circularmente en el PageView
  void navigatePage(int delta) {
    final nextPage = currentIndex + delta;
    if (nextPage >= 0 && nextPage < itemCount) {
      pageController.animateToPage(
        nextPage,
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
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
            Column(
              children: [
                Expanded(
                  child: Stack(
                    children: [
                      PageView.builder(
                        itemCount: widget.puntuacionData!.length,
                        controller: pageController,
                        itemBuilder: (context, index) {
                          final item = widget.puntuacionData![index];
                          return Center(
                            child: Image.network(
                              item.imageUrl ?? '',
                              fit: BoxFit.contain,
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
                            if (!isAtFirstPage)
                              IconButton(
                                icon: Icon(Icons.arrow_back),
                                onPressed: () {
                                  navigatePage(-1);
                                },
                              )
                              else
                                SizedBox(width: 48),
                            if (!isAtLastPage)
                              IconButton(
                                icon: Icon(Icons.arrow_forward),
                                onPressed: () {
                                  navigatePage(1);
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

  @override
  void dispose() {
    pageController.removeListener(onPageChanged);
    pageController.dispose();
    super.dispose();
  }
}
