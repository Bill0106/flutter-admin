import 'package:flutter/material.dart';

class DatePicker extends StatefulWidget {
  final String label;
  final String initialValue;
  final ValueChanged<DateTime> onSelectedDate;

  DatePicker({
    this.label,
    this.initialValue,
    this.onSelectedDate,
  });

  @override
  _DatePickerState createState() => _DatePickerState();
}

class _DatePickerState extends State<DatePicker> {
  final TextEditingController _controller = TextEditingController();
  DateTime selectedDate;

  @override
  void initState() {
    _controller.text = widget.initialValue.substring(0, 10);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _controller,
      decoration: InputDecoration(labelText: widget.label),
      readOnly: true,
      onTap: () {
        _selectDate(context);
      },
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: selectedDate == null
          ? DateTime.parse(widget.initialValue.substring(0, 10))
          : selectedDate,
      firstDate: DateTime(2010),
      lastDate: DateTime(2101),
    );

    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
      _controller.text = picked.toIso8601String().substring(0, 10);

      widget.onSelectedDate(picked);
    }
  }
}
