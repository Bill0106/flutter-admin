import 'package:json_annotation/json_annotation.dart';

part 'game.g.dart';

@JsonSerializable()
class Game {
  String id;
  String title;
  String name;
  String platform;
  String genre;
  String developer;
  String publisher;
  int rate;
  String releaseAt;
  String buyAt;
  String image;
  String url;

  Game(
    this.id,
    this.title,
    this.name,
    this.platform,
    this.genre,
    this.developer,
    this.publisher,
    this.rate,
    this.releaseAt,
    this.buyAt,
    this.image,
    this.url,
  );

  factory Game.fromJson(Map<String, dynamic> json) => _$GameFromJson(json);
  Map<String, dynamic> toJson() => _$GameToJson(this);
}
