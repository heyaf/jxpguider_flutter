import 'package:flutter/material.dart';
import '../Pages/home_pages.dart';
import '../Pages/order_pages.dart';
import '../Pages/message_pages.dart';
import '../Pages/mine_pages.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class bottomTabbar extends StatefulWidget {
  @override
  _bottomTabbarState createState() => _bottomTabbarState();
}

class _bottomTabbarState extends State<bottomTabbar> {
  final List<BottomNavigationBarItem> bottombarList = [
    BottomNavigationBarItem(
        activeIcon: Image.asset(
          'asset/images/home_icon/home_icon_selected@3x.png',
          width: 25,
          height: 25,
        ),
        icon: Image.asset(
          'asset/images/home_icon/home_icon_not_choose@3x.png',
          width: 25,
          height: 25,
        ),
        title: Text('首页')),
    BottomNavigationBarItem(
        activeIcon: Image.asset(
          'asset/images/home_icon/order_icon_selected@3x.png',
          width: 25,
          height: 25,
        ),
        icon: Image.asset(
          'asset/images/home_icon/order_icon_not_choose@3x.png',
          width: 25,
          height: 25,
        ),
        title: Text('订单')),
    BottomNavigationBarItem(
        activeIcon: Image.asset(
          'asset/images/home_icon/message_icon_selected@3x.png',
          width: 25,
          height: 25,
        ),
        icon: Image.asset(
          'asset/images/home_icon/message_icon_not_choose@3x.png',
          width: 25,
          height: 25,
        ),
        title: Text('消息')),
    BottomNavigationBarItem(
        activeIcon: Image.asset(
          'asset/images/home_icon/my_icon_selected@3x.png',
          width: 25,
          height: 25,
        ),
        icon: Image.asset(
          'asset/images/home_icon/my_icon_not_choose@3x.png',
          width: 25,
          height: 25,
        ),
        title: Text('我的')),
  ];
  final List<Widget> pageList = [
    HomePages(),
    OrderPages(),
    MessagePages(),
    MinePages(),
  ];

  int curretindex = 0;
  var currentPages;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    currentPages = pageList[curretindex];
    print('$curretindex' + '$currentPages');
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context,
        designSize: Size(750, 1334), allowFontScaling: false);
    return Scaffold(
      backgroundColor: Color.fromRGBO(245, 245, 245, 1),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        selectedFontSize: ScreenUtil().setSp(20),
        unselectedFontSize: ScreenUtil().setSp(20),
        elevation: 25,
        items: bottombarList,
        type: BottomNavigationBarType.fixed,
        currentIndex: curretindex,
        onTap: (value) {
          setState(() {
            curretindex = value;
            currentPages = pageList[curretindex];
          });
        },
      ),
      body: IndexedStack(
        index: curretindex,
        children: pageList,
      ),
    );
  }
}
