import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'package:flutter_ecommerce/model/cart_Info.dart';

class CartProvide extends ChangeNotifier {
  String cartString = "[]";
  List<CartInfoModel> cartList = [];
  double allPrice = 0; //购物车里的总价格
  int allGoodsCount = 0; //商品数量

  save(goodsId, goodsName, count, price, images) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    cartString = prefs.getString("cartInfo"); // 获取数据
    // 先判断cartString 是否为空
    var temp = cartString == null ? [] : json.decode(cartString.toString());
    //将获得值转为list
    List<Map> tempList = (temp as List).cast();
    // 申明变量，作为初始的判断,判断购物车中是否已存在此商品ID
    var isHave = false;
    int iVal = 0; // 用于进行循环的索引使用
    tempList.forEach((item) {
      // 如果存在，数量进行+1
      if (item['goodsId'] == goodsId) {
        tempList[iVal]['count'] = item['count'] + 1;
        cartList[iVal].count;
        isHave = true;
      }
      iVal++;
    });
    // 购物车没有该商品数据
    if (!isHave) {
      Map<String, dynamic> newGoods = {
        'goodsId': goodsId,
        'goodsName': goodsName,
        'count': count,
        'price': price,
        'images': images,
        'isCheck': true // 是否已选择
      };
      tempList.add(newGoods);
      cartList.add(new CartInfoModel.fromJson(newGoods));
    }
    // 把字符串进行encode操作
    cartString = json.encode(tempList).toString();
    print(cartString);
    prefs.setString('cartInfo', cartString); // 持久化数据
  }

  remove() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('cartInfo');
    print('清空完成');
    notifyListeners();
  }

  getCartInfo() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // 得到购物车中的商品
    cartString = prefs.getString('cartInfo');
    // 初始化cartList
    cartList = [];
    // 判断是否有值
    if (cartList == null) {
      cartList = [];
    } else {
      // 映射成对象转list，再转List<Map>
      List<Map> tempList = (json.encode(cartString.toString()) as List).cast();
      allPrice = 0;
      allGoodsCount = 0;
      // 遍历
      tempList.forEach((item) {
        if (item['isCheck']) {
          allPrice = (item['count'] * item['price']);
          allGoodsCount += item['count']; // 将所有物品加入购物车的数量相加
        }

        cartList.add(new CartInfoModel.fromJson(item));
      });
    }
    notifyListeners();
  }

  // 删除单个购物车商品
  deleteOneGoods(String goodsId) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    cartString = prefs.getString('cartInfo');
    List<Map> tempList = (json.encode(cartString.toString()) as List).cast();

    int tempIndex = 0;
    int delIndex = 0;
    tempList.forEach((item) {
      if (item['goodsId'] == goodsId) {
        delIndex = tempIndex;
      }
      tempIndex;
    });
    tempList.removeAt(delIndex);
    cartString = json.encode(tempList).toString();
    prefs.setString('cartInfo', cartString);
    // 删除后重新拉起购物车信息
    await getCartInfo();
  }

  changeCheckState(CartInfoModel cartInfo) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    cartString = prefs.getString('cartInfo');
    List<Map> tempList = (json.encode(cartString.toString()) as List).cast();
    int tempIndex = 0; // 循环使用的队列
    int changeIndex = 0;

    tempList.forEach((item) {
      if (item['goodsId'] == cartInfo.goodsId) {
        changeIndex = tempIndex;
      }
      tempIndex++;
    });
    tempList[changeIndex] = cartInfo.toJson(); //将对象转为map
  }
}
