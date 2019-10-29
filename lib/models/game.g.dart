// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Game _$GameFromJson(Map<String, dynamic> json) {
  return Game(
    json['id'] as String,
    json['title'] as String,
    json['name'] as String,
    json['platform'] as String,
    json['genre'] as String,
    json['developer'] as String,
    json['publisher'] as String,
    json['rate'] as int,
    json['releaseAt'] as String,
    json['buyAt'] as String,
    json['image'] as String,
    json['url'] as String,
  );
}

Map<String, dynamic> _$GameToJson(Game instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'name': instance.name,
      'platform': instance.platform,
      'genre': instance.genre,
      'developer': instance.developer,
      'publisher': instance.publisher,
      'rate': instance.rate,
      'releaseAt': instance.releaseAt,
      'buyAt': instance.buyAt,
      'image': instance.image,
      'url': instance.url,
    };
