import 'package:flute/models/todo.dart';
import 'package:flute/modules/todo/view_models/todo_input.dart';
import 'package:flute/store/app.state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';

part 'todo_input.g.dart';

@hwidget
Widget todoInputSection(BuildContext context) {
  return StoreConnector<AppState, TodoInputViewModel>(
      converter: (store) => TodoInputViewModel.fromStore(store),
      builder: (_, vm) {
        return _TodoInputSectionContainer(onSave: (Todo todo) {
          vm.onSave!(todo);
        });
      });
}

@hwidget
Widget _todoInputSectionContainer(BuildContext context,
    {Function(Todo todo)? onSave}) {
  final todoNameTextController = useTextEditingController();
  return Container(
      child: Padding(
    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
            child: TextField(
          controller: todoNameTextController,
          decoration: InputDecoration(
              border: OutlineInputBorder(),
              contentPadding: EdgeInsets.symmetric(horizontal: 5, vertical: 3)),
        )),
        ElevatedButton(
            onPressed: () {
              onSave!(Todo(id: 0, name: todoNameTextController.text));
              todoNameTextController.text = "";
            },
            child: Icon(Icons.add),
            style: ElevatedButton.styleFrom(
                shape: CircleBorder(), padding: EdgeInsets.all(10)))
      ],
    ),
  ));
}
