import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:MoFangXiu/common/lng/MyLocalizations.dart';
import 'package:MoFangXiu/common/net/Api.dart';
import 'package:MoFangXiu/common/redux/AppState.dart';
//import 'package:MoFangXiu/common/redux/LocaleRedux.dart';
//import 'package:MoFangXiu/common/redux/ThemeRedux.dart';
import 'package:MoFangXiu/common/lng/LngString.dart';
import 'package:MoFangXiu/common/config/Style.dart';
// import 'package:MoFangXiu/widget/IssueEditDIalog.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:path_provider/path_provider.dart';
import 'package:redux/redux.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_statusbar/flutter_statusbar.dart';

/**
 * 通用函数
 */
class CommonUtils {
  static final double MILLIS_LIMIT = 1000.0;

  static final double SECONDS_LIMIT = 60 * MILLIS_LIMIT;

  static final double MINUTES_LIMIT = 60 * SECONDS_LIMIT;

  static final double HOURS_LIMIT = 24 * MINUTES_LIMIT;

  static final double DAYS_LIMIT = 30 * HOURS_LIMIT;

  static double sStaticBarHeight = 0.0;

  static void initStatusBarHeight(context) async {
    sStaticBarHeight = await FlutterStatusbar.height / MediaQuery.of(context).devicePixelRatio;
  }

  static String getDateStr(DateTime date) {
    if (date == null || date.toString() == null) {
      return "";
    } else if (date.toString().length < 10) {
      return date.toString();
    }
    return date.toString().substring(0, 10);
  }

  ///日期格式转换
  static String getNewsTimeStr(DateTime date) {
    int subTime = DateTime.now().millisecondsSinceEpoch - date.millisecondsSinceEpoch;

    if (subTime < MILLIS_LIMIT) {
      return "刚刚";
    } else if (subTime < SECONDS_LIMIT) {
      return (subTime / MILLIS_LIMIT).round().toString() + " 秒前";
    } else if (subTime < MINUTES_LIMIT) {
      return (subTime / SECONDS_LIMIT).round().toString() + " 分钟前";
    } else if (subTime < HOURS_LIMIT) {
      return (subTime / MINUTES_LIMIT).round().toString() + " 小时前";
    } else if (subTime < DAYS_LIMIT) {
      return (subTime / HOURS_LIMIT).round().toString() + " 天前";
    } else {
      return getDateStr(date);
    }
  }

  static getLocalPath() async {
    Directory appDir;
    if (Platform.isIOS) {
      appDir = await getApplicationDocumentsDirectory();
    } else {
      appDir = await getExternalStorageDirectory();
    }
    PermissionStatus permission = await PermissionHandler().checkPermissionStatus(PermissionGroup.storage);
    if (permission != PermissionStatus.granted) {
      Map<PermissionGroup, PermissionStatus> permissions = await PermissionHandler().requestPermissions([PermissionGroup.storage]);
      if (permissions[PermissionGroup.storage] != PermissionStatus.granted) {
        return null;
      }
    }
    String appDocPath = appDir.path + "/mofangxiu";
    Directory appPath = Directory(appDocPath);
    await appPath.create(recursive: true);
    return appPath;
  }

  static saveImage(String url) async {
    Future<String> _findPath(String imageUrl) async {
      final cache = await CacheManager.getInstance();
      final file = await cache.getFile(imageUrl);
      if (file == null) {
        return null;
      }
      Directory localPath = await CommonUtils.getLocalPath();
      if (localPath == null) {
        return null;
      }
      final name = splitFileNameByPath(file.path);
      final result = await file.copy(localPath.path + name);
      return result.path;
    }

    return _findPath(url);
  }

  static splitFileNameByPath(String path) {
    return path.substring(path.lastIndexOf("/"));
  }

  static getFullName(String repository_url) {
    if (repository_url != null && repository_url.substring(repository_url.length - 1) == "/") {
      repository_url = repository_url.substring(0, repository_url.length - 1);
    }
    String fullName = '';
    if (repository_url != null) {
      List<String> splicurl = repository_url.split("/");
      if (splicurl.length > 2) {
        fullName = splicurl[splicurl.length - 2] + "/" + splicurl[splicurl.length - 1];
      }
    }
    return fullName;
  }

  // static pushTheme(Store store, int index) {
  //   ThemeData themeData;
  //   List<Color> colors = getThemeListColor();
  //   themeData = new ThemeData(primarySwatch: colors[index], platform: TargetPlatform.iOS);
  //   store.dispatch(new RefreshThemeDataAction(themeData));
  // }

  /**
   * 切换语言
   */
  static changeLocale(Store<AppState> store, int index) {
    Locale locale = store.state.platformLocale;
    switch (index) {
      case 1:
        locale = Locale('zh', 'CH');
        break;
      case 2:
        locale = Locale('en', 'US');
        break;
    }
    //store.dispatch(RefreshLocaleAction(locale));
  }

  static LngString getLocale(BuildContext context) {
    return MyLocalizations.of(context).currentLocalized;
  }

  static const IMAGE_END = [".png", ".jpg", ".jpeg", ".gif", ".svg"];

  static isImageEnd(path) {
    bool image = false;
    for (String item in IMAGE_END) {
      if (path.indexOf(item) + item.length == path.length) {
        image = true;
      }
    }
    return image;
  }

  static copy(String data, BuildContext context) {
    Clipboard.setData(new ClipboardData(text: data));
    Fluttertoast.showToast(msg: "复制成功");
  }

  static launchOutURL(String url, BuildContext context) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      Fluttertoast.showToast(msg: "url错误" + ": " + url);
    }
  }

  static Future<Null> showLoadingDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return new Material(
              color: Colors.transparent,
              child: WillPopScope(
                onWillPop: () => new Future.value(false),
                child: Center(
                  child: new Container(
                    width: 200.0,
                    height: 200.0,
                    padding: new EdgeInsets.all(4.0),
                    decoration: new BoxDecoration(
                      color: Colors.transparent,
                      //用一个BoxDecoration装饰器提供背景图片
                      borderRadius: BorderRadius.all(Radius.circular(4.0)),
                    ),
                    child: new Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        new Container(child: SpinKitCubeGrid(color: Color(MyColors.white))),
                        new Container(height: 10.0),
                        new Container(child: new Text('加载中', style: MyTextStyle.normalTextWhite)),
                      ],
                    ),
                  ),
                ),
              ));
        });
  }

  ///版本更新
  static Future<Null> showUpdateDialog(BuildContext context, String contentMsg) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: new Text('软件版本'),
            content: new Text(contentMsg),
            actions: <Widget>[
              new FlatButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: new Text(CommonUtils.getLocale(context).app_cancel)),
              new FlatButton(
                  onPressed: () {
                    //// launch(Address.updateUrl);
                    Navigator.pop(context);
                  },
                  child: new Text(CommonUtils.getLocale(context).app_ok)),
            ],
          );
        });
  }
}
