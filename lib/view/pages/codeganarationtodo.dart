// import 'package:flutter/foundation.dart';
// import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:satenotifire/controller/changingnotifire_provider.dart';
import 'package:satenotifire/controller/grneratortodo.dart';
import 'package:satenotifire/controller/todoconrtoller.dart';
import 'package:satenotifire/core/constants/todomodel.dart';
import 'package:satenotifire/core/utils/add_todo_dialogue.dart';

class Todog extends ConsumerWidget {
  const Todog({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var refwatch = ref.watch(todosProvider);
    var refread = ref.read(todosProvider.notifier);
    TextEditingController task = TextEditingController();
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'TO DO',
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
        ),
        body: ListView.separated(
            itemBuilder: ((context, index) {
              // final TodoModel item = TodoModel(titile: todosProvider"[]");
              return Dismissible(
                  key: ValueKey(refwatch[index]),
                  onDismissed: (direction) {
                    refread.removieed(index);
                  },
                  child: CheckboxListTile(
                    value: refwatch[index].isCompleted, //mansilayilla
                    onChanged: (bool? value) {
                      refread.uptaded(
                          TodoModel(
                              titile: refwatch[index].titile,
                              isCompleted: value!),
                          index);
                    },
                    title: Text(refwatch[index].titile),
                    secondary: SizedBox(
                      width: 100,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          IconButton(
                            onPressed: () {
                              refread.removieed(index);
                            },
                            icon: Icon(Icons.delete),
                          ),
                          IconButton(
                              onPressed: () {
                                AddTodoutil.addTododialogue(
                                    context: context,
                                    controllertask: task,
                                    onAdd: () {
                                      refread.edited(index, task.text);
                                    });
                              },
                              icon: Icon(Icons.edit)),
                        ],
                      ),
                    ),
                  ));
            }),
            separatorBuilder: ((context, index) {
              return SizedBox(
                height: 30,
              );
            }),
            itemCount: refwatch.length),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            AddTodoutil.addTododialogue(
                context: context,
                controllertask: task,
                onAdd: () {
                  if (task.text.isNotEmpty) {
                    refread.TaskAdd(task.text);
                    task.clear();

                    // log('${ref.watch(Todoprovidr.notifier).state[0].titile}');
                  }
                });
          },
        ));
  }
}
