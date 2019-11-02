import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:flutter_admin/models/game.dart';
import 'package:flutter_admin/stores/game_store.dart';
import 'package:flutter_admin/widgets/data_form.dart';

class GameScreen extends StatefulWidget {
  final String id;

  GameScreen({Key key, this.id}) : super(key: key);

  @override
  _GameScreenState createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  @override
  void initState() {
    Future(() {
      final store = Provider.of<GameStore>(context);

      if (store.genres.length == 0) {
        store.fetchGenres();
      }

      if (store.platforms.length == 0) {
        store.fetchPlatforms();
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final GameStore store = Provider.of<GameStore>(context);

    return Observer(
      builder: (_) {
        final Game game = store.getGameById(widget.id);
        final List<DataFormField> fields = [
          DataFormField(
            label: 'Title',
            value: game == null ? '' : game.title,
            type: FieldType.text,
          ),
          DataFormField(
            label: 'Name',
            value: game == null ? '' : game.name,
            type: FieldType.text,
          ),
          DataFormField(
            label: 'Developer',
            value: game == null ? '' : game.developer,
            type: FieldType.text,
          ),
          DataFormField(
            label: 'Publisher',
            value: game == null ? '' : game.publisher,
            type: FieldType.text,
          ),
          DataFormField(
            label: 'Release At',
            fieldName: 'releaseAt',
            value: game == null ? '' : game.releaseAt,
            type: FieldType.date,
          ),
          DataFormField(
            label: 'Buy At',
            fieldName: 'buyAt',
            value: game == null ? '' : game.buyAt,
            type: FieldType.date,
          ),
          DataFormField(
            label: 'URL',
            value: game == null ? '' : game.url,
            type: FieldType.text,
          ),
          DataFormField(
            label: 'Genre',
            value: game == null ? '' : game.genre,
            type: FieldType.select,
            options: store.genres,
          ),
          DataFormField(
            label: 'Platform',
            value: game == null ? '' : game.platform,
            type: FieldType.select,
            options: store.platforms,
          ),
          DataFormField(
            type: FieldType.rating,
            fieldName: 'rate',
            value: game == null ? '' : game.rate.toString(),
          )
        ];

        return Scaffold(
          appBar: AppBar(title: Text('Edit Game')),
          body: Container(
            padding: EdgeInsets.all(16.0),
            child: DataForm(
              fields: fields,
              onSubmit: (data) {
                print({...game.toJson(), ...data});
              },
            ),
          ),
        );
      },
    );
  }
}
