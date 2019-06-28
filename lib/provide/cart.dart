import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'package:flutter_ecommerce/model/cart_Info.dart';

class CartProvide extends ChangeNotifier {
  String cartString = "[]";
  List<CartInfoModel> cartList = [];
  double allPrice = 0; //购物车里的总价格
  int allGoodsCount = 0; //商品数量
  bool isAllCheck = true;

  save(goodsId,goodsName,count,price,images) async{
    //初始化SharedPreferences
    SharedPreferences prefs = await  SharedPreferences.getInstance();
    cartString=prefs.getString('cartInfo');  //获取持久化存储的值
    var temp=cartString==null?[]:json.decode(cartString.toString());
    //把获得值转变成List
    List<Map> tempList= (temp as List).cast();
    //声明变量，用于判断购物车中是否已经存在此商品ID
    var isHave= false;  //默认为没有
    int ival=0; //用于进行循环的索引使用
    //-----------------关键代码---------start---------
    allPrice=0;
    allGoodsCount=0;  //把商品总数量设置为0
    //-----------------关键代码---------end---------
    tempList.forEach((item){//进行循环，找出是否已经存在该商品
      //如果存在，数量进行+1操作
      if(item['goodsId']==goodsId){
        tempList[ival]['count']=item['count']+1;
        cartList[ival].count++;
        isHave=true;
      }
      if(item['isCheck']){
        allPrice+= (cartList[ival].price* cartList[ival].count);
        allGoodsCount+= cartList[ival].count;
      }


      ival++;
    });
    //  如果没有，进行增加
    if(!isHave){
      Map<String, dynamic> newGoods={
        'goodsId':goodsId,
        'goodsName':goodsName,
        'count':count,
        'price':price,
        'images':images,
        'isCheck': true  //是否已经选择
      };
      tempList.add(newGoods);
      cartList.add(new CartInfoModel.fromJson(newGoods));
      allPrice+= (count * price);
      allGoodsCount+=count;
    }
    //把字符串进行encode操作，
    cartString= json.encode(tempList).toString();

    prefs.setString('cartInfo', cartString);//进行持久化
    notifyListeners();
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
      tempIndex++;
    });
    tempList.removeAt(delIndex);
    cartString = json.encode(tempList).toString();
    prefs.setString('cartInfo', cartString);
    // 删除某个商品后重新获取购物车信息
    await getCartInfo();
  }

  // 商品单选
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
    cartString = json.encode(tempList).toString(); // 转字符串
    prefs.setString('cartInfo', cartString);
    await getCartInfo(); // 在点击商品后重新统计并获取数据
  }

  // 商品数量加减
  addOrReduceAction(CartInfoModel cartItem, String todo) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    cartString = prefs.getString('cartInfo');
    List<Map> tempList = (json.decode(cartString.toString()) as List).cast();
    int tempIndex = 0;
    int changeIndex = 0;
    tempList.forEach((item){
      if(item['goodsId'] == cartItem.goodsId){
        changeIndex = tempIndex;
      }
    });
    if(todo == 'add'){
      cartItem.count++;
    }else if(cartItem.count>1){
      cartItem.count--;
    }
    tempList[changeIndex] =  cartItem.toJson();
    cartString = json.encode(tempList).toString();
    prefs.setString('cartInfo', cartString);
    await getCartInfo();
  }
}
