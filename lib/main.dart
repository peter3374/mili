// @dart=2.9
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:mili/controller.dart';

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
          primarySwatch: Colors.purple,
        ),
        home: Scaffold(
          body: SafeArea(
            child: HomePage(),
          ),
        ));
  }
}

class HomePage extends StatelessWidget {
  // getx controller;
  MyContoller _controller = Get.put(MyContoller());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        width: double.infinity,
        height: double.infinity,
        color: _controller.isDark.value
            ? _controller.colorList[1]
            : _controller.colorList[0],
        child: Stack(
          children: [
            Padding(
              padding: EdgeInsets.only(
                top: 0,
                left: MediaQuery.of(context).size.width * 0.115,
              ),
              // ad Banner is here
              child: Container(
                height: 50,
                width: 320,
                child: AdWidget(
                  ad: _controller.myBanner,
                ),
              ),
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Sun icon
                  IconButton(
                    icon: Icon(
                      Icons.brightness_1_sharp,
                      size: 100,
                    ),
                    color: _controller.isDark.value
                        ? _controller.colorList[0]
                        : _controller.colorList[1],
                    onPressed: () => _controller.TorchOn(),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  // Lune icon
                  IconButton(
                    color: _controller.isDark.value
                        ? _controller.colorList[0]
                        : _controller.colorList[1],
                    icon: Icon(
                      Icons.brightness_2_sharp,
                      size: 100,
                    ),
                    onPressed: () => _controller.TorchOff(),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
