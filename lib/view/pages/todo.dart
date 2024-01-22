import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:satenotifire/controller/todoconrtoller.dart';
import 'package:satenotifire/core/constants/todomodel.dart';
import 'package:satenotifire/core/utils/add_todo_dialogue.dart';

class ToDoApp extends ConsumerWidget {
  ToDoApp({super.key});
  final TextEditingController task = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todolistw = ref.watch(Todoprovidr);
    final todolistr = ref.read(Todoprovidr.notifier);
    // log('sadf');
    return Scaffold(
      body: todolistw.isEmpty
          ? Center(
              child: Text("Empty List"),
            )
          : ListView.separated(
              itemBuilder: (context, index) {
                return CheckboxListTile(
                  value:
                  todolistw[index].isCompleted, //mansilayilla
                  onChanged: (bool? value) {
                    todolistr.uptadeing(
                        TodoModel(
                            titile: todolistw[index].titile,
                            isCompleted: value!),
                        index);
                  },
                  title: Text(todolistw[index].titile),
                  secondary: SizedBox(
                    width: 100,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        IconButton(
                          onPressed: () {
                            todolistr.removeing(index);
                          },
                          icon: Icon(Icons.delete),
                        ),
                        IconButton(
                            onPressed: () {
                              AddTodoutil.addTododialogue(
                                  context: context,
                                  controllertask: task,
                                  onAdd: () {
                                    todolistr.edit(task.text, index);
                                  });
                            },
                            icon: Icon(Icons.edit)),
                      ],
                    ),
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return SizedBox(
                  height: 20,
                );
              },
              itemCount: todolistw.length),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          AddTodoutil.addTododialogue(
              context: context,
              controllertask: task,
              onAdd: () {
                if (task.text.isNotEmpty) {
                  todolistr.addtask(task.text);
                  task.clear();

                  log('${ref.watch(Todoprovidr.notifier).state[0].titile}');
                }
              });
        },
        child: Text("Add"),
      ),
    );
  }
}
