import 'package:flutter/material.dart';
import 'package:MoFangXiu/common/model/Event.dart';
import 'package:MoFangXiu/common/redux/EventRedux.dart';
import 'package:MoFangXiu/common/model/TestModel.dart';
import 'package:MoFangXiu/common/redux/TestRedux.dart';


/**
 * Redux全局State
 */

///全局Redux store 的对象，保存State数据
class AppState {
  ///用户接受到的事件列表
  List<Event> eventList = new List();

  ///测试列表
  List<TestModel> testList = new List();
  // ///用户接受到的事件列表
  // List<TrendingRepoModel> trendList = new List();

  ///当前手机平台默认语言
  Locale platformLocale;

  ///构造方法
  AppState({this.eventList, this.testList});
}

///创建 Reducer
///源码中 Reducer 是一个方法 typedef State Reducer<State>(State state, dynamic action);
///我们自定义了 appReducer 用于创建 store
AppState appReducer(AppState state, action) {
  return AppState(
    ///通过 EventReducer 将 AppState 内的 eventList 和 action 关联在一起
    eventList: EventReducer(state.eventList, action),

    ///通过 EventReducer 将 AppState 内的 eventList 和 action 关联在一起
    testList: TestReducer(state.testList, action),

    ///通过 TrendReducer 将 AppState 内的 trendList 和 action 关联在一起
    //trendList: TrendReducer(state.trendList, action),
  );
}
