import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:MoFangXiu/common/redux/AppState.dart';
import 'package:MoFangXiu/view/MainPage.dart';
import 'package:MoFangXiu/view/WelcomePage.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

void main() {
  runApp(new FlutterReduxApp());
  // PaintingBinding.instance.imageCache.maximumSize = 100;
}

class FlutterReduxApp extends StatelessWidget {
  /// 创建Store，引用 AppState 中的 appReducer 实现 Reducer 方法
  /// initialState 初始化 State
  final store = new Store<AppState>(
    appReducer,
    ///初始化数据
    initialState: new AppState(
        eventList: new List(),
        testList: new List(),
        ),
  );

  FlutterReduxApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    /// 通过 StoreProvider 应用 store
    return new StoreProvider(
      store: store,
      child: new StoreBuilder<AppState>(builder: (context, store) {
        return new MaterialApp(
            routes: {
              WelcomePage.sName: (context) {
                store.state.platformLocale = Localizations.localeOf(context);
                return WelcomePage();
              },
              'home': (context) {
                return MainPage();
              },
            });
      }),
    );
  }
}