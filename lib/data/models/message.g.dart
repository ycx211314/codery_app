// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Message<T> _$MessageFromJson<T>(Map<String, dynamic> json) => Message<T>(
      json['code'] as String,
      json['message'] as String,
      json['info'] as String,
      json['data'],
    );

Map<String, dynamic> _$MessageToJson<T>(Message<T> instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'info': instance.info,
      'data': instance.data,
    };
