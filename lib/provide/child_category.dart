import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/model/category.dart';

class ChildCategory with ChangeNotifier {
//  List<CategoryBigListModel> childCategoryList = [];
  List<BxMallSubDto> childCategoryList = [];
  int childIndex = 0; // 子类索引值
  String categoryId = '4'; // 大类id
  String subId = ''; // 小类id
  int page = 1; // 列表页数
  String noMoreText = ''; // 显示更多的标识
  bool isNewCategoty = false;

  getChildCategory(List<BxMallSubDto> list, String id) {
    isNewCategoty = true;
    categoryId = id;
    childIndex = 0;
  //------------------点击大类
    page = 1;
    noMoreText = '';
  //------------------关键代码end
    subId = ''; // 点击大类时把子类ID清空
    noMoreText = '';
    var all = BxMallSubDto();
    all.mallSubId = '00';
    all.mallCategoryId = '00';
    all.mallSubName = '全部';
    all.comments = 'null';
    childCategoryList = [all];
    childCategoryList.addAll(list);
    notifyListeners();
  }

  changeChildIndex(int index, String id) {
    isNewCategoty = true;
    // 传递两个参数，使用新传递的参数给状态赋值
    childIndex = index;

    subId = id;
    page = 1;

    noMoreText = '';
    notifyListeners();
  }

  // 增加page数量
  addPage() {
    page++;
  }

  // 改变noMoreText数据
  changeNoMore(String text) {
    noMoreText = text;
    notifyListeners();
  }
}
