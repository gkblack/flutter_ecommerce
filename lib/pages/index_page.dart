import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'main/cart_page.dart';
import 'main/category_page.dart';
import 'main/home_page.dart';
import 'main/member_page.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provide/provide.dart';
import 'package:flutter_ecommerce/provide/current_index.dart';

class IndexPage extends StatelessWidget {
  final List<BottomNavigationBarItem> bottomTabs = [
    BottomNavigationBarItem(icon: Icon(CupertinoIcons.home), title: Text("首页")),
    BottomNavigationBarItem(
        icon: Icon(CupertinoIcons.search), title: Text("分类")),
    BottomNavigationBarItem(
        icon: Icon(CupertinoIcons.shopping_cart), title: Text("购物车")),
    BottomNavigationBarItem(
        icon: Icon(CupertinoIcons.profile_circled), title: Text("会员中心")),
  ];

  final List<Widget> tabBodies = [
    HomePage(),
    CategoryPage(),
    CartPage(),
    MemberPage()
  ];

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: 750, height: 1334)..init(context);
    // TODO: implement build
    return Provide<CurrentIndexProvide>(
      builder: (context, child, val) {
        int currentIndex =
            Provide.value<CurrentIndexProvide>(context).currentIndex;
        return Scaffold(
          backgroundColor: Color.fromRGBO(244, 245, 245, 1.0),
          bottomNavigationBar: BottomNavigationBar(
            items: bottomTabs,
            type: BottomNavigationBarType.fixed,
            currentIndex: currentIndex,
            onTap: (index) {
              Provide.value<CurrentIndexProvide>(context)
                  .changeIndex(index);
            },
          ),
          body: IndexedStack(
            // 继承自Stack， 作用是显示第index个child布局，其他child布局则为不可见状态
            index: currentIndex,
            children: tabBodies,
          ),
        );
      },
    );
  }
}

//class IndexPage extends StatefulWidget {
//  @override
//  State<StatefulWidget> createState() {
//    // TODO: implement createState
//    return _IndexPageState();
//  }
//}
//
//class _IndexPageState extends State<IndexPage> {
//  PageController _pageController;
//
//  @override
//  Widget build(BuildContext context) {
//    // TODO: implement build
//    return Scaffold(
//      backgroundColor: Color.fromRGBO(244, 245, 245, 1.0),
//      bottomNavigationBar: BottomNavigationBar(
//        items: bottomTabs,
//        type: BottomNavigationBarType.fixed,
//        currentIndex: currentIndex,
//        onTap: (index) {
//          setState(() {
//            currentIndex = index;
//            currentPage = tabBodies[currentIndex];
//          });
//        },
//      ),
//      body: IndexedStack(
//        // 继承自Stack， 作用是显示第index个child布局，其他child布局则为不可见状态
//        index: currentIndex,
//        children: tabBodies,
//      ),
//    );
//  }
//
//  int currentIndex = 0;
//  var currentPage;
//
//  @override
//  void initState() {
//    currentPage = tabBodies[currentIndex];
//    _pageController = new PageController()
//      ..addListener(() {
//        if (currentPage != _pageController.page.round()) {
//          setState(() {
//            currentPage = _pageController.page.round();
//          });
//        }
//      });
//    // TODO: implement initState
//    super.initState();
//  }
//
//  final List<BottomNavigationBarItem> bottomTabs = [
//    BottomNavigationBarItem(
//        icon: Icon(CupertinoIcons.home), title: Text("首页")),
//    BottomNavigationBarItem(
//        icon: Icon(CupertinoIcons.search), title: Text("分类")),
//    BottomNavigationBarItem(
//        icon: Icon(CupertinoIcons.shopping_cart), title: Text("购物车")),
//    BottomNavigationBarItem(
//        icon: Icon(CupertinoIcons.profile_circled), title: Text("会员中心")),
//  ];
//
//  final List<Widget> tabBodies = [HomePage(), CategoryPage(), CartPage(), MemberPage()];
//}
