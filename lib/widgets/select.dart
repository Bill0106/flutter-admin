import 'package:flutter/material.dart';

class Select extends StatefulWidget {
  final String label;
  final String initialValue;
  final List<String> options;
  final ValueChanged<String> onSelect;

  Select(
      {@required this.label,
      @required this.options,
      this.initialValue,
      this.onSelect});

  @override
  _SelectState createState() => _SelectState();
}

class _SelectState extends State<Select> {
  final TextEditingController _controller = TextEditingController();
  final GlobalKey _textKey = GlobalKey();
  String selected;

  @override
  void initState() {
    _controller.text = widget.initialValue;
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
      key: _textKey,
      controller: _controller,
      decoration: InputDecoration(labelText: widget.label),
      readOnly: true,
      onTap: () {
        _showMenu(context);
      },
    );
  }

  Future<void> _showMenu(BuildContext context) async {
    final RenderBox box = _textKey.currentContext.findRenderObject();
    final position = box.localToGlobal(Offset.zero);
    String picked = await showMenu(
      context: context,
      position: RelativeRect.fromLTRB(position.dx, position.dy, 16, 0),
      items: widget.options
          .map((i) => PopupMenuItem(value: i, child: Text(i)))
          .toList(),
    );

    if (picked != '' && picked != selected) {
      selected = picked;
      _controller.text = picked;

      widget.onSelect(picked);
    }
  }
}
