import 'package:flutter/material.dart';
import 'dart:ui' as ui;
import 'package:provider/provider.dart';
import 'provider.dart';

class Like_Comment extends StatelessWidget {
  const Like_Comment({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {

    final ui.Size screenSize = MediaQuery.of(context).size;
    final double _height = screenSize.height;
    final double _width = screenSize.width;

    int likeCount = Provider.of<Change>(context).likeCounter;
    int commentCount = Provider.of<Change>(context).commentCounter;

    return SizedBox(
      height: _height*0.07,
      child: Row(
        children: <Widget>[
          Container(
            height: _height * 0.06,
            width: _width / 2,
            child: Center(
              child: Text(
                "$likeCount Likes",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: _height * 0.026),
              ),
            ),
          ),
          Container(
            height: _height * 0.06,
            width: _width / 2,
            child: Center(
              child: Text(
                "$commentCount Comments",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: _height * 0.026,
                    color: Colors.blue[700]),
              ),
            ),
          )
        ],
      ),
    );
  }
}
