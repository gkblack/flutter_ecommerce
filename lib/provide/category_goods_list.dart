import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/model/category_goods_list.dart';
import 'package:flutter_ecommerce/model/category_big.dart';

class CategoryGoodsListProvide with ChangeNotifier{

  List<CategoryListData> goodsList = [];
  getGoodsList(List<CategoryListData> list){
    goodsList = list;
    notifyListeners();
  }

  getMoreList( List<CategoryListData> list){
    goodsList.addAll(list);
    notifyListeners();
  }
}