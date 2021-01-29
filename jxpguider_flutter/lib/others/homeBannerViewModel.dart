import 'package:flutter/material.dart';
import 'package:jxpguider_flutter/config/homebannerRequest.dart';
import 'package:jxpguider_flutter/others/Model/hyfhomebanner_model.dart';

class HYFHomeBannerViewModel extends ChangeNotifier {
  List<HYFHomeBannerModel> _banner = [];

  List<HYFHomeBannerModel> get banner {
    return _banner;
  }

  HYFHomeBannerViewModel() {
    HYFHomeBannerReQuest.gethomebanner().then((value) {
      _banner.addAll(value);
      notifyListeners();
    });
  }
}
