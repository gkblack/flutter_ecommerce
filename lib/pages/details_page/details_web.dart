import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:provide/provide.dart';
import 'package:flutter_ecommerce/provide/details_info.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// 设置
class DetailsWeb extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    var goodsDetail = Provide.value<DetailsInfoProvide>(context).goodsInfo.data.goodInfo.goodsDetail;
    // TODO: implement build
    return Provide<DetailsInfoProvide>(
      builder: (context, child, val){
        var isLeft = Provide.value<DetailsInfoProvide>(context).isLeft;
        if(isLeft){
          return Container(
            child: Html(data: goodsDetail),
          );
        }else{
          return Container(
            width: ScreenUtil().setWidth(750),
            padding: EdgeInsets.all(8.0),
            alignment: Alignment.center,
            child: Text('暂无数据'),
          );
        }
      },
    );
  }



}