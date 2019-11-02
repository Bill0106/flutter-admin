import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:flutter_admin/common/screen_args.dart';
import 'package:flutter_admin/stores/game_store.dart';
import 'package:flutter_admin/widgets/list_layout.dart';

class GamesScreen extends StatefulWidget {
  @override
  _GamesState createState() => _GamesState();
}

class _GamesState extends State<GamesScreen> {
  @override
  void initState() {
    super.initState();

    Future(() {
      final GameStore store = Provider.of<GameStore>(context);

      if (store.list.length == 0) {
        store.fetchList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final GameStore store = Provider.of<GameStore>(context);

    return Observer(
      builder: (_) => ListLayout(
        title: 'Games',
        columns: ['Title', 'Name', 'Genre', 'Buy At'],
        rows: store.list
            .map(
              (i) => DataRow(cells: [
                DataCell(
                  Text(i.title),
                  onTap: () {
                    Navigator.of(context).pushNamed(
                      '/game',
                      arguments: ScreenArgs(i.id),
                    );
                  },
                ),
                DataCell(Text(i.name)),
                DataCell(Text(i.genre)),
                DataCell(Text(i.buyAt.substring(0, 10)))
              ]),
            )
            .toList(),
        page: store.page,
        total: store.total,
        loading: store.isFetching,
        onNextPage: store.nextPage,
        onPrevPage: store.prevPage,
        onAdd: () {
          print('add');
        },
      ),
    );
  }
}
