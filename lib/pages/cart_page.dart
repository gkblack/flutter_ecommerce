import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/provide/cart.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:provide/provide.dart';
import 'cart_page/cart_bottom.dart';
import 'cart_page/cart_item.dart';

//stful 快速生成
class CartPage extends StatelessWidget {
  List<String> cartList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('购物车'),
        ),
        body: FutureBuilder(
            future: _getCartInfo(context),
            builder: (context, snapshot) {
              List cartList = Provide.value<CartProvide>(context).cartList;
              if(snapshot.hasData && cartList!=null) {
                return Stack(
                  children: <Widget>[
                    Provide<CartProvide>(
                      builder: (context, child, childCategory){
                        cartList = Provide.value<CartProvide>(context).cartList;
                        print(cartList);
                        return  ListView.builder(
                            itemCount: cartList.length,
                            itemBuilder: (context,index){
                              return CartItem(cartList[index]);
                            });
                      },
                    ),

                    Positioned(
                      bottom: 0,
                      left: 0,
                      child: CartBottom(),
                    )
//                    Column(
//                      children: <Widget>[
//                        Container(
//                          height: 500.0,
//                          child: ListView.builder(
//                              itemCount: cartList.length,
//                              itemBuilder: (context, index) {
//                                return ListTile(
//                                  title: Text(cartList[index]),
//                                );
//                              }),
//                        ),
//                      ],
//                    ),
                  ],
                );
              }else{
                return Text('正在加载');
              }
            }));
  }

  Future<String> _getCartInfo(BuildContext context) async {
    await Provide.value<CartProvide>(context).getCartInfo();
    return 'end';
  }

//  void _add() async{
//    SharedPreferences prefs = await SharedPreferences.getInstance();
//    String temp = '设置';
//    cartList.add(temp);
//    prefs.setStringList("cartInfo", cartList);
//  }
//
//  void _show() async{
//    SharedPreferences prefs = await SharedPreferences.getInstance();
//    setState(() {
//      List<String> pList = prefs.getStringList("cartInfo");
//      if(pList != null){
//        cartList = pList;
//      }
//    });
//  }
//
//  void _clear() async{
//    SharedPreferences prefs = await SharedPreferences.getInstance();
//    prefs.remove("cartInfo");
//    setState(() {
//      cartList = [];
//    });
//  }
}
