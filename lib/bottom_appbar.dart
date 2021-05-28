import 'package:flutter/material.dart';
import 'dart:ui' as ui;
import 'package:provider/provider.dart';
import 'provider.dart';

class CustomBottomAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ui.Size screenSize = MediaQuery.of(context).size;
    final double _height = screenSize.height;
    final double _width = screenSize.width;

    return Container(
      decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
      height: _height * 0.09,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          IconButton(
            icon: Icon(
              Icons.thumb_up_alt_outlined,
              color: Colors.black,
            ),
            onPressed: () {
              Provider.of<Change>(context, listen: false).increaseLikeCounter();
            },
          ),
          SizedBox(width: _width * 0.1),
          IconButton(
            icon: Icon(
              Icons.comment_outlined,
              color: Colors.black,
            ),
            onPressed: () {
              Provider.of<Change>(context, listen: false)
                  .increaseCommentCounter();
            },
          ),
          SizedBox(width: _width * 0.1),
          IconButton(
            icon: Icon(
              Icons.share,
              color: Colors.black,
            ),
            onPressed: () {},
          ),
          SizedBox(width: _width * 0.1),
          IconButton(
            icon: Icon(
              Icons.save_alt_outlined,
              color: Colors.black,
            ),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
