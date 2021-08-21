import 'package:flute/app.module.dart';
import 'package:flute/app.screen.dart';
import 'package:flute/store/app.reducer.dart';
import 'package:flute/store/app.state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';

void main() {
  final store = Store<AppState>(appReducer,
      initialState: AppState.initial(), middleware: [thunkMiddleware]);
  runApp(StoreProvider(
      store: store,
      child: ModularApp(module: AppModule(), child: AppScreen())));
}
