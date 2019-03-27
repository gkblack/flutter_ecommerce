import 'package:flutter/material.dart';

// 首页广告
class AdBanner extends StatelessWidget{
  final String advertesPicture;
  
  AdBanner({Key key, this.advertesPicture}) : super(key : key);
  
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: Image.network(advertesPicture),
    );
  }
  
}