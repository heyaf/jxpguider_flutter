import 'package:jxpguider_flutter/config/configRequest.dart';
import 'package:jxpguider_flutter/config/configUrl.dart';
import 'package:jxpguider_flutter/others/Model/hyfhomebanner_model.dart';

class HYFHomeBannerReQuest {
  static Future<List<HYFHomeBannerModel>> gethomebanner() async {
    final homebannerUrl = servicePath['homebannerContent'];

    List<HYFHomeBannerModel> listModel = [];
    final result = await HttpRequest.request(homebannerUrl);
    //将map中的内容转为对象（model）
    final List list = result["response"]["data"];
    for (var json in list) {
      listModel.add(HYFHomeBannerModel.fromJson(json));
    }
    return listModel;
  }
}
