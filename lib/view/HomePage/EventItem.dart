import 'package:flutter/material.dart';
import 'package:MoFangXiu/common/model/TestModel.dart';
import 'package:MoFangXiu/common/config/Style.dart';
import 'package:MoFangXiu/widget/CardItem.dart';

/**
 * 事件Item
 */
class EventItem extends StatelessWidget {
  final TestModel testModel;

  final VoidCallback onPressed;

  final bool needImage;

  EventItem(this.testModel, {this.onPressed, this.needImage = true})
      : super();

  @override
  Widget build(BuildContext context) {
    return new Container(
      child: new CardItem(
          child: new FlatButton(
              onPressed: onPressed,
              child: new Padding(
                padding: new EdgeInsets.only(
                    left: 0.0, top: 10.0, right: 0.0, bottom: 10.0),
                child: new Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    new Row(
                      children: <Widget>[
                        new Expanded(
                            child: new Text(testModel.title,
                                style: MyTextStyle.smallTextBold)),
                      ],
                    ),
                    new Container(
                        child:
                            new Text(testModel.url, style: MyTextStyle.smallTextBold),
                        margin: new EdgeInsets.only(top: 6.0, bottom: 2.0),
                        alignment: Alignment.topLeft),
                   
                  ],
                ),
              ))),
    );
  }
}