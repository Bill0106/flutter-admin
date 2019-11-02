import 'package:flutter/material.dart';

class Rating extends StatefulWidget {
  final int initialValue;
  final ValueChanged<int> onRate;

  Rating({this.initialValue, this.onRate});

  @override
  _RatingState createState() => _RatingState();
}

class _RatingState extends State<Rating> {
  int rate = 0;

  @override
  Widget build(BuildContext context) {
    int selected = rate == 0 ? widget.initialValue : rate;

    return Container(
      padding: EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List<int>.generate(5, (i) => i)
            .map(
              (i) => IconButton(
                icon: Icon(
                  selected > i ? Icons.star : Icons.star_border,
                  color: Colors.orange,
                ),
                iconSize: 36.0,
                onPressed: () {
                  setState(() {
                    rate = i + 1;
                  });
                  widget.onRate(rate);
                },
              ),
            )
            .toList(),
      ),
    );
  }
}
