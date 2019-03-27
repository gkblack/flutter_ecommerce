import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/config/service_url.dart';

class CategoryPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _CategoryPageState();
  }

}

class _CategoryPageState extends State<CategoryPage>{
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