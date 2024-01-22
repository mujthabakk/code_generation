import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:satenotifire/core/constants/todomodel.dart';
part 'grneratortodo.g.dart';

@riverpod
class Todos extends _$Todos {
  @override
  List<TodoModel> build() {
    return [];
  }

  void TaskAdd(String str) {
    state = [...state, TodoModel(titile: str)];
    // List temp = state;
    // temp.add(str);
    // state = List.from(temp);
  }

  void removieed(int index) {
    state = [
      for (TodoModel model in state)
        if (state[index] != model) model
    ];
    // List temp = state;
    // temp.removeAt(index);
    // state = List.from(temp);
  }

  void edited(int index, String str) {
    List temp = state;
    temp[index] = TodoModel(titile: str);
    state = List.from(temp);
  }

  uptaded(TodoModel todoupdate, int index) {
    List temp = state;
    temp[index] = todoupdate;
    state = List.from(temp);
  }
}
