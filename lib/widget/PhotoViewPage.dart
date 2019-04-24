import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:MoFangXiu/common/config/Style.dart';
import 'package:MoFangXiu/common/utils/CommonUtils.dart';
import 'package:MoFangXiu/widget/CommonOptionWidget.dart';
import 'package:MoFangXiu/widget/TitleBarEX.dart';
import 'package:photo_view/photo_view.dart';

/**
 * 图片预览
 */

class PhotoViewPage extends StatelessWidget {
  final String url;

  PhotoViewPage(this.url);

  @override
  Widget build(BuildContext context) {
    OptionControl optionControl = new OptionControl();
    optionControl.url = url;
    return new Scaffold(
        floatingActionButton: new FloatingActionButton(
          child: new Icon(Icons.file_download),
          onPressed: () {
            CommonUtils.saveImage(url).then((res) {
              if (res != null) {
                Fluttertoast.showToast(msg: res);
                if (Platform.isAndroid) {
                  const updateAlbum = const MethodChannel('com.link123.mofangmiu');
                  updateAlbum.invokeMethod('updateAlbum', { 'path': res, 'name': CommonUtils.splitFileNameByPath(res)});
                }
              }
            });
          },
        ),
        appBar: new AppBar(
          title: TitleBarEX("", rightWidget: new CommonOptionWidget(optionControl)),
        ),
        body: new Container(
          color: Colors.black,
          child: new PhotoView(
            imageProvider: new NetworkImage(url ?? MyICons.DEFAULT_REMOTE_PIC),
            loadingChild: Container(
              child: new Stack(
                children: <Widget>[
                  new Center(child: new Image.asset(MyICons.DEFAULT_IMAGE, height: 180.0, width: 180.0)),
                  new Center(child: new SpinKitFoldingCube(color: Colors.white30, size: 60.0)),
                ],
              ),
            ),
          ),
        ));
  }
}
