import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

// Identifiants de TEST publiés par Google. Jamais d'identifiant réel ici.
const idBanniereTest = 'ca-app-pub-3940256099942544/6300978111';
const idInterstitielTest = 'ca-app-pub-3940256099942544/1033173712';

class BanniereTest extends StatefulWidget {
  const new({super.key});

  @override
  State<BanniereTest> createState() => _EtatBanniereTest();
}

class _EtatBanniereTest extends State<BanniereTest> {
  BannerAd? _banniere;
  var _chargee = false;

  @override
  void initState() {
    super.initState();
    _banniere = BannerAd(
      adUnitId: idBanniereTest,
      size: AdSize.banner,
      request: const AdRequest(),
      listener: BannerAdListener(
        onAdLoaded: (_) {
          if (mounted) setState(() => _chargee = true);
        },
        onAdFailedToLoad: (pub, _) {
          unawaited(pub.dispose());
          if (mounted) setState(() => _banniere = null);
        },
      ),
    );
    unawaited(_banniere!.load());
  }

  @override
  void dispose() {
    final pub = _banniere;
    if (pub != null) unawaited(pub.dispose());
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final pub = _banniere;
    if (!_chargee || pub == null) return const SizedBox.shrink();
    return Center(
      child: SizedBox(
        width: AdSize.banner.width.toDouble(),
        height: AdSize.banner.height.toDouble(),
        child: AdWidget(ad: pub),
      ),
    );
  }
}

class ServiceInterstitiel {
  InterstitialAd? _pub;

  void charger() {
    unawaited(
      InterstitialAd.load(
        adUnitId: idInterstitielTest,
        request: const AdRequest(),
        adLoadCallback: InterstitialAdLoadCallback(
          onAdLoaded: (pub) => _pub = pub,
          onAdFailedToLoad: (_) => _pub = null,
        ),
      ),
    );
  }

  /// À appeler uniquement APRÈS la confirmation d'une publication.
  void afficher() {
    final pub = _pub;
    if (pub == null) return;
    _pub = null;
    pub.fullScreenContentCallback = FullScreenContentCallback(
      onAdDismissedFullScreenContent: (ad) {
        unawaited(ad.dispose());
        charger();
      },
      onAdFailedToShowFullScreenContent: (ad, _) => unawaited(ad.dispose()),
    );
    unawaited(pub.show());
  }
}

final serviceInterstitielProvider = Provider<ServiceInterstitiel>(
  (ref) => ServiceInterstitiel()..charger(),
);
