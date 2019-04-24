import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:MoFangXiu/common/config/Config.dart';
import 'package:MoFangXiu/common/net/EventDao.dart';
import 'package:MoFangXiu/common/model/TestModel.dart';
import 'package:MoFangXiu/common/redux/AppState.dart';
import 'package:MoFangXiu/view/HomePage/EventItem.dart';
import 'package:MoFangXiu/widget/ListState.dart';
import 'package:MoFangXiu/widget/ListViewEX.dart';
import 'package:redux/redux.dart';

/**
 * 主页动态tab页
 */
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with AutomaticKeepAliveClientMixin<HomePage>, ListState<HomePage>, WidgetsBindingObserver {
  @override
  Future<Null> handleRefresh() async {
    if (isLoading) {
      return null;
    }
    isLoading = true;
    page = 1;
    var result = await EventDao.getListData_Test(StoreProvider.of(context), page: page);
    setState(() {
      pullLoadWidgetControl.needLoadMore = (result != null && result.length == Config.PAGE_SIZE);
    });
    isLoading = false;
    return null;
  }

  @override
  Future<Null> onLoadMore() async {
    if (isLoading) {
      return null;
    }
    isLoading = true;
    page++;
    var result = await EventDao.getListData_Test(StoreProvider.of(context), page: page);
    setState(() {
      pullLoadWidgetControl.needLoadMore = (result != null);
    });
    isLoading = false;
    return null;
  }

  @override
  bool get wantKeepAlive => true;

  @override
  requestRefresh() {}

  @override
  requestLoadMore() {}

  @override
  bool get isRefreshFirst => false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    // ReposDao.getNewsVersion(context, false);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    pullLoadWidgetControl.dataList = _getStore().state.testList;
    if (pullLoadWidgetControl.dataList.length == 0) {
      showRefreshLoading();
    }
    super.didChangeDependencies();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      if (pullLoadWidgetControl.dataList.length != 0) {
        showRefreshLoading();
      }
    }
  }

  _renderEventItem(TestModel e) {
    return new EventItem(
      e,
      onPressed: () {
      //  EventUtils.ActionUtils(context, e, "");
        print('返回参数: ' + e.toJson().toString());
      },
    );
  }

  Store<AppState> _getStore() {
    return StoreProvider.of(context);
  }

  @override
  Widget build(BuildContext context) {
    super.build(context); // See AutomaticKeepAliveClientMixin.
    return new StoreBuilder<AppState>(
      builder: (context, store) {
        return ListViewEX(
          pullLoadWidgetControl,
          (BuildContext context, int index) => _renderEventItem(pullLoadWidgetControl.dataList[index]),
          handleRefresh,
          onLoadMore,
          refreshKey: refreshIndicatorKey,
        );
      },
    );
  }
}

// class ModelA {
//   String name;
//   String tag;

//   ModelA(this.name, this.tag);

//   ModelA.empty();

//   ModelA.forName(this.name);
// }
