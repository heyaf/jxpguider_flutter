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
          child: Column(
            children: [
              Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.fromLTRB(15, 5, 15, 9),
                child: Text(
                  '清明上河园',
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'PingFang-SC-Bold',
                      fontWeight: FontWeight.w500,
                      fontSize: ScreenUtil().setSp(34)),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
