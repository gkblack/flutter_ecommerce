import 'package:flutter/material.dart';

class CartPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _CartPageState();
  }

}

class _CartPageState extends State<CartPage>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Row(
        children: <Widget>[
          Text("首页")
        ],
      ),
    );
  }

}