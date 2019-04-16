import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/pages/index_page.dart';
import 'package:flutter_ecommerce/provide/child_category.dart';
import 'package:flutter_ecommerce/provide/category_goods_list.dart';
import 'package:provide/provide.dart';
import 'package:flutter_ecommerce/provide/counter.dart';
import 'routers/routes.dart';
import 'routers/app.dart';
import 'package:fluro/fluro.dart';

void main() {
  var counter = Counter();
  var providers = Providers();
  var childCategory = ChildCategory();
  var categoryGoodsListProvide = CategoryGoodsListProvide();
  providers
    ..provide(Provider<Counter>.value(counter))
    ..provide(Provider<ChildCategory>.value(childCategory))
    ..provide(Provider<CategoryGoodsListProvide>.value(categoryGoodsListProvide));
  runApp(ProviderNode(child:MyApp(),providers:providers));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final router = Router();
    Routes.configureRoute(router);
    Application.router = router;
    return MaterialApp(
      title: '生活',
      debugShowCheckedModeBanner: false,
      // 注入路由到程序中
      onGenerateRoute: Application.router.generator,
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: IndexPage(),
    );
  }
}