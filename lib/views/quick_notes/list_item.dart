import 'package:FL1_Norbert/utils/colors.dart';
import 'package:flutter/material.dart';

class ListItem extends StatefulWidget {
  const ListItem({this.label, this.deleteItem, this.itemNb, this.title});

  final String label;
  final Function(int) deleteItem;
  final int itemNb;
  final ValueChanged<String> title;

  ValueChanged<String> getTitle() {
    return title;
  }

  @override
  _ListItemState createState() => _ListItemState();
}

class _ListItemState extends State<ListItem> {
  final TextEditingController titleController = TextEditingController();

  @override
  void initState() {
    //_title = widget.title;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Row(
        children: <Widget>[
          GestureDetector(
            onTap: () {
              widget.deleteItem(widget.itemNb);
            },
            child: Container(
              height: 20,
              width: 20,
              margin: const EdgeInsets.only(right: 10.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(2),
                color: offWhite,
                border: Border.all(
                  color: borderCheckbox,
                  width: 1.0,
                ),
              ),
            ),
          ),
          Expanded(
            child: TextField(
              controller: titleController,
              onChanged: (String text) {
                // setState(() {
                //   _title = widget.title;
                // });
                widget.title(titleController.text);
              },
              decoration: InputDecoration.collapsed(
                hintText: widget.label,
                hintStyle: const TextStyle(
                  fontFamily: 'Montserrat',
                  color: borderGrey,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
