import 'package:flute/models/todo.dart';
import 'package:flutter/material.dart';

class TodoAction {
  @override
  String toString() {
    return 'TodoAction { }';
  }
}

class TodoAddedAction {
  final Todo? todo;

  TodoAddedAction(this.todo);

  @override
  String toString() {
    return 'TodoAddedAction { todo: $todo }';
  }
}

class TodoRemovedAction {
  final int? todoId;

  TodoRemovedAction(this.todoId);

  @override
  String toString() {
    return 'TodoRemovedAction { todoId: $todoId }';
  }
}

class TodosLoadedAction {
  final List<Todo>? todos;

  TodosLoadedAction(this.todos);

  @override
  String toString() {
    return 'TodosLoadedAction { todos: $todos }';
  }
}

class TodoLoadingAction {
  TodoLoadingAction();
  @override
  String toString() {
    return 'TodoLoadingAction { }';
  }
}

class TodoSuccessAction {
  final int? isSuccess;

  TodoSuccessAction({@required this.isSuccess});
  @override
  String toString() {
    return 'TodoSuccessAction { isSuccess: $isSuccess }';
  }
}

class TodoFailedAction {
  final String? error;

  TodoFailedAction({@required this.error});

  @override
  String toString() {
    return 'TodoFailedAction { error: $error }';
  }
}
