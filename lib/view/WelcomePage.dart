import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:MoFangXiu/common/redux/AppState.dart';
import 'package:MoFangXiu/common/config/Style.dart';
import 'package:MoFangXiu/common/utils/CommonUtils.dart';
import 'package:redux/redux.dart';

/**
 * 欢迎页
 */

class WelcomePage extends StatefulWidget {
  static final String sName = "/";

  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  bool hadInit = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (hadInit) {
      return;
    }
    hadInit = true;

    ///防止多次进入
    Store<AppState> store = StoreProvider.of(context);
    CommonUtils.initStatusBarHeight(context);

    new Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushReplacementNamed(context, 'home');
    });
  }

  @override
  Widget build(BuildContext context) {
    return StoreBuilder<AppState>(
      builder: (context, store) {
        return new Container(
          color: Color(MyColors.white),
          child: new Center(
            child:
                new Image(image: new AssetImage('static/images/welcome.png')),
          ),
        );
      },
    );
  }
}
