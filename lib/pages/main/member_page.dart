import 'package:flutter/material.dart';

class MemberPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MemberPageState();
  }

}

class _MemberPageState extends State<MemberPage>{
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