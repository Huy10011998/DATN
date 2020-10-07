import 'package:demo_trangchu/Widgets/gui_phan_anh/modal_gui_pa.dart';
import 'package:flutter/material.dart';

typedef OnSelected(bool b);

class ButtonTag extends StatelessWidget {
  final ButtonTagModel pa;

  final OnSelected onSelected;

  EdgeInsetsGeometry _padding;

  bool _selected = false;

  ButtonTag(
      {@required this.pa,
      this.onSelected,
      EdgeInsetsGeometry padding,
      bool init})
      : _padding = padding ?? EdgeInsets.symmetric(horizontal: 10, vertical: 7),
        _selected = init ?? false;

  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(
      builder: (BuildContext context, StateSetter setState) {
        return Material(
          color: _selected ? Color(0xff3F36AE) : Colors.white,
          child: InkWell(
            onTap: () {
              setState(() {
                _selected = !_selected;
              });

              if (onSelected != null) {
                onSelected(_selected);
              }
            },
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Color(0xff3F36AE),
                ),
              ),
              padding: _padding,
              child: Text(
                pa.title,
                style: TextStyle(
                  color: _selected ? Colors.white : Colors.black,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
