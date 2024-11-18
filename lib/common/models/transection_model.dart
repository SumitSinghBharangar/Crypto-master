import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';

class TransectionModel {
  String Amount;
  String CoinCode;
  String CoinName;
  DateTime Time;
  String Type;

  TransectionModel({
    required this.Amount,
    required this.CoinCode,
    required this.CoinName,
    required this.Time,
    required this.Type,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      "Amount": Amount,
      "CoinCode": CoinCode,
      "CoinName": CoinName,
      "Time": Timestamp.fromDate(Time),
      "Type": Type,
    };
  }

  factory TransectionModel.fromMap(Map<String, dynamic> map) {
    return TransectionModel(
      Amount: map["Amount"] as String? ?? '', // Provide a default empty string
      CoinCode:
          map["CoinCode"] as String? ?? '', // Provide a default empty string
      CoinName:
          map["CoinName"] as String? ?? '', // Provide a default empty string
      Time: (map['Time'] as Timestamp?)?.toDate() ??
          DateTime.now(), // Default to the current time
      Type: map["Type"] as String? ?? '', // Provide a default empty string
    );
  }

  String toJson() => json.encode(toMap());

  factory TransectionModel.fromJson(String source) =>
      TransectionModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
