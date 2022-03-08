import 'dart:convert';

Yeay yeayFromJson(String str) => Yeay.fromJson(json.decode(str));

String yeayToJson(Yeay data) => json.encode(data.toJson());

class Yeay {
  Yeay({
    this.queryStatistics,
    this.totalPages,
    this.currentPageIndex,
    this.totalRecords,
    this.returnedRecords,
    required this.items,
  });

  QueryStatistics? queryStatistics;
  int? totalPages;
  int? currentPageIndex;
  int? totalRecords;
  int? returnedRecords;
  List<Item> items;

  factory Yeay.fromJson(Map<String, dynamic> json) => Yeay(
        queryStatistics: QueryStatistics.fromJson(json["queryStatistics"]),
        totalPages: json["totalPages"],
        currentPageIndex: json["currentPageIndex"],
        totalRecords: json["totalRecords"],
        returnedRecords: json["returnedRecords"],
        items: List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "queryStatistics": queryStatistics?.toJson(),
        "totalPages": totalPages,
        "currentPageIndex": currentPageIndex,
        "totalRecords": totalRecords,
        "returnedRecords": returnedRecords,
        "items": List<dynamic>.from(items.map((x) => x.toJson())),
      };
}

class Item {
  Item({
    this.title,
    this.isTrusted,
    this.type,
    this.description,
    this.thumbnailUrl,
    this.entityId,
    this.referenceCount,
  });

  String? title;
  bool? isTrusted;
  int? type;
  String? description;
  String? thumbnailUrl;
  String? entityId;
  dynamic referenceCount;

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        title: json["title"],
        isTrusted: json["isTrusted"],
        type: json["type"],
        description: json["description"],
        thumbnailUrl:
            json["thumbnailUrl"] == null ? null : json["thumbnailUrl"],
        entityId: json["entityId"],
        referenceCount: json["referenceCount"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "isTrusted": isTrusted,
        "type": type,
        "description": description,
        "thumbnailUrl": thumbnailUrl == null ? null : thumbnailUrl,
        "entityId": entityId,
        "referenceCount": referenceCount,
      };
}

class QueryStatistics {
  QueryStatistics();

  factory QueryStatistics.fromJson(Map<String, dynamic> json) =>
      QueryStatistics();

  Map<String, dynamic> toJson() => {};
}
