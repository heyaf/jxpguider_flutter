import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OrderContentCell extends StatefulWidget {
  @override
  _OrderContentCellState createState() => _OrderContentCellState();
}

class _OrderContentCellState extends State<OrderContentCell> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenUtil().setHeight(450),
      margin: EdgeInsets.fromLTRB(15, 15, 15, 0),
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: Column(
        children: [
          headerScenicView(),
          SizedBox(
            height: 15,
          ),
          buildCenterUserInfo(),
          SizedBox(
            height: 15,
          ),
          introduceInfo('集合地点', '清明上河园北门'),
          SizedBox(
            height: 15,
          ),
          introduceInfo('游玩人数', '1人'),
          SizedBox(
            height: 15,
          ),
          introduceInfo('金额', '￥200'),
          SizedBox(
            height: 15,
          ),
          SizedBox(
            height: 20,
          ),
          bottomWidget()
        ],
      ),
    );
  }

//头部景区信息
  Widget headerScenicView() {
    return Row(
      children: [
        Image.asset(
          'asset/images/home_icon/ddlb_yyd_bq@3x.png',
          width: ScreenUtil().setWidth(96),
          height: ScreenUtil().setHeight(40),
        ),
        SizedBox(
          width: 10,
        ),
        Text(
          '清明上河源',
          style: TextStyle(
              color: Color.fromARGB(255, 51, 51, 51),
              fontSize: ScreenUtil().setSp(30)),
        ),
        Expanded(child: Container()),
        Text(
          '已接单',
          style: TextStyle(
              color: Color.fromARGB(255, 102, 204, 128),
              fontSize: ScreenUtil().setSp(26)),
        ),
      ],
    );
  }

  //中间用户信息
  Widget buildCenterUserInfo() {
    return Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: Image.network(
            'https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fn.sinaimg.cn%2Fsinacn19%2F0%2Fw400h400%2F20180910%2F3391-hiycyfw5413589.jpg&refer=http%3A%2F%2Fn.sinaimg.cn&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1611406672&t=b12cdca79b682ab47822707f37204d30',
            width: 32,
            height: 32,
          ),
        ),
        SizedBox(
          width: 10,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '速趴塞牙人',
              style: TextStyle(
                  color: Color.fromARGB(255, 51, 51, 51),
                  fontSize: ScreenUtil().setSp(30)),
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              '2020.12.25 22:00',
              style: TextStyle(
                  color: Color.fromARGB(255, 153, 153, 153),
                  fontSize: ScreenUtil().setSp(24)),
            ),
          ],
        ),
        Expanded(child: Container()),
        InkWell(
            onTap: () {
              print('联系TA');
            },
            child: Container(
              width: 90,
              height: 30,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(width: 0.5, color: Color(0xFF66CC80))),
              child: Center(
                child: Text(
                  '联系TA',
                  style: TextStyle(
                      color: Color.fromARGB(255, 102, 204, 128),
                      fontSize: ScreenUtil().setSp(26)),
                ),
              ),
            ))
      ],
    );
  }

//介绍信息
  Widget introduceInfo(String title, String info) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
              fontSize: ScreenUtil().setSp(26), color: Color(0xff999999)),
        ),
        Text(
          info,
          style: TextStyle(
              fontSize: ScreenUtil().setSp(26), color: Color(0xff333333)),
        )
      ],
    );
  }

//底部按钮
  Widget bottomWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        picAndTextButton('asset/images/home_icon/home_button_bg@3x.png', '已到达'),
      ],
    );
  }

  //带背景图和文字的按钮
  Widget picAndTextButton(String imgpath, String text) {
    return Container(
      width: 92,
      height: 30,
      decoration: BoxDecoration(
        color: Colors.white,
        image: DecorationImage(image: AssetImage(imgpath), fit: BoxFit.fill),
      ),
      alignment: Alignment.center,
      child: FlatButton(
        onPressed: () {
          print('已到达点击');
        },
        child: Text(
          text,
          style: TextStyle(color: Colors.white, fontSize: 14),
        ),
        color: Colors.transparent,
      ),
    );
  }
}
