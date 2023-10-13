import 'package:flutter/material.dart';
import 'dart:convert';

import 'package:braille_app/models/dia_min.dart';

class DiacriticosWidget extends StatefulWidget {
  @override
  _DiacriticosWidgetState createState() => _DiacriticosWidgetState();
}

class _DiacriticosWidgetState extends State<DiacriticosWidget> {
  List<DiacriticosMi>? diacriticosData;
  @override
  void initState() {
    super.initState();
    loadJsonData();
  }

  Future<void> loadJsonData() async {
    final String jsonContent =
        await DefaultAssetBundle.of(context).loadString('assets/data.json');
    final jsonData = json.decode(jsonContent);
    final diacriticoMin = DiacriticoMin.fromJson(jsonData);
    setState(() {
      diacriticosData = diacriticoMin.diacriticoMi;
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
        itemCount: diacriticosData?.length ?? 0,
        itemBuilder: (context, index) {
          final item = diacriticosData![index];
          return GestureDetector(
              onTap: () {
                if (diacriticosData != null && diacriticosData!.isNotEmpty) {
                  //final item = abecedarioData![index];
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetalleB(
                        diacriticoData: diacriticosData,
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
                  child: Text(item.signodiacritico ?? ''),
                ),
              ));
        });
  }
}

class DetalleB extends StatefulWidget {
  final List<DiacriticosMi>? diacriticoData;
  final int initialIndex;

  DetalleB({
    required this.diacriticoData,
    required this.initialIndex,
  });

  @override
  _DetalleBState createState() => _DetalleBState();
}

class _DetalleBState extends State<DetalleB> {
  late PageController pageController;
  late int currentIndex;
  late int itemCount;
  bool isAtFirstPage = false;
  bool isAtLastPage = false;

  @override
  void initState() {
    super.initState();
    currentIndex = widget.initialIndex;
    itemCount = widget.diacriticoData!.length;
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
      initialIndex: 1,
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
                        itemCount: widget.diacriticoData!.length,
                        controller: pageController,
                        itemBuilder: (context, index) {
                          final item = widget.diacriticoData![index];
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
