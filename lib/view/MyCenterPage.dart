import 'dart:async';

import 'package:flutter/material.dart';

/**
 * 主页我的tab页
 */
class MyCenterPage extends StatefulWidget {
  @override
  _MyCenterPageState createState() => _MyCenterPageState();
}

class _MyCenterPageState extends State<MyCenterPage> {
  @override
  Widget build(BuildContext context) {
    return new Container(
      child: new Center(
        child: new Text("个人主页"),
      ),
    );
  }
}