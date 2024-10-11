import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_list/view_model/task_view_model.dart';

class TaskListView extends StatelessWidget {
  const TaskListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('To-Do List')),
      body: Column(
        children: [
          Expanded(
            child: Consumer<TaskViewModel>(
              builder: (context, taskViewModel, child) {
                return ListView.builder(
                  itemCount: taskViewModel.tasks.length,
                  itemBuilder: (context, index) {
                    final task = taskViewModel.tasks[index];
                    return ListTile(
                      title: Row(
                        children: [
                          Expanded(child: Text(task.title)),
                          Text(task.status),
                        ],
                      ),
                      trailing: Checkbox(
                        value: task.status == "Completed",
                        onChanged: (value) {
                          taskViewModel.toggleTaskCompletion(index);
                        },
                      ),
                    );
                  },
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: AddTaskWidget(),
          ),
        ],
      ),
    );
  }
}

class AddTaskWidget extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();

  AddTaskWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextField(
            controller: _controller,
            decoration: const InputDecoration(labelText: 'Enter task title'),
          ),
        ),
        ElevatedButton(
          onPressed: () {
            if (_controller.text.isNotEmpty) {
              context.read<TaskViewModel>().addTask(_controller.text);
              _controller.clear();
            }
          },
          child: const Text('Add Task'),
        ),
      ],
    );
  }
}
