import 'package:dio/dio.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_admin/common/constants.dart';
import 'package:flutter_admin/common/list_data.dart';
import 'package:flutter_admin/common/global.dart';
import 'package:flutter_admin/models/game.dart';

part 'game_store.g.dart';

class GameStore = GameStoreBase with _$GameStore;

class GameListData extends ListData<Game> {
  GameListData.fromJson(Map<String, dynamic> json) : super.fromJson(json) {
    this.list = this.dynamicList.map((i) => Game.fromJson(i)).toList();
  }
}

abstract class GameStoreBase with Store {
  @observable
  List<Game> list = [];

  @observable
  List<String> genres = [];

  @observable
  List<String> platforms = [];

  @observable
  int page = 1;

  @observable
  int total = 0;

  @observable
  bool isFetching = false;

  @action
  Game getGameById(String id) => list.firstWhere((i) => i.id == id);

  @action
  void nextPage() {
    page++;
    this.fetchList();
  }

  @action
  void prevPage() {
    page--;
    this.fetchList();
  }

  @action
  Future<void> fetchList() async {
    isFetching = true;
    try {
      var res = await Global.dio.get('/games', queryParameters: {
        'limit': Constants.pageSize,
        'offset': (page - 1) * Constants.pageSize,
      });

      GameListData listData = GameListData.fromJson(res.data);

      list = listData.list;
      total = listData.total;
    } on DioError catch (e) {
      throw (e.response == null ? e.response.statusMessage : 'Network Error');
    } finally {
      isFetching = false;
    }
  }

  @action
  Future<void> fetchGenres() async {
    try {
      var res = await Global.dio.get('/game-genres');
      genres = List<String>.from(res.data);
    } on DioError catch (_) {}
  }

  @action
  Future<void> fetchPlatforms() async {
    try {
      var res = await Global.dio.get('/game-platforms');
      platforms = List<String>.from(res.data);
    } on DioError catch (_) {}
  }
}
