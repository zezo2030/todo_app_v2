class Task {
  String title;
  bool isCompleted;
  String description;
  String category;
  final String id;

  Task({
    required this.title,
    required this.id,
    this.isCompleted = false,
    required this.description,
    required this.category,
  });

  // convert Task object to Map object json
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'isCompleted': isCompleted,
      'description': description,
      'category': category,
    };
  }

  // convert Map object json to Task object
  factory Task.fromJson(Map<String, dynamic> json) {
    return Task(
      id: json['id'],
      title: json['title'],
      isCompleted: json['isCompleted'],
      description: json['description'],
      category: json['category'],
    );
  }
}
