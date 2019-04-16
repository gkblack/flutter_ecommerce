import 'package:flutter/material.dart';
import 'router_handler.dart';
import 'package:fluro/fluro.dart';

/**
 * 全局路由状态管理
 */
class Routes{
  static String root = '/';
  static String detailsPage = '/detail';
  static void configureRoute(Router router){
    router.notFoundHandler = new Handler(
      handlerFunc: (BuildContext context,  Map<String, List<String>> params){
        print('route::${params}');
        print('ERROR====>ROUTE WAS NOT FONUND!!!');
      }
    );
    return router.define(detailsPage, handler: detailsHander);
  }
}
