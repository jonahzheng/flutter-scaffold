import 'package:flutter/material.dart';
import 'package:MoFangXiu/common/config/Style.dart';
import 'package:MoFangXiu/common/utils/CommonUtils.dart';
import 'package:share/share.dart';

class CommonOptionWidget extends StatelessWidget {
  final List<OptionModel> otherList;

  final OptionControl control;

  CommonOptionWidget(this.control, {this.otherList});

  _renderHeaderPopItem(List<OptionModel> list) {
    return new PopupMenuButton<OptionModel>(
      child: new Icon(MyICons.MORE),
      onSelected: (model) {
        model.selected(model);
      },
      itemBuilder: (BuildContext context) {
        return _renderHeaderPopItemChild(list);
      },
    );
  }

  _renderHeaderPopItemChild(List<OptionModel> data) {
    List<PopupMenuEntry<OptionModel>> list = new List();
    for (OptionModel item in data) {
      list.add(PopupMenuItem<OptionModel>(
        value: item,
        child: new Text(item.name),
      ));
    }
    return list;
  }


  @override
  Widget build(BuildContext context) {
    List<OptionModel> list = [
      new OptionModel("浏览器打开", "浏览器打开", (model) {
        CommonUtils.launchOutURL(control.url, context);
      }),
      new OptionModel("复制链接", "复制链接", (model) {
        CommonUtils.copy(control.url ?? "", context);
      }),
      new OptionModel("分享", "分享", (model) {
        Share.share("分享自模仿秀： " + control.url ?? "");
      }),
    ];
    if (otherList != null && otherList.length > 0) {
      list.addAll(otherList);
    }
    return _renderHeaderPopItem(list);
  }
}

class OptionControl {
  String url = MyTextStyle.app_default_share_url;
}

class OptionModel {
  final String name;
  final String value;
  final PopupMenuItemSelected<OptionModel> selected;

  OptionModel(this.name, this.value, this.selected);
}
