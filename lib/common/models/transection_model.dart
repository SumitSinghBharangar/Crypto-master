// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class TransectionModel {
  String Amount;
  String Address;
  String Network;
  // String Txid;
  String CoinCode;
  String CoinName;
  String NetworkFee;
  String Wallet;
  DateTime Time;
  String Type;

  TransectionModel({
    required this.Amount,
    required this.Network,
    // required this.Txid,
    required this.CoinCode,
    required this.CoinName,
    required this.NetworkFee,
    required this.Wallet,
    required this.Time,
    required this.Type,
    required this.Address,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      "Amount": Amount,
      "Network": Network,
      // "Txid": Txid,
      "NetworkFee": NetworkFee,
      "CoinCode": CoinCode,
      "CoinName": CoinName,
      "Wallet": Wallet,
      "Time": Timestamp.fromDate(Time),
      "Type": Type,
      "Address": Address,
    };
  }

  factory TransectionModel.fromMap(Map<String, dynamic> map) {
    return TransectionModel(
      Amount: map["Amount"] as String? ?? '', // Provide a default empty string
      Network:
          map["Network"] as String? ?? '', // Provide a default empty string
      // Txid: map["Txid"] as String? ?? '', // Provide a default empty string
      NetworkFee:
          map["NetworkFee"] as String? ?? '', // Provide a default empty string
      Wallet: map["Wallet"] as String? ?? '', // Provide a default empty string
      CoinCode:
          map["CoinCode"] as String? ?? '', // Provide a default empty string
      CoinName:
          map["CoinName"] as String? ?? '', // Provide a default empty string
      Time: (map['Time'] as Timestamp?)?.toDate() ??
          DateTime.now(), // Default to the current time
      Type: map["Type"] as String? ?? '', // Provide a default empty string
      Address:
          map["Address"] as String? ?? '', // Provide a default empty string
    );
  }

  String toJson() => json.encode(toMap());

  factory TransectionModel.fromJson(String source) =>
      TransectionModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
