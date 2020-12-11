// import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class HomePages extends StatefulWidget {
  @override
  _HomePagesState createState() => _HomePagesState();
}

class _HomePagesState extends State<HomePages> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          '首页',
          style: TextStyle(
              fontFamily: 'PingFangSC-Regular',
              fontWeight: FontWeight.w400,
              fontSize: ScreenUtil().setSp(36),
              color: Color.fromRGBO(51, 51, 51, 1)),
        ),
        shadowColor: Colors.white,
        elevation: 0.0,
      ),
      body: MainWidget(),
    );
  }
}

class MainWidget extends StatefulWidget {
  List<String> imageList = [
    'https://qn.jxpapp.com/bannerbaogongci.png',
    'https://qn.jxpapp.com/bannerqingyuan.png',
    'https://qn.jxpapp.com/bannertieta.png'
  ];
  List<Widget> imageList1 = List();
  @override
  _MainWidgetState createState() => _MainWidgetState();
}

class _MainWidgetState extends State<MainWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          swipperWidget(),
        ],
      ),
    );
  }

  Widget swipperWidget() {
    return Container(
        height: ScreenUtil().setHeight(194 * 2 + 10 * 2),
        width: ScreenUtil().setWidth(750),
        child: Center(
          child: Container(
            height: ScreenUtil().setHeight(194 * 2),
            width: ScreenUtil().setWidth(690),
            child: Swiper(
              itemCount: 3,
              itemBuilder: (context, index) {
                return Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10.0),
                      ),
                      image: DecorationImage(
                        image: NetworkImage(
                          widget.imageList[index],
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
  }
}
