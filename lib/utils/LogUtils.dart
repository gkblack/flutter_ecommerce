import 'package:flutter/services.dart';

class LogUtils {
  static const _platform = const MethodChannel("log-rao");

  static void i(String tag,String msg){
    _platform.invokeMethod("raoI---",{'tag':tag, 'msg':msg});
  }

  static void d(String tag, String msg){
    _platform.invokeMethod("raoD---",{'tag':tag,'msg':msg});
  }


  static void v(String tag, String msg) {
    _platform.invokeMethod('raoV---', {'tag': tag, 'msg': msg});
  }

  static void w(String tag, String msg) {
    _platform.invokeMethod('raoW--', {'tag': tag, 'msg': msg});
  }

  static void e(String tag, String msg){
    _platform.invokeMethod("raoE---",{'tag':tag,'msg':msg});
  }

}