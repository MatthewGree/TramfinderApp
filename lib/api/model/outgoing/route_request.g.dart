// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'route_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RouteRequest _$RouteRequestFromJson(Map<String, dynamic> json) => RouteRequest(
      from: json['from'] as int,
      to: json['to'] as int,
      time: json['time'] as String,
    );

Map<String, dynamic> _$RouteRequestToJson(RouteRequest instance) =>
    <String, dynamic>{
      'from': instance.from,
      'to': instance.to,
      'time': instance.time,
    };
