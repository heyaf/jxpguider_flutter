import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:jxpguider_flutter/others/Model/hyfhomebanner_model.dart';
import 'package:jxpguider_flutter/others/homeBannerViewModel.dart';
import 'package:provider/provider.dart';

class HomeBannerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<HYFHomeBannerViewModel>(
        builder: (context, hyfBannerViewModel, child) {
      List<HYFHomeBannerModel> bannerList = hyfBannerViewModel.banner;
      return Container(
          height: ScreenUtil().setHeight(194 * 2 + 10),
          width: ScreenUtil().setWidth(750),
          child: Center(
            child: Container(
              height: ScreenUtil().setHeight(194 * 2),
              width: ScreenUtil().setWidth(690),
              child: Swiper(
                itemCount: bannerList.length,
                itemBuilder: (context, index) {
                  return Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10.0),
                        ),
                        image: DecorationImage(
                          image: NetworkImage(
                            bannerList[index].bannerUrl,
                          ),
                          fit: BoxFit.cover,
                        )),
                  );
                },
                pagination: SwiperPagination(
                    builder: DotSwiperPaginationBuilder(
                        color: Color.fromRGBO(230, 230, 230, 1),
                        size: 10.0,
                        activeSize: 12.0)),
                autoplay: true,
                scale: 0.9,
              ),
            ),
          ));
    });
  }
}
