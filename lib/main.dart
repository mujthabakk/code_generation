import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:satenotifire/controller/codeganaration.dart';
import 'package:satenotifire/view/pages/codeganarationtodo.dart';
// import 'package:satenotifire/view/pages/changenotifire.dart';
import 'package:satenotifire/view/pages/notifre.dart';
// import 'package:satenotifire/view/pages/todo.dart';

void main() {
  runApp(ProviderScope(child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData.dark(
        useMaterial3: true,
      ),
      // home: ToDoApp(),
      // home: ChangeNoti(),
      home: Todog(),
      // home: notifireprovider(),
    );
  }
}
