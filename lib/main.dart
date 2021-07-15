// @dart=2.9
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:minimal_light/controller.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  MobileAds.instance.initialize();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]); // hide status bar
    return MaterialApp(
        // hide debug word
        debugShowCheckedModeBanner: false,
        title: 'Mili',
        theme: ThemeData(
          primarySwatch: Colors.purple,
        ),
        home: Scaffold(
          body: SafeArea(
            child: HomePage(),
          ),
          extendBody: true,
        ));
  }
}

MyContoller _controller = Get.put(MyContoller());

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        width: double.infinity,
        height: double.infinity,
        color: _controller.isDark.value
            ? _controller.colorList[0]
            : _controller.colorList[1],
        child: Stack(
          children: [
            Padding(
              padding: EdgeInsets.only(
                top: 0,
                left: MediaQuery.of(context).size.width * 0.115,
              ),
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
                  Transform.rotate(
                      angle: 0,
                      child: InkWell(
                        onTap: () => _controller.TorchOn(),
                        child: Icon(
                          Icons.brightness_1_sharp,
                          color: _controller.isDark.value
                              ? _controller.colorList[1]
                              : _controller.colorList[0],
                          size: 100,
                        ),
                      )),
                  SizedBox(
                    height: 50,
                  ),
                  Transform.rotate(
                    angle: _controller.rotation.value,
                    child: InkWell(
                      onTap: () => _controller.TorchOff(),
                      child: Icon(
                        Icons.brightness_2_sharp,
                        color: _controller.isDark.value
                            ? _controller.colorList[1]
                            : _controller.colorList[0],
                        size: 100,
                      ),
                    ),
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

Widget TransformIcon({@required IconData icon}) {
  Transform.rotate(
      angle: 0,
      child: InkWell(
        onTap: null,
        child: Icon(
          icon,
          color: _controller.isDark.value
              ? _controller.colorList[0]
              : _controller.colorList[1],
          size: 100,
        ),
      ));
}



/*

class HomePage extends StatelessWidget {
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
                children: [
                  GestureDetector(
                      child: TransformIcon(
                        icon: Icons.brightness_2_sharp,
                      ),
                      onTap: () => _controller.useTorch()),
                  SizedBox(
                    height: 50,
                  ),
                  GestureDetector(
                    child: TransformIcon(icon: Icons.brightness_1_sharp),
                    onTap: () => _controller.useTorch(),
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


Widget TransformIcon({@required IconData icon}) {
  Transform.rotate(
    angle: 0,
    child: Icon(
      icon,
      color: _controller.isDark.value
          ? _controller.colorList[0]
          : _controller.colorList[1],
      size: 100,
    ),
  );
}
*/