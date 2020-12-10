import 'package:flutter/material.dart';
import '../Pages/home_pages.dart';
import '../Pages/order_pages.dart';
import '../Pages/message_pages.dart';
import '../Pages/mine_pages.dart';
import 'package:flutter/cupertino.dart';

class bottomTabbar extends StatefulWidget {
  @override
  _bottomTabbarState createState() => _bottomTabbarState();
}

class _bottomTabbarState extends State<bottomTabbar> {
  final List<BottomNavigationBarItem> bottombarList = [
    BottomNavigationBarItem(icon: Icon(CupertinoIcons.home), title: Text('首页')),
    BottomNavigationBarItem(
        icon: Icon(Icons.add_shopping_cart), title: Text('订单')),
    BottomNavigationBarItem(icon: Icon(CupertinoIcons.book), title: Text('消息')),
    BottomNavigationBarItem(
        icon: Icon(CupertinoIcons.plus_circled), title: Text('我的')),
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
    return Scaffold(
      backgroundColor: Color.fromRGBO(245, 245, 245, 1),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.blue,
        selectedItemColor: Colors.red,
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
