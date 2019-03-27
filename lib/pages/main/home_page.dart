import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:dio/dio.dart';
import 'dart:convert';
import 'package:flutter_ecommerce/config/service_method.dart';
import 'package:flutter_ecommerce/widget/swiper_diy.dart';
import 'package:flutter_ecommerce/widget/ad_banner.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage>
    with AutomaticKeepAliveClientMixin {
  // AutomaticKeepAliveClientMixin 页面状态保持，避免每次切换页面都要重新加载,只适用于StatefulWidget
  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: 750, height: 1334)..init(context);
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: Text("life"),
        ),
        body: SingleChildScrollView(
            child: FutureBuilder(
                // FutureBuilder用來解决异步渲染的问题
                future: getHomePageData(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    var data =
                        json.decode(snapshot.data.toString()); // 拿到返回的json數據
                    List<Map> swiperDataList =
                        (data['data']['slides'] as List).cast(); // 顶部轮播图数量
                    List<Map> navigatorList =
                        (data['data']['category'] as List).cast(); // 类别列表
                    String advertesPicture = data['data']['advertesPicture']
                        ['PICTURE_ADDRESS']; // 广告
                    String leaderImage =
                        data['data']['shopInfo']['leaderImage'];
                    String leaderPhone =
                        data['data']['shopInfo']['leaderPhone'];
                    List<Map> recommendList =
                        (data['data']['recommend'] as List).cast();
                    String floor1Title =
                        data['data']['floor1Pic']['PICTURE_ADDRESS'];
                    String floor2Title =
                        data['data']['floor2Pic']['PICTURE_ADDRESS'];
                    String floor3Title =
                        data['data']['floor3Pic']['PICTURE_ADDRESS'];
                    List<Map> floor1 = (data['data']['floor1'] as List).cast();
                    List<Map> floor2 = (data['data']['floor2'] as List).cast();
                    List<Map> floor3 = (data['data']['floor3'] as List).cast();
                    if (navigatorList.length > 10) {
                      navigatorList.removeRange(
                          10, navigatorList.length); // 截取掉后面不需要的数据
                    }
                    return Column(
                      children: <Widget>[
                        SwiperDiy(swiperDataList: swiperDataList), // 轮播
                        TopNavigator(navigatorList: navigatorList), //导航组件
                        AdBanner(
                          advertesPicture: advertesPicture,
                        ),
                        LeaderPhone(
                          leaderImage: leaderImage,
                          leaderPhone: leaderPhone,
                        ),
                        Recommend(
                          recommendList: recommendList,
                        ),
                        FloorTitle(
                          floorTitle: floor1Title,
                        ),
                        FloorData(
                          floorGoodsList: floor1,
                        ),
                        FloorTitle(
                          floorTitle: floor2Title,
                        ),
                        FloorData(
                          floorGoodsList: floor2,
                        ),
                        FloorTitle(
                          floorTitle: floor3Title,
                        ),
                        FloorData(
                          floorGoodsList: floor3,
                        ),
                      ],
                    );
                  } else {
                    return Center(
                      child: Text("加载中"),
                    );
                  }
                })));
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true; // 保持存活
}

class TopNavigator extends StatelessWidget {
  final List navigatorList;

  TopNavigator({Key key, this.navigatorList}) : super(key: key);

  Widget _gridViewItem(BuildContext context, item) {
    return InkWell(
      // InkWell控件有点击水波纹效果
      onTap: () {
        print('clicked navigator');
      },
      child: Column(
        children: <Widget>[
          Image.network(
            item['image'],
            width: ScreenUtil().setWidth(95),
          ),
          Text(item['mallCategoryName'])
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      height: ScreenUtil().setHeight(320),
      padding: EdgeInsets.all(3.0),
      child: GridView.count(
          crossAxisCount: 5,
          padding: EdgeInsets.all(4.0),
          children: navigatorList.map((item) {
            // 通过map循环后再tolist
            return _gridViewItem(context, item);
          }).toList()),
    );
  }
}

// 店长电话
class LeaderPhone extends StatelessWidget {
  final String leaderPhone;
  final String leaderImage;

  LeaderPhone({Key key, this.leaderImage, this.leaderPhone}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: InkWell(
        onTap: _launchUrl,
        child: Image.network(leaderImage),
      ),
    );
  }

  void _launchUrl() async {
//    String url = 'tel:' + leaderPhone;
    String url = 'tel:' + '18011111111';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw '調取撥打電話功能失敗 $url';
    }
  }
}

// 商品推薦
class Recommend extends StatelessWidget {
  List<Map> recommendList;

  Recommend({Key key, this.recommendList}) : super(key: key);

  Widget _titleWidget() {
    return Container(
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.fromLTRB(10.0, 2.0, 0, 5.0),
      decoration: BoxDecoration(
          color: Colors.white,
          border:
              Border(bottom: BorderSide(width: 0.5, color: Colors.black12))),
      child: Text(
        '商品推荐',
        style: TextStyle(color: Colors.pink),
      ),
    );
  }

  Widget _recommedList() {
    return Container(
      height: ScreenUtil().setHeight(330),
      child: ListView.builder(
          scrollDirection: Axis.horizontal, // 设置水平布局滑动,不设置则默认为垂直，同时显示越界
          itemCount: recommendList.length,
          itemBuilder: (context, index) {
            return _item(index);
          }),
    );
  }

  Widget _item(index) {
    return InkWell(
      onTap: () {},
      child: Container(
        height: ScreenUtil().setHeight(330),
        width: ScreenUtil().setWidth(250),
        padding: EdgeInsets.all(8.0),
        decoration: BoxDecoration(
            color: Colors.white,
            border:
                Border(left: BorderSide(width: 0.5, color: Colors.black12))),
        child: Column(
          children: <Widget>[
            Image.network(recommendList[index]['image']),
            Text('￥${recommendList[index]['mallPrice']}'),
            Text(
              '￥${recommendList[index]['price']}',
              style: TextStyle(
                  decoration: TextDecoration.lineThrough, color: Colors.grey),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.fromLTRB(10.0, 3.0, 10.0, 3.0),
      child: Column(
        children: <Widget>[
          _titleWidget(),
          _recommedList(),
        ],
      ),
    );
  }
}

// 楼层标题图片
class FloorTitle extends StatelessWidget {
  final String floorTitle;

  FloorTitle({Key key, this.floorTitle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      padding: EdgeInsets.all(8.0),
      child: Image.network(floorTitle),
    );
  }
}

// 楼层商品信息
class FloorData extends StatelessWidget {
  final List floorGoodsList;

  FloorData({Key key, this.floorGoodsList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: Column(
        children: <Widget>[
          _firstRow(),
          _otherGoods(),
        ],
      ),
    );
  }

  Widget _firstRow() {
    return Row(
      children: <Widget>[
        Column(
          children: <Widget>[
            _goodsItem(floorGoodsList[1]),
            _goodsItem(floorGoodsList[2])
          ],
        )
      ],
    );
  }

  Widget _otherGoods() {
    return Row(
      children: <Widget>[
        _goodsItem(floorGoodsList[3]),
        _goodsItem(floorGoodsList[4]),
      ],
    );
  }

  Widget _goodsItem(Map goods) {
    return Container(
      width: ScreenUtil().setWidth(375),
      child: InkWell(
        onTap: () {
          print('goods_Click');
        },
        child: Image.network(goods['image']),
      ),
    );
  }
}

class HotGoods extends StatefulWidget{

  _HotGoodsState createState() => _HotGoodsState();

}

class _HotGoodsState extends State<HotGoods>{

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: Text('1111'),
    );
  }

}
