import 'package:flute/models/todo.dart';
import 'package:flute/store/app.state.dart';
import 'package:flute/store/todo/todo.thunk.dart';
import 'package:redux/redux.dart';

class TodoListViewModel {
  final List<Todo>? todos;
  final Function(int id)? onRemove;

  TodoListViewModel({this.todos, this.onRemove});

  static TodoListViewModel fromStore(Store<AppState> store) {
    // store.dispatch(fetchTodo());
    return TodoListViewModel(
        todos: store.state.todoState!.data,
        onRemove: (id) {
          store.dispatch(removeTodo(id));
          store.dispatch(fetchTodo());
        });
  }
}
