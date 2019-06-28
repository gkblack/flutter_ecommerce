import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_ecommerce/provide/current_index.dart';
import 'package:provide/provide.dart';
import 'package:flutter_ecommerce/provide/cart.dart';
import 'package:flutter_ecommerce/provide/details_info.dart';

// 购物车底部 ，添加或购买
class DetailsBottom extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    var goodsInfo = Provide.value<DetailsInfoProvide>(context).goodsInfo.data.goodInfo;
    var goodsId = goodsInfo.goodsId;
    var goodsName = goodsInfo.goodsName;
    var count = 1;
    var goodsPrice = goodsInfo.presentPrice;
    var goodsPic = goodsInfo.comPic;
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
                      Provide.value<CurrentIndexProvide>(context).changeIndex(2);
                      Navigator.pop(context);
                    },
                    child: Container(
                      width: ScreenUtil().setWidth(110) ,
                      alignment: Alignment.center,
                      child:Icon(
                        Icons.shopping_cart,
                        size: 35,
                        color: Colors.red,
                      ),
                    ) ,
                  ),
                  Provide<CartProvide>(
                    builder: (context,child,val){
                      int  goodsCount = Provide.value<CartProvide>(context).allGoodsCount;
                      return  Positioned(
                        top:0,
                        right: 3,
                        child: Container(
                          padding:EdgeInsets.fromLTRB(6, 3, 6, 3),
                          decoration: BoxDecoration(
                              color:Colors.pink,
                              border:Border.all(width: 2,color: Colors.white),
                              borderRadius: BorderRadius.circular(12.0)
                          ),
                          child: Text(
                            '${goodsCount}',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: ScreenUtil().setSp(22)
                            ),
                          ),
                        ),
                      ) ;
                    },
                  )
                ],
              ),
              InkWell(
                onTap: (){
                  Provide.value<CartProvide>(context).save(goodsId, goodsName, count, goodsPrice, goodsPic);
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
      ),
    );
  }

}