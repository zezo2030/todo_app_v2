import 'package:flutter/material.dart';
import 'package:todo_app_v2/models/task_model.dart';
import 'package:todo_app_v2/services/shared_preference_helper.dart';

class TodoViewModel extends ChangeNotifier {
  // قائمة المهام
  final List<Task> _tasks = [];

  // مساعد التفضيلات المشتركة
  final SharedPreferenceHelper _sharedPreferenceHelper =
      SharedPreferenceHelper();

  // الحصول على قائمة المهام
  List<Task> get tasks => _tasks;

  //? إضافة مهمة
  Future<void> addTask(String title, String desc, String category) async {
    // إنشاء مهمة جديدة
    final task = Task(
      title: title,
      id: DateTime.now().toString(),
      description: desc,
      category: category,
    );
    // إضافة المهمة إلى القائمة
    _tasks.add(task);
    // حفظ المهام المحدثة في المساعد المشترك
    await _sharedPreferenceHelper.saveTodos(_tasks);
    // إعلام المستمعين بالتغيير
    notifyListeners();
  }

  //* load task
  Future<void> loadTask() async {
    // تحميل المهام من المساعد المشترك
    final tasks = await _sharedPreferenceHelper.getTask();
    // مسح قائمة المهام الحالية
    _tasks.clear();
    // إضافة المهام المحملة إلى القائمة
    _tasks.addAll(tasks);
    // إعلام المستمعين بالتغيير
    notifyListeners();
  }

  //? تبديل حالة المهمة
  Future<void> toggleTask(String id) async {
    // العثور على المهمة باستخدام المعرف
    final task = _tasks.firstWhere((task) => task.id == id);
    // تبديل حالة إكمال المهمة
    task.isCompleted = !task.isCompleted;
    // حفظ المهام المحدثة في المساعد المشترك
    await _sharedPreferenceHelper.saveTodos(_tasks);
    // إعلام المستمعين بالتغيير
    notifyListeners();
  }

  //! إزالة المهمة
  Future<void> removeTask(String id) async {
    // إزالة المهمة من القائمة باستخدام المعرف
    _tasks.removeWhere((task) => task.id == id);
    // حفظ المهام المحدثة في المساعد المشترك
    await _sharedPreferenceHelper.saveTodos(_tasks);
    // إعلام المستمعين بالتغيير
    notifyListeners();
  }
}
