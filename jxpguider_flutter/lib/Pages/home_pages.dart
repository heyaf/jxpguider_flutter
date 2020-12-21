// import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'homepage/home_cellContent.dart';

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
  int selectIndex = 0;

  @override
  _MainWidgetState createState() => _MainWidgetState();
}

class _MainWidgetState extends State<MainWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        // ignore: missing_return
        child: ListView.builder(
            itemCount: 10,
            itemBuilder: (BuildContext context, int index) {
              if (index == 0) {
                return swipperWidget();
              }
              if (index == 1) {
                return HomeCenterButtonWidget();
              }
              return homeCellWidget().cellWidget();
            }));
  }

//轮播图
  Widget swipperWidget() {
    return Container(
        height: ScreenUtil().setHeight(194 * 2 + 10),
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

//中间切换widget
  Widget HomeCenterButtonWidget() {
    return Container(
        padding: EdgeInsets.fromLTRB(15, 20, 15, 10),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  height: 20,
                  child: MaterialButton(
                    padding: EdgeInsets.only(right: 15),
                    onPressed: () {
                      setState(() {
                        widget.selectIndex = 0;
                      });
                    },
                    child: Text(
                      '实时单',
                      style: TextStyle(
                        color: Color.fromARGB(255, 51, 51, 51),
                        fontSize: widget.selectIndex == 0 ? 18 : 15,
                        fontFamily: 'PingFang-SC-Medium',
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 20,
                  child: MaterialButton(
                    padding: EdgeInsets.only(right: 1.0),
                    onPressed: () {
                      setState(() {
                        widget.selectIndex = 1;
                      });
                    },
                    child: Text(
                      '预约单',
                      style: TextStyle(
                        color: Color.fromARGB(255, 51, 51, 51),
                        fontSize: widget.selectIndex == 1 ? 18 : 15,
                        fontFamily: 'PingFang-SC-Medium',
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    height: 10,
                  ),
                ),
                Container(
                  width: ScreenUtil().setWidth(160),
                  child: InkWell(
                    child: Row(
                      children: [
                        Image.asset(
                          'asset/images/home_icon/home_set_up_the@3x.png',
                          width: 16,
                          height: 16,
                        ),
                        SizedBox(
                          height: 10,
                          width: 5,
                        ),
                        Text(
                          '接单设置',
                          style:
                              TextStyle(fontSize: 14, color: Color(0XFF333333)),
                        )
                      ],
                    ),
                    onTap: () {
                      print('点击了接单设置');
                    },
                  ),
                )
              ],
            ),
            Row(
              children: [
                SizedBox(
                  width: widget.selectIndex == 0 ? 0 : 60,
                  height: 1,
                ),
                Image.asset(
                  'asset/images/home_icon/home_slider@3x.png',
                  width: 60,
                  height: 8,
                ),
              ],
            )
          ],
        ));
  }
}
