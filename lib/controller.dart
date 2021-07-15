import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:flashlight/flashlight.dart';

class MyContoller extends GetxController {
  List colorList = [Colors.white, Colors.black];
  var isDark = true.obs;
  var rotation = 0.0.obs;
  final BannerAd myBanner = BannerAd(
    adUnitId: 'ca-app-pub-2661805624872444/1020514305',
    size: AdSize.banner,
    request: AdRequest(),
    listener: BannerAdListener(),
  );

  @override
  void onInit() {
    super.onInit();
    myBanner.load();
    runRotation();
  }

  void TorchOn() async {
    isDark.value = false;
    Flashlight.lightOn();
  }

  void TorchOff() async {
    isDark.value = true;
    Flashlight.lightOff();
  }

// rotate icon
  Future runRotation() async {
    for (int i = 0; i < 100000000000000; i++) {
      await Future.delayed(Duration(milliseconds: 100));
      rotation.value = rotation.value + 0.3;
    }
  }
}
