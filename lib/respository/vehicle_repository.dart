//首页相关接口
import 'package:codery/common/utils/http.dart';
import 'package:codery/data/models/message.dart';
import 'package:flutter/material.dart';

class VehcileRespository {
  //加载车辆
  static Future<Message> loadVehicle(BuildContext context) async {
    String code = '0000';
    String message = 'success';
    HttpUtil httpUtil = HttpUtil(); // 创建 HttpUtil 实例
    final res = await httpUtil.fetchGet("/api/online/list");
    // List<String> numbers = res.data["data"].forEach((rr) {
    //   return rr["id"];
    // });
    // final numbers = res.data["data"].map<dynamic>((rr) => rr["id"]).toList();
    return Message(code, message, res.statusCode.toString(),
        res.data["data"].map<dynamic>((rr) => rr["id"].toString()).toList());
  }
}
