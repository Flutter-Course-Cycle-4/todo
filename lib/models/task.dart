class Task {
  String title;
  bool done;
  DateTime dateTime;
  Task(this.title, this.dateTime, {this.done = false});

  Task.fromJson(Map<String, Object?> json)
      : this(
          json['title']! as String,
          DateTime.parse(json['dateTime']! as String),
          done: json['done']! as bool,
        );

  Map<String, Object?> toJson() {
    return {
      'title': title,
      'dateTime': dateTime,
      'done': done,
    };
  }
}
