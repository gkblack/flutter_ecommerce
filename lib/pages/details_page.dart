import 'package:flutter/material.dart';
import 'package:provide/provide.dart';
import 'package:flutter_ecommerce/provide/details_info.dart';
import 'details_page/details_top_area.dart';

class DetailsPage extends StatelessWidget {
  final String goodsId;

  DetailsPage(this.goodsId);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('商品详细页'),
        leading: IconButton(icon: Icon(Icons.arrow_back), onPressed: () {
          print('返回上一页');
          Navigator.pop(context);
        }),
      ),
      body: FutureBuilder(
        future: _getBackInfo(context),
          builder: (context, snapshot){
        if(snapshot.hasData){
          return Container(
            child: Column(
              children: <Widget>[
                DatailsTopArea(),
              ],
            ),
          );
        }else{
          return Text('加载中.........');
        }
      }),
    );
  }

  Future _getBackInfo(BuildContext context) async{
    await Provide.value<DetailsInfoProvide>(context).getGoodsInfo(goodsId);
    return '完成加载';
  }

}