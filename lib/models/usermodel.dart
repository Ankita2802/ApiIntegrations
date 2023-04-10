import 'dart:convert';

List<Usermodel> usermodelFromJson(String str) => List<Usermodel>.from(json.decode(str).map((x) => Usermodel.fromJson(x)));

String usermodelToJson(List<Usermodel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Usermodel {
  Usermodel({
    required this.userId,
    required this.id,
    required this.title,
    required this.body,
  });

  int userId;
  int id;
  String title;
  String body;

  factory Usermodel.fromJson(Map<String, dynamic> json) => Usermodel(
    userId: json["userId"],
    id: json["id"],
    title: json["title"],
    body: json["body"],
  );

  Map<String, dynamic> toJson() => {
    "userId": userId,
    "id": id,
    "title": title,
    "body": body,
  };
}
