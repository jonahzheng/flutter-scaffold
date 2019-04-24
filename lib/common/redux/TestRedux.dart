import 'package:MoFangXiu/common/model/TestModel.dart';
import 'package:redux/redux.dart';

/**
 * 事件Redux
 */

final TestReducer = combineReducers<List<TestModel>>([
  TypedReducer<List<TestModel>, RefreshTestAction>(_refresh),
  TypedReducer<List<TestModel>, LoadMoreTestAction>(_loadMore),
]);

List<TestModel> _refresh(List<TestModel> list, action) {
  list.clear();
  if (action.list == null) {
    return list;
  } else {
    list.addAll(action.list);
    return list;
  }
}

List<TestModel> _loadMore(List<TestModel> list, action) {
  if (action.list != null) {
    list.addAll(action.list);
  }
  return list;
}

class RefreshTestAction {
  final List<TestModel> list;

  RefreshTestAction(this.list);
}

class LoadMoreTestAction {
  final List<TestModel> list;

  LoadMoreTestAction(this.list);
}
