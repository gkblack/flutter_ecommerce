import 'package:flutter/material.dart';
import 'package:provide/provide.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// 会员中心
class MemberPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: Text('title'),
        ),
        body: ListView(
          children: <Widget>[
            _topHeader(),
            _orderTitle(),
            _orderType(),
            _actionList()
          ],
        ));
  }

  // 头像
  Widget _topHeader() {
    return Container(
        width: ScreenUtil().setWidth(750),
        padding: EdgeInsets.all(20),
        color: Colors.pinkAccent,
        child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: 30),
              child: ClipOval(child: Image.asset("images/ry.jpg")),
            ),
            Container(
              margin: EdgeInsets.only(top: 10),
              child: Text(
                'may',
                style: TextStyle(
                  fontSize: ScreenUtil().setSp(36),
                  color: Colors.white,
                ),
              ),
            )
          ],
        ));
  }

  // 标题
  Widget _orderTitle() {
    return Container(
      margin: EdgeInsets.only(top: 10),
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border(bottom: BorderSide(width: 1, color: Colors.black12))),
      child: ListTile(
        leading: Icon(Icons.list),
        title: Text('my order'),
      ),
    );
  }

  Widget _orderType(){
    return Container(
      margin: EdgeInsets.only(top: 10),
      width: ScreenUtil().setWidth(750),
      height: ScreenUtil().setHeight(150),
      child: Row(
        children: <Widget>[
          Container(
            width: ScreenUtil().setWidth(187),
            child: Column(
              children: <Widget>[
                Icon(
                  Icons.party_mode,
                  size: 30,
                ),
                Text('wait pay')
              ],
            ),
          ),
          Container(
            width: ScreenUtil().setWidth(187),
            child: Column(
              children: <Widget>[
                Icon(
                  Icons.query_builder,
                  color: Colors.grey,
                  size: 30,
                ),
                Text('等待发货')
              ],
            ),
          ),
          Container(
            width: ScreenUtil().setWidth(187),
            child: Column(
              children: <Widget>[
                Icon(
                  Icons.directions_car,
                  size: 30,
                ),
                Text('待收货')
              ],
            ),
          ),
          Container(
            width: ScreenUtil().setWidth(187),
            child: Column(
              children: <Widget>[
                Icon(
                  Icons.content_paste,
                  size: 30,
                ),
                Text('待评价')
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _myListTitle(String title){
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          bottom: BorderSide(
            width: 1,
            color: Colors.black12
          )
        )
      ),
      child: ListTile(
        leading: Icon(Icons.blur_circular),
        title: Text(title),
        trailing: Icon(Icons.arrow_right),
      )
    );
  }

  Widget _actionList(){
    return Container(
      margin: EdgeInsets.only(top: 10),
      child: Column(
        children: <Widget>[
          _myListTitle('领取优惠券'),
          _myListTitle('已领取优惠券'),
          _myListTitle('地址管理'),
          _myListTitle('客服电话'),
          _myListTitle('关于')
        ],
      ),
    );
  }
}
