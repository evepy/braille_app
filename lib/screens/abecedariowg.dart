import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:convert';
import 'dart:math' as math;
import '../models/abc_min.dart';

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
    return Column(
      children: [
        Container(margin: const EdgeInsets.only(top:10),
          child: Text('Alfabeto', style: GoogleFonts.mukta(fontWeight: FontWeight.w900, fontSize: 31, letterSpacing: 0.9))),
        Expanded(
          child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 30,
                mainAxisSpacing: 25,
                childAspectRatio: 1,
              ),
              scrollDirection: Axis.vertical,
              padding: const EdgeInsetsDirectional.fromSTEB(30, 10, 30, 10),
              itemCount: abecedarioData?.length ?? 0,
              itemBuilder: (context, index) {
                final item = abecedarioData![index];
                return GestureDetector(
                    onTap: () {
                      if (abecedarioData != null && abecedarioData!.isNotEmpty) {
        
                        showDialog(
                          barrierColor: Colors.transparent,
                           context: context,
                            builder: (context) {
                              return ShowDialogFunc(
                              abecedarioData: abecedarioData!,
                              initialIndex: index,
                );},);}},
                    child: Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                          color: const Color.fromARGB(97, 204, 108, 230),
                          borderRadius: BorderRadius.circular(30)),
                      child: Center(
                        child: Text((item.letter ?? '').toUpperCase(), style: const TextStyle(fontSize: 50),),
                      ),
                    ));
              }),
        ),
      ],
    );
  }
}

class ShowDialogFunc extends StatefulWidget {
  final List<AbecedarioMi> abecedarioData;
  final int initialIndex;

  ShowDialogFunc({
    required this.abecedarioData,
    required this.initialIndex,
  });

  @override
  _ShowDialogFuncState createState() => _ShowDialogFuncState();
}

class _ShowDialogFuncState extends State<ShowDialogFunc> {
  late PageController pageController;
  late int currentIndex;
  late int itemCount;
  bool isAtFirstPage = false;
  bool isAtLastPage = false;

//


  @override
  void initState() {
    super.initState();
    currentIndex = widget.initialIndex;
    itemCount = widget.abecedarioData.length;
    isAtFirstPage = currentIndex == 0;
    isAtLastPage = currentIndex == itemCount - 1;
    pageController = PageController(
      initialPage: currentIndex,
      viewportFraction: 1.0,
      keepPage: false,
    );
    pageController.addListener(() {
      setState(() {
        currentIndex = pageController.page!.toInt();
        isAtFirstPage = currentIndex == 0;
        isAtLastPage = currentIndex == itemCount - 1;
      });
    });
  }

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
  child: Container(
    height: 520,
    width: MediaQuery.of(context).size.width,
    child: Column(
      children: <Widget>[
        Expanded(
          child: Stack(
            children: [
              PageView.builder(
                itemCount: widget.abecedarioData.length,
                controller: pageController,
                itemBuilder: (context, index) {
                  final item = widget.abecedarioData[index];
                  return Column(
                    children: [
                      const SizedBox(height: 10),
                      Text(
                        (item.letter ?? '').toUpperCase(),
                        style: const TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
                      ),
                      Image.network(
                        item.imageUrl ?? '',
                        fit: BoxFit.contain,
                        width: 250,
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
                            child: const Icon(
                              Icons.arrow_drop_down,
                              size: 100,
                              color: Color(0xFFFDBF00),
                            ),
                            radius: 50, // Radio del splash para que sea circular
                            splashColor: Colors.grey, // Color del splash
                            borderRadius: BorderRadius.circular(100), // Borde circular
                          ),
                        ),
                      )
                    else
                      const SizedBox(width: 10),
                    if (currentIndex < widget.abecedarioData.length - 1)
                      Padding(
                        padding: const EdgeInsets.only(right: 30),
                        child: Transform.rotate(
                          angle: -90 * math.pi / 180,
                          child: InkResponse(
                            onTap: () {
                              navigatePage(1);
                            },
                            child: const Icon(
                              Icons.arrow_drop_down,
                              size: 100,
                              color: Color(0xFFFDBF00),
                            ),
                            radius: 50, // Radio del splash para que sea circular
                            splashColor: Colors.grey, // Color del splash
                            borderRadius: BorderRadius.circular(100), // Borde circular
                          ),
                        ),
                      )
                    else
                      const SizedBox(width: 10),
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
}
