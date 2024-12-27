import 'package:flutter/material.dart';

class TasksView extends StatelessWidget {
  final List<Task> tasks = [
    Task(name: 'Task 1', completion: 0.5),
    Task(name: 'Task 2', completion: 0.8),
    Task(name: 'Task 3', completion: 0.3),
  ];

  TasksView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tasks'),
      ),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Task Name',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: tasks.length,
              itemBuilder: (context, index) {
                final task = tasks[index];
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        task.name,
                        style: const TextStyle(fontSize: 18),
                      ),
                      const SizedBox(height: 8),
                      LinearProgressIndicator(
                        value: task.completion,
                        minHeight: 10,
                      ),
                      const SizedBox(height: 8),
                      Text('${(task.completion * 100).toInt()}%'),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class Task {
  final String name;
  final double completion;

  Task({required this.name, required this.completion});
}
