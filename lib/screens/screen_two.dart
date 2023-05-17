import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'dart:developer';
import 'dart:io' show Platform;

class ScreenTwo extends StatefulWidget {
  const ScreenTwo({super.key});

  @override
  State<ScreenTwo> createState() => _ScreenTwoState();
}

class _ScreenTwoState extends State<ScreenTwo> {
  late InterstitialAd _interstitialAd;

  @override
  void initState() {
    InterstitialAd.load(
      adUnitId: Platform.isAndroid
          ? 'ca-app-pub-9510586895080431/5984549060'
          : 'ca-app-pub-3940256099942544/4411468910',
      request: AdRequest(),
      adLoadCallback: InterstitialAdLoadCallback(
        onAdLoaded: (InterstitialAd ad) {
          _interstitialAd = ad;
          _interstitialAd.show();
        },
        onAdFailedToLoad: (LoadAdError error) {
          log('InterstitialAd failed to load: $error');
        },
      ),
    );
    super.initState();
  }

  @override
  void dispose() {
    _interstitialAd.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text("Screen Two"),
      ),
    );
  }
}
