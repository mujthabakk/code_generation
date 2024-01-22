// // import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:satenotifire/controller/notifireprovider.dart';
// import 'package:satenotifire/core/constants/todomodel.dart';

// class TodoNoti extends StateNotifier<List<TodoModel>> {
//   TodoNoti() : super([]);
//   addtask(String str) {
//     state = [...state, TodoModel(titile: str)];
//     // List<TodoModel> temp = state;
//     // temp.add(str);
//   }

//   uptadeing(TodoModel Uptatetodo, int index) {
//     List<TodoModel> temp = state;
//     temp[index] = Uptatetodo;
//     state = List.from(temp);
//   }

//   removeing(int index) {
//     List<TodoModel> temp = state;
//     temp.removeAt(index);
//     state = List.from(temp);

//     // state=[
//     //   for(TodoModel todo in state)
//     //   if(state[index]!=todo)todo
//     // ];
//   }

//   edit(String str, int index) {
//     List<TodoModel> temp = state;
//     temp[index] = TodoModel(titile: str);
//     state = List.from(temp);
//   }
// }

// // final Todoprovidr = StateNotifierProvider<TodoNoti, List<TodoModel>>((ref) {
// //   return TodoNoti();
// // });


