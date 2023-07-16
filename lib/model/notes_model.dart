class NotesModel {
  String? id;
  String? title;
  String? content;
  // String? image;
  // int? usersId;
  // String? date;

  NotesModel({
    this.id,
    this.title,
    this.content,
  });

  NotesModel.fromJson(Map<String, dynamic> json) {
    id = json['id'].toString();
    title = json['title'];
    content = json['content'];
  }

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "title": title,
      "content": content,
    };
  }
}
