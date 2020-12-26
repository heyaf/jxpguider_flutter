import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import './orderpage/order_cellContent.dart';

// ignore: camel_case_types
class OrderPages extends StatefulWidget {
  @override
  _OrderPagesState createState() => _OrderPagesState();
}

class _OrderPagesState extends State<OrderPages> {
  PageController _pageController;
  int nowIndex = 0;
  // ignore: missing_return
  var titlearray = ['全部', '未服务', '服务中', '已完成', '已取消'];

  @override
  void initState() {
    super.initState();
    _pageController = PageController(
      initialPage: 0, //默认在第几个
      viewportFraction: 1, // 占屏幕多少，1为占满整个屏幕
      keepPage: true, //是否保存当前 Page 的状态，如果保存，下次回复保存的那个 page，initialPage被忽略，
      //如果为 false 。下次总是从 initialPage 开始。
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: null,
          automaticallyImplyLeading: false,
          title: Text('订单'),
          shadowColor: Colors.white,
          elevation: 0.0,
        ),
        body: Container(
          color: Color.fromARGB(255, 245, 245, 245),
          child: Column(
            children: [
              buildMenuView(),
              Expanded(
                child: buidpageView(),
              )
            ],
          ),
        ));
  }

//目录View
  Widget buildMenuView() {
    return Container(
      color: Colors.white,
      child: Row(
        children: [
          menuBtnView(0),
          menuBtnView(1),
          menuBtnView(2),
          menuBtnView(3),
          menuBtnView(4),
        ],
      ),
    );
  }

//目录按钮
  Widget menuBtnView(int index) {
    return Container(
      height: ScreenUtil().setHeight(88),
      width: ScreenUtil().setWidth(750 / 5),
      child: Center(
        child: InkWell(
          onTap: () {
            setState(() {
              nowIndex = index;
              _pageController.animateToPage(index,
                  duration: Duration(milliseconds: 12),
                  curve: Curves.fastOutSlowIn);
            });
          },
          child: Text(
            titlearray[index],
            style: TextStyle(
                color: (index == nowIndex) ? Colors.black : Colors.grey,
                fontFamily: (index == nowIndex)
                    ? 'PingFang-SC-Bold'
                    : 'PingFang-SC-Medium',
                fontSize: ScreenUtil().setSp(30.0)),
          ),
        ),
      ),
    );
  }

//主子视图
  Widget buidpageView() {
    return PageView(
      scrollDirection: Axis.horizontal,
      reverse: false,
      controller: _pageController,
      physics: BouncingScrollPhysics(),
      pageSnapping: true,
      onPageChanged: (index) {
        setState(() {
          nowIndex = index;
        });
        print('index=====$index');
      },
      children: <Widget>[
        pageViewContentView(0),
        pageViewContentView(1),
        pageViewContentView(2),
        pageViewContentView(3),
        pageViewContentView(4),
      ],
    );
  }

//pageView子视图
  Widget pageViewContentView(int index) {
    return ListView.builder(
        itemCount: 10,
        itemBuilder: (BuildContext build, int index1) {
          return OrderContentCell();
        });
  }
}
