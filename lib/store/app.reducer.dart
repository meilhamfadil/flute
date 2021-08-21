import './todo/todo.reducer.dart';

import './app.state.dart';

AppState appReducer(AppState state, action) => AppState(
      todoState: todoReducer(state.todoState!, action),
    );
