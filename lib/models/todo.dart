class Todo {
  int id;
  String title;
  String description;

  Todo({
    required this.id,
    required this.title,
    required this.description,
  });

  factory Todo.fromJson(Map<String, Object?> json) {
    return Todo(
      id: json["id"] as int,
      title: json["title"] as String,
      description: json["description"] as String,
    );
  }


  Map<String, Object?> toJson() => {
    "id" : id,
    "title" : title,
    "description" : description,
  };

  @override
  String toString() {
    return 'Todo{id: $id, title: $title, description: $description}';
  }
}
