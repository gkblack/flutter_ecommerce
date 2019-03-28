import 'package:dio/dio.dart';
import 'dart:async';
import 'dart:io';
import 'service_url.dart';
import 'package:flutter_ecommerce/config/service_url.dart';

// 获取服务器数据接口

Future getHomePageData() async {
  try {
    print('--------获取首页数据-----');
    Response response;
    Dio dio = new Dio();
    dio.options.contentType =
        ContentType.parse("application/x-www-form-urlencoded");
    var formData = {'lon': 115.02932, 'lat': 35.76189};
    response = await dio.post(servicePath['homePageContext'], data: formData);
    if (response.statusCode == 200) {
      print('getHomePageData首页数据返回成功' + response.data);
      return response.data;
    } else {
      throw Exception('获取接口异常');
    }
  } catch (e) {
    return print("getHome_throw" + e);
  }

//  首页数据返回成功{"code":"0","message":"success","data":{"slides":[{"image":"http://images.baixingliangfan.cn/advertesPicture/20190116/20190116140738_7766.jpg","goodsId":"35df1fdd5d8c468ca525cd7021bd32d8"},{"image":"http://images.baixingliangfan.cn/advertesPicture/20190116/20190116173351_2085.jpg","goodsId":"6fe4fe0fb5394c0d9b9b4792a827e029"},{"image":"http://images.baixingliangfan.cn/advertesPicture/20190116/20190116140753_5620.jpg","goodsId":"2171c20d77c340729d5d7ebc2039c08d"}],"shopInfo":{"leaderImage":"http://images.baixingliangfan.cn/leaderImage/20181121/20181121133310_65.jpg","leaderPhone":"03936188699"},"integralMallPic":{"PICTURE_ADDRESS":"http://images.baixingliangfan.cn/advertesPicture/20190225/20190225230449_4194.png","TO_PLACE":"1"},"toShareCode":{"PICTURE_ADDRESS":"http://images.baixingliangfan.cn/advertesPicture/20180629/20180629125808_7351.png","TO_PLACE":"1"},"recommend":[{"image":"http://images.baixingliangfan.cn/compressedPic/20181210150050_5409.jpg","mallPrice":329.00,"goodsName":"(
//I/flutter (19569): {code: 0, message: success, data: {slides: [{image: http://images.baixingliangfan.cn/advertesPicture/20190116/20190116140738_7766.jpg, goodsId: 35df1fdd5d8c468ca525cd7021bd32d8}, {image: http://images.baixingliangfan.cn/advertesPicture/20190116/20190116173351_2085.jpg, goodsId: 6fe4fe0fb5394c0d9b9b4792a827e029}, {image: http://images.baixingliangfan.cn/advertesPicture/20190116/20190116140753_5620.jpg, goodsId: 2171c20d77c340729d5d7ebc2039c08d}], shopInfo: {leaderImage: http://images.baixingliangfan.cn/leaderImage/20181121/20181121133310_65.jpg, leaderPhone: 03936188699}, integralMallPic: {PICTURE_ADDRESS: http://images.baixingliangfan.cn/advertesPicture/20190225/20190225230449_4194.png, TO_PLACE: 1}, toShareCode: {PICTURE_ADDRESS: http://images.baixingliangfan.cn/advertesPicture/20180629/20180629125808_7351.png, TO_PLACE: 1}, recommend: [{image: http://images.baixingliangfan.cn/compressedPic/20181210150050_5409.jpg, mallPrice: 329.0, goodsName: (限购2瓶)沱牌品味舍得52°500ml, goodsId: c0999c03df344e
//I/flutter (19569): 3
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
