import 'package:dio/dio.dart';
import 'dart:async';
import 'dart:io';
import 'service_url.dart';

// 获取服务器数据接口

Future getHomePageData() async {
  try {
    print('--------获取首页数据-----');
    Response response;
    Dio dio = new Dio();
    dio.options.contentType =
        ContentType.parse("application/x-www-form-urlencoded");
    // 首页数据formDat字段
    var formData = {'lon': 115.02932, 'lat': 35.76189};
    response = await dio.post(servicePath['homePageContext'], data: formData);
    if (response.statusCode == 200) {
      return response.data;
    } else {
      throw Exception('获取接口异常');
    }
  } catch (e) {
    return print("getHome_throw" + e);
  }

}

Future getHomePageBeloConten() async {
  try {
    print('开始获取下拉列表数据');
    Response response;
    Dio dio = new Dio();
    dio.options.contentType =
        ContentType.parse('application/x-www-form-urlencoded');
    int page = 1;
    response = await dio.post(servicePath['homePageBelowConten'], data: page);
    if (response.statusCode == 200) {
      print("getHomePageBeloConten数据返回成功："+response.data);
      return response.data;
    } else {
      throw Exception('getHomePageBeloConten接口数据获取异常');
    }
  } catch (e) {
    return print('ERROR' + e);
  }
}

Future request(url, {formData}) async {
  try {
    Response response;
    Dio dio = new Dio();
    dio.options.contentType =
        ContentType.parse('application/x-www-form-urlencoded');
    if (formData == null) {
      response = await dio.post(servicePath[url]);
    } else {
      response = await dio.post(servicePath[url], data: formData);
    }
    if (response.statusCode == 200) {
      print("$url返回data:"+response.data);
      return response.data;
    } else {
      throw Exception('$url异常');
    }
  } catch (e) {
    return print('$url error' + e);
  }
}
