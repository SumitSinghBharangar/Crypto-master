// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class WithdrawModel {
  String type;
  String amount;
  WithdrawModel({
    required this.type,
    required this.amount,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      "type": type,
      "amount": amount,
    };
  }

  factory WithdrawModel.fromMap(Map<String, dynamic> map) {
    return WithdrawModel(
      type: map['type'] as String,
      amount: map['amount'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory WithdrawModel.fromJson(String source) =>
      WithdrawModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
