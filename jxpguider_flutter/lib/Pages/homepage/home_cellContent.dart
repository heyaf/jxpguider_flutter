import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: camel_case_types
class homeCellWidget {
  Widget cellWidget() {
    return Container(
      height: ScreenUtil().setHeight(342),
      width: ScreenUtil().setWidth(750),
      child: Center(
        child: Container(
            height: ScreenUtil().setHeight(282),
            width: ScreenUtil().setWidth(690),
            decoration: BoxDecoration(color: Colors.white, boxShadow: [
              BoxShadow(
                  color: Color.fromARGB(255, 237, 237, 237),
                  offset: Offset(0.0, 3.0), //阴影xy轴偏移量
                  blurRadius: 3.0, //阴影模糊程度
                  spreadRadius: 1.0 //阴影扩散程度
                  )
            ]),
            child: Container(
              padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.fromLTRB(0, 5, 15, 9),
                    child: Text(
                      '清明上河园',
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'PingFang-SC-Bold',
                          fontWeight: FontWeight.w500,
                          fontSize: ScreenUtil().setSp(34)),
                    ),
                  ),
                  Container(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(
                          'asset/images/home_icon/collection_site@3x.png',
                          height: 6,
                          width: 6,
                        ),
                        Container(
                          padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                          child: Text(
                            '集合地点：清明上河园西北门',
                            style: TextStyle(
                                color: Color.fromARGB(255, 153, 153, 153),
                                fontSize: ScreenUtil().setSp(26)),
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('￥200'),
                        picAndTextButton(
                            'asset/images/home_icon/home_button_bg@3x.png',
                            '抢单'),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 0.5,
                    color: Color.fromARGB(255, 237, 237, 237),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  buildCellUserInfo()
                ],
              ),
            )),
      ),
    );
  }

  //带背景图和文字的按钮
  Widget picAndTextButton(String imgpath, String text) {
    return Container(
      width: 90,
      height: 30,
      decoration: BoxDecoration(
        color: Colors.white,
        image: DecorationImage(image: AssetImage(imgpath), fit: BoxFit.fill),
      ),
      alignment: Alignment.center,
      child: FlatButton(
        onPressed: () {
          print('抢单按钮点击');
        },
        child: Text(
          text,
          style: TextStyle(color: Colors.white, fontSize: 14),
        ),
        color: Colors.transparent,
      ),
    );
  }

//底部用户信息
  Widget buildCellUserInfo() {
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
          width: 8,
        ),
        Text(
          '吃鱼的猫',
          style: TextStyle(
            fontSize: 17,
            color: Color.fromARGB(255, 51, 51, 51),
          ),
        ),
        Expanded(child: Container()),
        Text(
          '2020.12.24',
          style: TextStyle(
              color: Color.fromARGB(255, 179, 179, 179), fontSize: 14),
        )
      ],
    );
  }
}
