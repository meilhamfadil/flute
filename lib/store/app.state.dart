import './todo/todo.state.dart';

import 'package:flutter/material.dart';

class AppState {
  final TodoState? todoState;

  AppState({@required this.todoState});

  factory AppState.initial() => AppState(
        todoState: TodoState.initial(),
      );

  @override
  bool operator ==(other) =>
      identical(this, other) ||
      other is AppState &&
          runtimeType == other.runtimeType &&
          todoState == other.todoState;

  @override
  int get hashCode => super.hashCode ^ todoState.hashCode;

  @override
  String toString() {
    return "AppState { todoState: $todoState }";
  }
}
