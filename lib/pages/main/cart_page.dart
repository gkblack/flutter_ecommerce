import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/provide/cart.dart';
import 'package:provide/provide.dart';
import 'package:flutter_ecommerce/pages/cart_page/cart_bottom.dart';
import 'package:flutter_ecommerce/pages/cart_page/cart_item.dart';

//stful 快速生成 购物车
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
              print('cartPage-load');
              List cartList = Provide.value<CartProvide>(context).cartList;
              if (snapshot.hasData && cartList != null) {
                return Stack(
                  children: <Widget>[
                    Provide<CartProvide>(
                      builder: (context, child, childCategory) {
                        cartList = Provide.value<CartProvide>(context).cartList;
                        print(cartList);
                        return ListView.builder(
                            itemCount: cartList.length,
                            itemBuilder: (context, index) {
                              return CartItem(cartList[index]);
                            });
                      },
                    ),
                    Positioned(
                      bottom: 0,
                      left: 0,
                      child: CartBottom(),
                    )
                  ],
                );
              } else {
                return Center(child: Text('正在加载'));
              }
            }));
  }

  Future<String> _getCartInfo(BuildContext context) async {
    await Provide.value<CartProvide>(context).getCartInfo();
    return 'end';
  }
}
