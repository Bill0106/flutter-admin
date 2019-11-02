import 'package:flutter/material.dart';
import 'date_picker.dart';
import 'select.dart';
import 'rating.dart';

enum FieldType { text, select, date, rating }

class DataFormField {
  final String label;
  final String fieldName;
  final FieldType type;
  final String value;
  final List<String> options;

  DataFormField({
    this.label,
    this.fieldName,
    this.type,
    this.value,
    this.options,
  });
}

class DataForm extends StatefulWidget {
  final Map<String, dynamic> initialValue;
  final List<DataFormField> fields;
  final ValueChanged<Map<String, dynamic>> onSubmit;

  DataForm({this.initialValue, this.fields, this.onSubmit});

  @override
  _DataFormState createState() => _DataFormState();
}

class _DataFormState extends State<DataForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final Map<String, dynamic> data = {};

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Form(
            key: _formKey,
            child: Column(
              children: widget.fields.map((i) {
                String fieldName =
                    i.fieldName == null ? i.label.toLowerCase() : i.fieldName;

                switch (i.type) {
                  case FieldType.date:
                    return DatePicker(
                      label: i.label,
                      initialValue: i.value,
                      onSelectedDate: (date) {
                        data[fieldName] = date.toIso8601String();
                      },
                    );
                  case FieldType.select:
                    return Select(
                      label: i.label,
                      initialValue: i.value,
                      options: i.options,
                      onSelect: (selected) {
                        data[fieldName] = selected;
                      },
                    );
                  case FieldType.rating:
                    return Rating(
                      initialValue: i.value == null ? 0 : int.parse(i.value),
                      onRate: (rate) {
                        data[i.fieldName] = rate.toString();
                      },
                    );
                  default:
                    return TextFormField(
                      initialValue: i.value,
                      decoration: InputDecoration(labelText: i.label),
                      onSaved: (text) {
                        data[fieldName] = text;
                      },
                    );
                }
              }).toList(),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 16),
            child: RaisedButton(
              child: Text('Submit'),
              onPressed: () {
                _formKey.currentState.save();
                widget.onSubmit(data);
              },
            ),
          )
        ],
      ),
    );
  }
}
