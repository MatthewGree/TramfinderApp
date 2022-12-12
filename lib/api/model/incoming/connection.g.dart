// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'connection.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Connection _$ConnectionFromJson(Map<String, dynamic> json) => Connection(
      from: Stop.fromJson(json['from'] as Map<String, dynamic>),
      to: Stop.fromJson(json['to'] as Map<String, dynamic>),
      startingTime: Time.fromJson(json['startingTime'] as Map<String, dynamic>),
      endingTime: Time.fromJson(json['endingTime'] as Map<String, dynamic>),
      line: Line.fromJson(json['line'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ConnectionToJson(Connection instance) =>
    <String, dynamic>{
      'from': instance.from,
      'to': instance.to,
      'startingTime': instance.startingTime,
      'endingTime': instance.endingTime,
      'line': instance.line,
    };
