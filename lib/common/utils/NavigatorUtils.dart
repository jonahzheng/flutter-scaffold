import 'dart:async';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:MoFangXiu/view/MainPage.dart';
import 'package:MoFangXiu/widget/PhotoViewPage.dart';

/**
 * 导航，暂无用
 */
class NavigatorUtils {
  ///替换
  static pushReplacementNamed(BuildContext context, String routeName) {
    Navigator.pushReplacementNamed(context, routeName);
  }

  ///切换无参数页面
  static pushNamed(BuildContext context, String routeName) {
    Navigator.pushNamed(context, routeName);
  }

  ///主页
  static goHome(BuildContext context) {
    Navigator.pushReplacementNamed(context, MainPage.sName);
  }

  ///图片预览
  static gotoPhotoViewPage(BuildContext context, String url) {
    Navigator.push(context, new CupertinoPageRoute(builder: (context) => new PhotoViewPage(url)));
  }
}