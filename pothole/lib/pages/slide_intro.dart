import 'dart:math';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:liquid_swipe/liquid_swipe.dart';

class SplashScreen extends StatefulWidget {
  static TextStyle styleTitle = TextStyle(
    color: Colors.white,
    fontSize: 38,
    fontFamily: GoogleFonts.prozaLibre().fontFamily,
    fontWeight: FontWeight.w900,
  );
  static TextStyle styleDesc = TextStyle(
    color: Colors.white,
    fontSize: 22,
    fontFamily: GoogleFonts.prozaLibre().fontFamily,
    fontWeight: FontWeight.w400,
  );
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreen createState() => _SplashScreen();
}

class _SplashScreen extends State<SplashScreen> {
  int page = 0;
  late LiquidController liquidController;
  late UpdateType updateType;

  @override
  void initState() {
    liquidController = LiquidController();
    super.initState();
  }

  final pages = [
    Container(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      width: double.infinity,
      color: const Color.fromRGBO(28, 45, 48, 1),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 100, 0, 0),
            child: Column(
              children: [
                Text(
                  "Pothole Informer",
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: GoogleFonts.lato().fontFamily,
                    fontSize: 48,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          const Text(
            "A Quick Guide...",
            style: TextStyle(
              color: Colors.white,
              fontSize: 26.5,
            ),
          ),
        ],
      ),
    ),
    Container(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      width: double.infinity,
      color: Colors.indigo,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Column(
            children: [
              const SizedBox(
                height: 200,
              ),
              Text(
                "INFORM",
                style: SplashScreen.styleTitle,
              ),
              Padding(
                padding: const EdgeInsets.all(50.0),
                child: Image.asset(
                  "assets/images/search.png",
                  height: 120,
                ),
              ),
              Text(
                "Inform all the potholes in your local area to be fixed",
                style: SplashScreen.styleDesc,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ],
      ),
    ),
    Container(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      width: double.infinity,
      color: const Color(0xFF232323),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Column(
            children: [
              const SizedBox(
                height: 200,
              ),
              Text(
                "MAPS",
                style: SplashScreen.styleTitle,
              ),
              Padding(
                padding: const EdgeInsets.all(50.0),
                child: Image.asset(
                  "assets/images/maps2.png",
                  height: 120,
                ),
              ),
              Text(
                "Check on the map all the potholes registered, fixed and in progress",
                style: SplashScreen.styleDesc,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ],
      ),
    ),
    Container(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      width: double.infinity,
      color: const Color(0xFF460BA1),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Column(
            children: [
              const SizedBox(
                height: 200,
              ),
              Text(
                "TRACK",
                style: SplashScreen.styleTitle,
              ),
              Padding(
                padding: const EdgeInsets.all(50.0),
                child: Image.asset(
                  "assets/images/informer.png",
                  height: 120,
                ),
              ),
              Text(
                "Track in realtime the progress of your complaint",
                style: SplashScreen.styleDesc,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ],
      ),
    ),
  ];

  Widget _buildDot(int index) {
    double selectedness = Curves.easeOut.transform(
      max(
        0.0,
        1.0 - ((page) - index).abs(),
      ),
    );
    double zoom = 1.0 + (2.0 - 1.0) * selectedness;
    return SizedBox(
      width: 25.0,
      child: Center(
        child: Material(
          color: Colors.white,
          type: MaterialType.circle,
          child: SizedBox(
            width: 8.0 * zoom,
            height: 8.0 * zoom,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          body: Stack(
            children: <Widget>[
              LiquidSwipe(
                pages: pages,
                slideIconWidget: const Icon(Icons.arrow_back_ios),
                onPageChangeCallback: pageChangeCallback,
                waveType: WaveType.liquidReveal,
                liquidController: liquidController,
                enableSideReveal: true,
                ignoreUserGestureWhileAnimating: true,
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: <Widget>[
                    const Expanded(child: SizedBox()),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List<Widget>.generate(pages.length, _buildDot),
                    ),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text("SKIP",
                        style: TextStyle(color: Colors.white)),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomLeft,
                child: Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: TextButton(
                    onPressed: () {
                      var counter = 0;
                      liquidController.jumpToPage(
                          page: liquidController.currentPage + 1 >
                                  pages.length - 1
                              ? counter = 1
                              : liquidController.currentPage + 1);
                      if (counter == 1) {
                        Navigator.pop(context);
                      }
                    },
                    child: const Text("Next",
                        style: TextStyle(color: Colors.white)),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  pageChangeCallback(int lpage) {
    setState(() {
      page = lpage;
    });
  }
}
