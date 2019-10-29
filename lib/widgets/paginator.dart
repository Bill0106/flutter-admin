import 'package:flutter/material.dart';
import 'package:flutter_admin/common/constants.dart';

class Paginator extends StatelessWidget {
  final int total;
  final int current;
  final void Function() onPrev;
  final void Function() onNext;

  Paginator({this.current, this.total, this.onPrev, this.onNext});

  @override
  Widget build(BuildContext context) {
    final totalPage = (total / Constants.pageSize).ceil();

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        FlatButton(
          child: Icon(Icons.chevron_left),
          onPressed: handlePrev,
        ),
        Text('$current of $totalPage'),
        FlatButton(
          child: Icon(Icons.chevron_right),
          onPressed: handleNext,
        ),
      ],
    );
  }

  void handlePrev() {
    if (current == 1) {
      return;
    }

    onPrev();
  }

  void handleNext() {
    if (current == (total / Constants.pageSize).ceil()) {
      return;
    }

    onNext();
  }
}
