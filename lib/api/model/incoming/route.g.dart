// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'route.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ConnectionRoute _$RouteFromJson(Map<String, dynamic> json) => ConnectionRoute(
      connections: (json['connections'] as List<dynamic>)
          .map((e) => Connection.fromJson(e as Map<String, dynamic>))
          .toList(),
      duration: Duration.fromJson(json['duration'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$RouteToJson(ConnectionRoute instance) => <String, dynamic>{
      'connections': instance.connections,
      'duration': instance.duration,
    };
