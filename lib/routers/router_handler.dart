import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/pages/details_page.dart';
import 'package:fluro/fluro.dart';

Handler detailsHander = Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params){
    String goodsId = params['id'].first;
    print('index>details goodsID is ${goodsId}');
    return DetailsPage(goodsId);
  }
);
