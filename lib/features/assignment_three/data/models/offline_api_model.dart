class GetApiModel {
  final int userId;
  final int id;
  final String title;
  final String body;

  GetApiModel({
    required this.userId,
    required this.id,
    required this.title,
    required this.body,
  });

  factory GetApiModel.fromJson(Map<String, dynamic> json) {
    return GetApiModel(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
      body: json['body'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
      'id': id,
      'title': title,
      'body': body,
    };
  }

  factory GetApiModel.fromMap(Map<String, dynamic> map) {
    return GetApiModel(
      userId: map['userId'],
      id: map['id'],
      title: map['title'],
      body: map['body'],
    );
  }
}
