import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_app_v2/models/task_model.dart';

class SharedPreferenceHelper {
  static const String _keyTodos = 'todos';

  // save todos to shared preference
  Future<void> saveTodos(List<Task> todos) async {
    // get shared preference instance
    final prefs = await SharedPreferences.getInstance();
    // convert todos list to json string
    final jsonString = jsonEncode(todos.map((todo) => todo.toJson()).toList());
    // save json string to shared preference
    await prefs.setString(_keyTodos, jsonString);
  }

  // get todos from shared preference
  Future<List<Task>> getTask() async {
    final prefs = await SharedPreferences.getInstance();
    final jsonString = prefs.getString(_keyTodos);
    if (jsonString == null) {
      return [];
    }
    final List<dynamic> jsonList = jsonDecode(jsonString);

    return jsonList.map((json) => Task.fromJson(json)).toList();
  }
}
