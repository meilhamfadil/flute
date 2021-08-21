import 'package:flute/models/todo.dart';
import 'package:flute/store/app.state.dart';
import 'package:flute/store/todo/todo.thunk.dart';
import 'package:redux/redux.dart';

class TodoInputViewModel {
  final Function(Todo todo)? onSave;

  TodoInputViewModel({this.onSave});

  static TodoInputViewModel fromStore(Store<AppState> store) {
    return TodoInputViewModel(onSave: (todo) {
      store.dispatch(addTodo(todo));
    });
  }
}
