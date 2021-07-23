import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:flashlight/flashlight.dart';

class MyContoller extends GetxController {
  List colorList = [Colors.white, Colors.black];

  var isDark = true.obs;

/*
Use this variable only for animation;
*/
  // var rotation = 0.0.obs;

  final BannerAd myBanner = BannerAd(
    adUnitId: 'ca-app-pub-2661805624872444/1020514305',
    size: AdSize.banner,
    request: AdRequest(),
    listener: BannerAdListener(),
  );

  void TorchOn() {
    isDark.value = false;
    Flashlight.lightOn();
  }

  void TorchOff() {
    isDark.value = true;
    Flashlight.lightOff();
  }

  @override
  void onInit() {
    super.onInit();
    myBanner.load();
    // runRotation();
  }

  @override
  void onClose() {
    super.onClose();
    myBanner.dispose();
  }

/*
Lune rotation animation
*/

  // Future runRotation() async {
  //   for (int i = 0; i < 100000000000000; i++) {
  //     await Future.delayed(Duration(milliseconds: 100));
  //     rotation.value = rotation.value + 0.3;
  //   }

}
