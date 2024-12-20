import 'package:codery/respository/vehicle_repository.dart';
import 'package:flutter/material.dart';

class VehiclePage extends StatefulWidget {
  const VehiclePage({super.key});

  @override
  _VehiclePageState createState() => _VehiclePageState();
}

class _VehiclePageState extends State<VehiclePage> {
  static const loadingTag = "##loading##"; //表尾标记
  final _words = <String>[loadingTag];

  @override
  void initState() {
    super.initState();
    print("initState");
    _retrieveData(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("在线车辆"),
        ),
        body: ListView.separated(
          itemCount: _words.length,
          itemBuilder: (context, index) {
            //如果到了表尾
            if (_words[index] == loadingTag) {
              //不足100条，继续获取数据
              if (_words.length - 1 < 100) {
                //获取数据
                _retrieveData(context);
                //加载时显示loading
                return Container(
                  padding: const EdgeInsets.all(16.0),
                  alignment: Alignment.center,
                  child: const SizedBox(
                    width: 24.0,
                    height: 24.0,
                    child: CircularProgressIndicator(strokeWidth: 2.0),
                  ),
                );
              } else {
                //已经加载了100条数据，不再获取数据。
                return Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(16.0),
                  child: const Text(
                    "没有更多了",
                    style: TextStyle(color: Colors.grey),
                  ),
                );
              }
            }
            //显示单词列表项
            return ListTile(title: Text(_words[index]));
          },
          separatorBuilder: (context, index) => const Divider(height: .0),
        ));
  }

  void _retrieveData(BuildContext context) {
    VehcileRespository.loadVehicle(context).then((message) {
      print(message);
      setState(() {
        _words.insertAll(_words.length - 1, message.data);
      });
    }).onError((error, stra) {
      print(stra);
    });
    // print(res);
  }
}
