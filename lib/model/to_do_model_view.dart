class ToDoModelAddList {
  String? title;
  String? content;
  String? time;

  ToDoModelAddList({
    this.title,
    this.content,
    this.time,
  });

  ToDoModelAddList.fromJson(Map<String, dynamic> json) {
    title = json["title"];
    content = json["content"];
    time = json["time"];
  }
}
