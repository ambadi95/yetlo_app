// To parse this JSON data, do
//
//     final subCategoryResponse = subCategoryResponseFromMap(jsonString);

import 'dart:convert';

SubCategoryResponse subCategoryResponseFromMap(String str) => SubCategoryResponse.fromMap(json.decode(str));

String subCategoryResponseToMap(SubCategoryResponse data) => json.encode(data.toMap());

class SubCategoryResponse {
  final bool? success;
  final int? code;
  final String? message;
  final String? title;
  final List<Re>? res;

  SubCategoryResponse({
    this.success,
    this.code,
    this.message,
    this.title,
    this.res,
  });

  factory SubCategoryResponse.fromMap(Map<String, dynamic> json) => SubCategoryResponse(
    success: json["success"],
    code: json["code"],
    message: json["message"],
    title: json["title"],
    res: json["res"] == null ? [] : List<Re>.from(json["res"]!.map((x) => Re.fromMap(x))),
  );

  Map<String, dynamic> toMap() => {
    "success": success,
    "code": code,
    "message": message,
    "title": title,
    "res": res == null ? [] : List<dynamic>.from(res!.map((x) => x.toMap())),
  };
}

class Re {
  final int? id;
  final String? image;
  final String? backgroundColor;
  final Style? style;
  final String? sectionId;

  Re({
    this.id,
    this.image,
    this.backgroundColor,
    this.style,
    this.sectionId,
  });

  factory Re.fromMap(Map<String, dynamic> json) => Re(
    id: json["id"],
    image: json["image"],
    backgroundColor: json["background_color"],
    style: styleValues.map[json["style"]]!,
    sectionId: json["section_id"],
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "image": image,
    "background_color": backgroundColor,
    "style": styleValues.reverse[style],
    "section_id": sectionId,
  };
}

enum Style { STYLE_6 }

final styleValues = EnumValues({
  "style_6": Style.STYLE_6
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
