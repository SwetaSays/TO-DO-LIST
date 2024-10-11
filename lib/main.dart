import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_list/view/task_list_view.dart';
import 'package:to_do_list/view_model/task_view_model.dart';


void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => TaskViewModel(),
      child: const MaterialApp(
        home: TaskListView(),
      ),
    ),
  );
}
