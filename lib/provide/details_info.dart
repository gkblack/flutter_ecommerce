import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/model/details.dart';
import 'package:flutter_ecommerce/config/service_method.dart';

// 商品详情页对应 provide
class DetailsInfoProvide with ChangeNotifier {
  DetailsModel goodsInfo;
  bool isLeft = true;
  bool isRight = false;

  // 商品详情
  getGoodsDetailInfo(String id) async {
    var formData = {
      'goodId': id,
    };
    await request('getGoodDetailById', formData: formData,).then((val) {
      var data = json.decode(val.toString());
      goodsInfo = DetailsModel.fromJson(data);
      print('getGoodDetailById_goodsInfo${goodsInfo.data}');
      notifyListeners();
    });
  }

  // 更改tabbar的状态
  changeLeftAndRight(String changeState) {
    if (changeState == 'left') {
      isLeft = true;
      isRight = false;
    } else {
      isLeft = false;
      isRight = true;
    }
    notifyListeners();
  }
}
