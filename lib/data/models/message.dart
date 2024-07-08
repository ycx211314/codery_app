import 'package:json_annotation/json_annotation.dart';

part 'message.g.dart';

@JsonSerializable()
class Message<T> {
  String code;
  String message;
  String info;
  dynamic data;

  Message(this.code, this.message, this.info, this.data);
}
