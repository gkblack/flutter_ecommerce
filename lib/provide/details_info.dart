import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/model/details.dart';
import 'package:flutter_ecommerce/config/service_method.dart';
import 'dart:convert';

class DetailsInfoProvide with ChangeNotifier{
  DetailsModel goodsInfo = null;
  
  getGoodsInfo(String id){
    var formData = {'goodId':id,};
    
    request('getGoodDetailById', formData: formData).then((val){
      var responseData = json.decode(val.toString());
      print(responseData);
      goodsInfo = DetailsModel.fromJson(responseData);
      notifyListeners();
    });
  }
}