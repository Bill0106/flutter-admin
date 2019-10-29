import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:flutter_admin/models/game.dart';
import 'package:flutter_admin/stores/game_store.dart';
import 'package:flutter_admin/widgets/date_picker.dart';
import 'package:flutter_admin/widgets/select.dart';

class GameScreen extends StatefulWidget {
  final String id;

  GameScreen({Key key, this.id}) : super(key: key);

  @override
  _GameScreenState createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    Future(() {
      final store = Provider.of<GameStore>(context);

      if (store.genres.length == 0) {
        store.fetchGenres();
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final GameStore store = Provider.of<GameStore>(context);
    final Game game = store.getGameById(widget.id);
    final Map<String, dynamic> json = game == null ? Map() : game.toJson();

    final textFields = [
      {'title': 'Title', 'value': game.title},
      {'title': 'Name', 'value': game.name},
      {'title': 'Developer', 'value': game.developer},
      {'title': 'Publisher', 'value': game.publisher},
      {'title': 'URL', 'value': game.url},
    ];

    return Observer(
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: Text('Edit Game'),
        ),
        body: Container(
          padding: EdgeInsets.all(16),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Form(
                  key: _formKey,
                  child: Column(
                    children: <Widget>[
                      ...textFields
                          .map(
                            (i) => TextFormField(
                              initialValue: i['value'],
                              decoration:
                                  InputDecoration(labelText: i['title']),
                              onSaved: (text) {
                                setState(() {
                                  json[i['title'].toLowerCase()] = text;
                                });
                              },
                            ),
                          )
                          .toList(),
                      DatePicker(
                        label: 'Release At',
                        initialValue: game.releaseAt,
                        onSelectedDate: (DateTime date) {
                          json['releaseAt'] = date.toIso8601String();
                        },
                      ),
                      DatePicker(
                        label: 'Buy At',
                        initialValue: game.buyAt,
                        onSelectedDate: (DateTime date) {
                          json['buyAt'] = date.toIso8601String();
                        },
                      ),
                      Select(
                        label: 'Genre',
                        initialValue: game.genre,
                        options: store.genres,
                        onSelect: (String value) {
                          json['genre'] = value;
                        },
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 16),
                  child: RaisedButton(
                    child: Text('Submit'),
                    onPressed: () {
                      _formKey.currentState.save();

                      Game change = Game.fromJson(json);
                      print(change.genre);
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
