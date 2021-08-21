import 'package:flute/models/todo.dart';
import 'package:flute/store/todo/todo.action.dart';
import 'package:redux/redux.dart';
import './todo.state.dart';

final todoReducer = combineReducers<TodoState>([
  TypedReducer<TodoState, TodoAddedAction>(_addTodo),
  TypedReducer<TodoState, TodosLoadedAction>(_loadedTodo),
  TypedReducer<TodoState, TodoLoadingAction>(_loadingTodo),
  TypedReducer<TodoState, TodoRemovedAction>(_removeTodo),
]);

TodoState _addTodo(TodoState state, TodoAddedAction action) {
  Todo todo = action.todo!;
  todo.id = todo.id! + 1;
  List<Todo> todos = List.from(state.data!)..add(todo);
  return state.copyWith(loading: false, data: todos);
}

TodoState _loadedTodo(TodoState state, TodosLoadedAction action) {
  return state.copyWith(loading: false, data: action.todos);
}

TodoState _loadingTodo(TodoState state, TodoLoadingAction action) {
  return state.copyWith(loading: true);
}

TodoState _removeTodo(TodoState state, TodoRemovedAction action) {
  List<Todo> todos =
      state.data!.where((element) => element.id != action.todoId).toList();
  return state.copyWith(loading: false, data: todos);
}
