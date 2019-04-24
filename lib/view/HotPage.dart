import 'dart:async';

import 'package:flutter/material.dart';
import 'package:MoFangXiu/common/utils/CommonUtils.dart';

class HotPage extends StatefulWidget {
  @override
  _HotPageState createState() => _HotPageState();
}

class _HotPageState extends State<HotPage> {
  @override
  Widget build(BuildContext context) {
    return new Container(
      child: new Center(
        child: new Text("热门"),
      ),
    );
  }
}

class TrendTypeModel {
  final String name;
  final String value;

  TrendTypeModel(this.name, this.value);
}
