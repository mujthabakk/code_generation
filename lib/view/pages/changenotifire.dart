import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:satenotifire/controller/changingnotifire_provider.dart';
// import 'package:satenotifire/controller/todoconrtoller.dart';
import 'package:satenotifire/core/constants/todomodel.dart';
import 'package:satenotifire/core/utils/add_todo_dialogue.dart';

class ChangeNoti extends ConsumerWidget {
  ChangeNoti({super.key});
  final TextEditingController task = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todolistw = ref.watch(todoprovider).todo;
    final todolistr = ref.read(todoprovider.notifier);
    log('sadf');
    return Scaffold(
      body: ListView.separated(
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(
                todolistw[index],
              ),
              trailing: CloseButton(
                onPressed: () {
                  todolistr.removing(index);
                },
              ),
              leading: IconButton(
                onPressed: () {
                  AddTodoutil.addTododialogue(
                      context: context, controllertask: task, onAdd: () {
                         todolistr.edit(index, task.text);
                      });
                 
                },
                icon: Icon(Icons.edit),
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
                  todolistr.adding(task.text);
                  task.clear();
                }
              });
        },
        child: Text("Add"),
      ),
    );
  }
}
