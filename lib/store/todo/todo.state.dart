import 'package:flute/models/todo.dart';

class TodoState {
  final bool? loading;
  final String? error;
  final List<Todo>? data;

  TodoState(
    this.loading,
    this.error,
    this.data,
  );

  factory TodoState.initial() => TodoState(false, '', []);

  TodoState copyWith({bool? loading, String? error, List<Todo>? data}) =>
      TodoState(
          loading ?? this.loading, error ?? this.error, data ?? this.data);

  @override
  bool operator ==(other) =>
      identical(this, other) ||
      other is TodoState &&
          runtimeType == other.runtimeType &&
          loading == other.loading &&
          error == other.error &&
          data == other.data;

  @override
  int get hashCode =>
      super.hashCode ^ runtimeType.hashCode ^ loading.hashCode ^ error.hashCode;

  @override
  String toString() =>
      "TodoState { loading: $loading,  error: $error, data: $data}";
}
