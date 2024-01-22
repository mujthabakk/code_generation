
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:satenotifire/core/constants/todomodel.dart';

class notifiers extends Notifier<List<TodoModel>> {
  @override
  List<TodoModel> build() {
    return [];
  }

  void TaskADD(String str) {
    state = [...state, TodoModel(titile: str)];
    // List temp = state;
    // temp.add(str);
    // state = List.from(temp);
  }

  void removied(int index) {
    state = [
      for (TodoModel model in state)
        if (state[index] != model) model
    ];
    // List temp = state;
    // temp.removeAt(index);
    // state = List.from(temp);
  }

  void editing(int index, String str) {
    List temp = state;
    temp[index] = TodoModel(titile: str);
    state = List.from(temp);
  }

  uptadeing(TodoModel todoupdate, int index) {
    List temp = state;
    temp[index] = todoupdate;
    state = List.from(temp);
  }
}

final provider =
    NotifierProvider<notifiers, List<TodoModel>>(() => notifiers());
 



