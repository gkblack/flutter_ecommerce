import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/model/category_goods_list.dart';
import 'package:flutter_ecommerce/model/category_big.dart';

class CategoryGoodsListProvide with ChangeNotifier{

  List<CategoryListData> goodsList = [];
  List<CategoryBigModel> orderList = [];
//dynamic
  getGoodsList(List<CategoryListData> list){
//    // 将动态list转为BxMallSubDto类型的list
//    List<CategoryListData> li = [];
//    for(var i=0;i<list.length;i++){
//      li.add(CategoryListData.fromJson(list[i]));
//    }
    goodsList = list;
    notifyListeners();
  }

  addGoodsList( List<CategoryBigModel> list){
    orderList = list;
    notifyListeners();
  }
}