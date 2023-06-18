// To parse this JSON data, do
//
//     final transactionRecord = transactionRecordFromJson(jsonString);

import 'dart:convert';

List<TransactionRecord> transactionRecordFromJson(String str) =>
    List<TransactionRecord>.from(
        json.decode(str).map((x) => TransactionRecord.fromJson(x)));

String transactionRecordToJson(List<TransactionRecord> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class TransactionRecord {
  String model;
  int pk;
  Fields fields;

  TransactionRecord({
    required this.model,
    required this.pk,
    required this.fields,
  });

  factory TransactionRecord.fromJson(Map<String, dynamic> json) =>
      TransactionRecord(
        model: json["model"],
        pk: json["pk"],
        fields: Fields.fromJson(json["fields"]),
      );

  Map<String, dynamic> toJson() => {
        "model": model,
        "pk": pk,
        "fields": fields.toJson(),
      };
}

class Fields {
  String name;
  String type;
  int amount;
  DateTime date;
  String description;

  Fields({
    required this.name,
    required this.type,
    required this.amount,
    required this.date,
    required this.description,
  });

  factory Fields.fromJson(Map<String, dynamic> json) => Fields(
        name: json["name"],
        type: json["type"],
        amount: json["amount"],
        date: DateTime.parse(json["date"]),
        description: json["description"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "type": type,
        "amount": amount,
        "date": date.toIso8601String(),
        "description": description,
      };
}
