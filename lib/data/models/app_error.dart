class AppError {
  String? message;
  String? type;
  String? name;

  AppError({this.message, this.type, this.name});

  factory AppError.fromJson(Map<String, dynamic> json) =>
      AppError(message: json["message"], type: json["type"], name: json["name"]);

  Map<String, dynamic> toJson() => {"message": message, "type": type, "name": name};
}
