// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class CurrencyModel {
  String Amount;
  String Code;
  String Name;
  String Dollar;
  CurrencyModel({
    required this.Amount,
    required this.Code,
    required this.Name,
    required this.Dollar,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      "Amount": Amount,
      "Code": Code,
      "Name": Name,
      "Dollar": Dollar,
    };
  }

  factory CurrencyModel.fromMap(Map<String, dynamic> map) {
    return CurrencyModel(
      Amount: map["Amount"] as String,
      Code: map["Code"] as String,
      Name: map["Name"] as String,
      Dollar: map["Dollar"] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory CurrencyModel.fromJson(String source) =>
      CurrencyModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
