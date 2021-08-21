import 'package:flute/models/todo.dart';
import 'package:flute/modules/todo/view_models/todo_list.dart';
import 'package:flute/store/app.state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';

part 'todo_list.g.dart';

@hwidget
Widget todoList(BuildContext context) {
  return StoreConnector<AppState, TodoListViewModel>(
      converter: (store) => TodoListViewModel.fromStore(store),
      builder: (_, vm) {
        return _TodoListContainer(
            items: vm.todos,
            onRemove: (int id) {
              vm.onRemove!(id);
            });
      });
}

@hwidget
Widget _todoListContainer(BuildContext context,
    {List<Todo>? items, Function(int id)? onRemove}) {
  return Container(
    child: ListView.builder(
        itemCount: items!.length,
        itemBuilder: (context, idx) {
          final item = items[idx];
          return Dismissible(
              key: Key(item.id.toString()),
              onDismissed: (direction) {
                onRemove!(item.id!);
              },
              background: Container(
                color: Colors.red,
              ),
              child: ListTile(
                title: Text(item.name!),
              ));
        }),
  );
}
