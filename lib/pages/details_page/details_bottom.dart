import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_ecommerce/provide/current_index.dart';
import 'package:provide/provide.dart';

// 购物车底部 ，添加或购买
class DetailsBottom extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      width: ScreenUtil().setWidth(750),
      color: Colors.white,
      height: ScreenUtil().setHeight(80),
      child: Row(
        children: <Widget>[
          Stack(
            children: <Widget>[
              InkWell(
                onTap: (){
                  // 跳转到购物车页面
                  Provide.value<CurrentIndexProvide>(context).changeIndex(2);
                  Navigator.pop(context);
                },
                child: Container(
                  width: ScreenUtil().setWidth(110),
                  alignment: Alignment.center,
                  child: Icon(
                    Icons.shopping_cart,
                    size: 35,
                    color: Colors.red,
                  ),
                ),
              ),
              InkWell(
                onTap: (){

                },
                child: Container(
                  alignment: Alignment.center,
                  width: ScreenUtil().setWidth(320),
                  height: ScreenUtil().setHeight(80),
                  color: Colors.green,
                  child: Text('加入购物车',
                    style: TextStyle(color: Colors.white, fontSize: ScreenUtil().setSp(28)),),
                ),
              ),
              InkWell(
                onTap: (){

                },
                child: Container(
                  alignment: Alignment.center,
                  width: ScreenUtil().setWidth(320),
                  height: ScreenUtil().setHeight(80),
                  color: Colors.red,
                  child: Text(
                    '立即购买',
                    style: TextStyle(color: Colors.white,fontSize: ScreenUtil().setSp(28)),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }

}