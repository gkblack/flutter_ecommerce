import 'package:flutter/material.dart';
import 'package:provide/provide.dart';
import 'package:flutter_ecommerce/provide/details_info.dart';
import 'details_page/details_bottom.dart';
import 'details_page/details_top_area.dart';
import 'package:flutter_ecommerce/pages/details_page/details_explain.dart';
import 'details_page/details_tabbar.dart';
import 'package:flutter_ecommerce/pages/details_page/details_web.dart';

// 商品详情页
class DetailsPage extends StatelessWidget {
  final String goodsId;

  DetailsPage(this.goodsId);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('商品详细页'),
        leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            }),
      ),
      body: FutureBuilder(
          future: _getGoodsInfo(context),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Stack(
                children: <Widget>[
                  SingleChildScrollView(
                      child: Column(
                    children: <Widget>[
                      DatailsTopArea(),
                      DetailsExplain(),
                      DetailsTabBar(),
                      DetailsWeb(),
                    ],
                  )),
                  Positioned(bottom: 0, left: 0, child: DetailsBottom())
                ],
              );
            } else {
              return Center(
                child: Text('加载中......'),
              );
            }
          }),
    );
  }

  Future _getGoodsInfo(BuildContext context) async {
    await Provide.value<DetailsInfoProvide>(context)
        .getGoodsDetailInfo(goodsId);
    return '完成加载';
  }
}
