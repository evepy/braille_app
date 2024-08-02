import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:math' as math;
import 'package:braille_app/models/num_min.dart';
import 'package:google_fonts/google_fonts.dart';

class NumerosWidget extends StatefulWidget {
  const NumerosWidget({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _NumerosWidgetState createState() => _NumerosWidgetState();
}

class _NumerosWidgetState extends State<NumerosWidget> {
  List<NumeroMi>? numerosData;
  @override
  void initState() {
    super.initState();
    loadJsonData();
  }

  Future<void> loadJsonData() async {
    final String jsonContent =
        await DefaultAssetBundle.of(context).loadString('assets/data.json');
    final jsonData = json.decode(jsonContent);
    final numeroMin = NumeroMin.fromJson(jsonData);
    setState(() {
      numerosData = numeroMin.numeroMi;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(margin: const EdgeInsets.only(top:10),
          child: Text('Números', style: GoogleFonts.mukta(fontWeight: FontWeight.w900, fontSize: 31, letterSpacing: 0.9))),
        Expanded(
          child: Container(
            constraints: const BoxConstraints(maxWidth: 600),
            child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 30,
                  mainAxisSpacing: 25,
                  childAspectRatio: 1,
                ),
                scrollDirection: Axis.vertical,
                padding: const EdgeInsetsDirectional.fromSTEB(30, 10, 30, 10),
                itemCount: numerosData?.length ?? 0,
                itemBuilder: (context, index) {
                  final item = numerosData![index];
                  return GestureDetector(
                      onTap: () {
                        if (numerosData != null && numerosData!.isNotEmpty) {
                          //final item = abecedarioData![index];
                          showDialog(
                                  barrierColor: Colors.transparent,
                                   context: context,
                                    builder: (context) {
                                      return DetalleB(
                                      numeroData: numerosData!,
                                      initialIndex: index,
                        );},);}},
                      child: Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                            color: const Color.fromARGB(97, 204, 108, 230),
                            borderRadius: BorderRadius.circular(30)),
                        child: Center(
                          child: Text((item.numero ?? '').toUpperCase(), style: const TextStyle(fontSize: 50),),
                        ),
                      ));
                }),
          ),
        ),
      ],
    );
  }
}

class DetalleB extends StatefulWidget {
  final List<NumeroMi> numeroData;
  final int initialIndex;

  const DetalleB({super.key, 
    required this.numeroData,
    required this.initialIndex,
  });

  @override
  // ignore: library_private_types_in_public_api
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
    itemCount = widget.numeroData.length;
    isAtFirstPage = currentIndex == 0;
    isAtLastPage = currentIndex == itemCount - 1;
    pageController = PageController(
        initialPage: currentIndex, viewportFraction: 1.0, keepPage: false);
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
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      alignment: const FractionalOffset(0, 0.5),
      child: SizedBox(
        height: 520,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: <Widget>[
            Expanded(
              child: Stack(
                children: [
                  PageView.builder(
                    itemCount: widget.numeroData.length,
                    controller: pageController,
                    itemBuilder: (context, index) {
                      final item = widget.numeroData[index];
                      return Column(
                        children: [
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            (item.numero ?? '').toUpperCase(),
                            style: const TextStyle(
                                fontSize: 50, fontWeight: FontWeight.bold),
                          ),
                          Image.network(item.imageUrl ?? '',
                              fit: BoxFit.contain, width: 250
                              //height: 450,
                              ),
                        ],
                      );
                    },
                  ),
                  Positioned(
                    top: 50,
                    left: 0,
                    right: 0,
                    bottom: 0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        if (currentIndex > 0)
                          Padding(
                        padding: const EdgeInsets.only(left: 30),
                        child: Transform.rotate(
                          angle: 90 * math.pi / 180,
                          child: InkResponse(
                            onTap: () {
                              navigatePage(-1);
                            },
                            radius: 50, // Radio del splash para que sea circular
                            splashColor: Colors.grey, // Color del splash
                            borderRadius: BorderRadius.circular(100),
                            child: const Icon(
                              Icons.arrow_drop_down,
                              size: 100,
                              color: Color(0xFFFDBF00),
                            ), // Borde circular
                          ),
                        ),
                      )
                        else
                          const SizedBox(width: 10),
                        if (currentIndex < itemCount - 1)
                          Padding(
                        padding: const EdgeInsets.only(right: 30),
                        child: Transform.rotate(
                          angle: -90 * math.pi / 180,
                          child: InkResponse(
                            onTap: () {
                              navigatePage(1);
                            },
                            radius: 50, // Radio del splash para que sea circular
                            splashColor: Colors.grey, // Color del splash
                            borderRadius: BorderRadius.circular(100),
                            child: const Icon(
                              Icons.arrow_drop_down,
                              size: 100,
                              color: Color(0xFFFDBF00),
                            ), // Borde circular
                          ),
                        ),
                      )
                        else
                          const SizedBox(width: 0),
                      ],
                    ),
                  ),
                ],
              ),
            ),
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
