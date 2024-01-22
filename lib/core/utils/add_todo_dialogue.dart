import 'package:flutter/material.dart';

class AddTodoutil {
  static Future<dynamic> addTododialogue(
      {required BuildContext context,
      required TextEditingController controllertask,
      required VoidCallback onAdd}) {
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return AlertDialog(
            title: Text("AddTodoList"),
            content: TextField(
              controller: controllertask,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderSide: BorderSide(
                color: Colors.black,
              ))),
            ),
            actions: [
              ElevatedButton(onPressed: onAdd, child: Text('ADD')),
              ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('cancel'))
            ],
          );
        });
  }
}
