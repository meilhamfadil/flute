import 'package:flute/models/todo.dart';
import 'package:flute/store/app.state.dart';
import 'package:flute/store/todo/todo.action.dart';
import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';

ThunkAction<AppState> addTodo(Todo todo) => (Store<AppState> store) async {
      store.dispatch(TodoLoadingAction());
      await Future.delayed(Duration(seconds: 1));
      store.dispatch(TodoAddedAction(todo));
    };

ThunkAction<AppState> removeTodo(int id) => (Store<AppState> store) async {
      store.dispatch(TodoLoadingAction());
      await Future.delayed(Duration(seconds: 1));
      store.dispatch(TodoRemovedAction(id));
    };

ThunkAction<AppState> fetchTodo() => (Store<AppState> store) async {
      store.dispatch(TodoLoadingAction());
      await Future.delayed(Duration(seconds: 1));
      final todos = store.state.todoState?.data;
      store.dispatch(TodosLoadedAction(todos));
    };
