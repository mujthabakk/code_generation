import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:satenotifire/core/constants/todomodel.dart';
import 'package:satenotifire/view/pages/notifre.dart';

class todonoti extends ChangeNotifier {
  List _todo = [];
  List get todo {
    return _todo;
  }

  void adding(String str) {
    todo.add(str);
    notifyListeners();
  }

  void removing(int index) {
    todo.removeAt(index);
    notifyListeners();
  }

  void edit(int index, String str) {
    todo[index] = str;
    notifyListeners();
  }
}

final todoprovider = ChangeNotifierProvider<todonoti>((ref) => todonoti());

class changenotifire extends ChangeNotifier {
  List _todo = [];

  List get todo {
    return _todo;
  }
}

final changenoti =
    ChangeNotifierProvider<changenotifire>((ref) => changenotifire());

class notifire extends Notifier<List<TodoModel>> {
  @override
  List<TodoModel> build() {
    return [];
  }
}

final notifrerprovider =
    NotifierProvider<notifire, List<TodoModel>>(() => notifire());

class notifier extends StateNotifier<List<TodoModel>> {
  notifier() : super([]);
}

final provider =
    StateNotifierProvider<notifier, List<TodoModel>>((ref) => notifier());
