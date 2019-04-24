import 'dart:async';

import 'package:flutter/material.dart';
// import 'package:MoFangXiu/common/localization/DefaultLocalizations.dart';
import 'package:MoFangXiu/common/config/Style.dart';
import 'package:MoFangXiu/common/utils/CommonUtils.dart';
import 'package:MoFangXiu/common/utils/NavigatorUtils.dart';
import 'package:MoFangXiu/view/HomePage/HomePage.dart';
import 'package:MoFangXiu/view/MyCenterPage.dart';
import 'package:MoFangXiu/view/HotPage.dart';
import 'package:MoFangXiu/widget/TabBarWidget.dart';
import 'package:MoFangXiu/widget/TitleBarEX.dart';

/**
 * 主页
 */
class MainPage extends StatelessWidget {
  static final String sName = "home";

  /// 单击提示退出
  Future<bool> _dialogExitApp(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) => new AlertDialog(
              content: new Text("确定要退出应用？"),
              actions: <Widget>[
                new FlatButton(onPressed: () => Navigator.of(context).pop(false), child: new Text("取消")),
                new FlatButton(
                    onPressed: () {
                      Navigator.of(context).pop(true);
                    },
                    child: new Text("确定"))
              ],
            ));
  }

  _renderTab(icon, text) {
    return new Tab(
      child: new Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[new Icon(icon, size: 16.0), new Text(text)],
      ),
    );
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    List<Widget> tabs = [
      _renderTab(MyICons.MAIN_DT, "主页"),
      _renderTab(MyICons.MAIN_QS, "热门"),
      _renderTab(MyICons.MAIN_MY, "个人"),
    ];
    return WillPopScope(
      onWillPop: () {
        return _dialogExitApp(context);
      },
      child: new TabBarWidget(
        // drawer: new HomeDrawer(),
        type: TabBarWidget.BOTTOM_TAB,
        tabItems: tabs,
        tabViews: [
          new HomePage(),
          new HotPage(),
          new MyCenterPage(),
        ],
        backgroundColor: MyColors.primarySwatch,
        indicatorColor: Color(MyColors.white),
        title: TitleBarEX(
          "模仿秀",
          iconData: MyICons.ISSUE_ITEM_ADD,
          needRightLocalIcon: true,
          onPressed: () {
            //-----------------
          },
        ),
      ),
    );
  }
}
