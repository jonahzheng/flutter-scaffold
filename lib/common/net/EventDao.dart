import 'dart:convert';

import 'package:MoFangXiu/common/model/Event.dart';
import 'package:MoFangXiu/common/model/TestModel.dart';
import 'package:MoFangXiu/common/redux/TestRedux.dart';
import 'package:MoFangXiu/common/net/Api.dart';
import 'package:MoFangXiu/common/net/Http.dart';
import 'package:MoFangXiu/common/redux/EventRedux.dart';
import 'package:MoFangXiu/common/redux/AppState.dart';
import 'package:redux/redux.dart';

class EventDao {
  //列表测试数据
  static getListData_Test(Store<AppState> store, {page = 1}) async {

    var res = [{
      'title': '123',
      'url': 'http://wwww.dddd'
    },{
      'title': '343',
      'url': 'http://wwww.dddd'
    },{
      'title': '444',
      'url': 'http://wwww.dddd'
    },{
      'title': '555',
      'url': 'http://wwww.dddd'
    },{
      'title': '666',
      'url': 'http://wwww.dddd'
    }];

    if (res != null) {
      List<TestModel> list = new List();
      for (int i = 0; i < res.length; i++) {
        list.add(TestModel.fromJson(res[i]));
      }
      if (page == 1) {
        store.dispatch(new RefreshTestAction(list));
      } else {
        store.dispatch(new LoadMoreTestAction(list));
      }
      return list;
    } else {
      return null;
    }
  }

  //请求网络接口数据示例
  static getNetReceived(Store<AppState> store, {page = 1}) async {
    
    String url =
        Api.getEventReceived('sss') + Api.getPageParams("?", page);

    var res = await HttpManager.netFetch(url, null, null, null);
    if (res != null && res.result) {
      List<Event> list = new List();
      var data = res.data;
      if (data == null || data.length == 0) {
        return null;
      }
      for (int i = 0; i < data.length; i++) {
        list.add(Event.fromJson(data[i]));
      }
      if (page == 1) {
        store.dispatch(new RefreshEventAction(list));
      } else {
        store.dispatch(new LoadMoreEventAction(list));
      }
      return list;
    } else {
      return null;
    }
  }

  static clearEvent(Store store) {
    store.state.eventList.clear();
    store.dispatch(new RefreshEventAction([]));
  }
}
