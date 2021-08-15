// @dart=2.9
import 'package:flashlight/flashlight.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:google_mobile_ads/google_mobile_ads.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  MobileAds.instance.initialize();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]);
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Mili',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Scaffold(
          body: SafeArea(
            child: HomePage(),
          ),
        ));
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List colorList = [Colors.white, Colors.black];
  var isDark = true;

  final BannerAd myBanner = BannerAd(
    adUnitId: 'ca-app-pub-2661805624872444/1020514305',
    size: AdSize.banner,
    request: AdRequest(),
    listener: BannerAdListener(),
  );
  @override
  void initState() {
    myBanner.load();
    super.initState();
  }

  @override
  void dispose() {
    myBanner.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: isDark ? colorList[1] : colorList[0],
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          // ad banner
          Container(
            height: 50,
            width: 320,
            child: AdWidget(
              ad: myBanner,
            ),
          ),
          // Sun icon
          IconButton(
            iconSize: 100,
            splashRadius: 30,
            icon: Icon(
              Icons.brightness_1_sharp,
              // size: 100,
            ),
            color: isDark ? colorList[0] : colorList[1],
            onPressed: () {
              setState(() {
                isDark = false;
                Flashlight.lightOn();
              });
            },
          ),

          SizedBox(
            height: 50,
          ),
          // Lune icon
          IconButton(
            iconSize: 100,
            splashRadius: 30,
            color: isDark ? colorList[0] : colorList[1],
            icon: Icon(
              Icons.brightness_2_sharp,
            ),
            onPressed: () {
              setState(() {
                isDark = true;
                Flashlight.lightOff();
              });
            },
          ),
        ],
      ),
    );
  }
}
