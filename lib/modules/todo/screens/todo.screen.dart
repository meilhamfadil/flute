import 'package:flute/modules/todo/containers/todo_input.dart';
import 'package:flute/modules/todo/containers/todo_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';

part 'todo.screen.g.dart';

@hwidget
Widget todoScreen(BuildContext context) {
  return Scaffold(
      appBar: AppBar(
        title: Text("To Do App"),
      ),
      body: Container(
        height: double.infinity,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [Expanded(child: TodoList()), TodoInputSection()],
        ),
      ));
}
