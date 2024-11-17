import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first

class CoinModel {
  String uuid;
  String symbol;
  String name;
  String color;
  String iconUrl;
  String marketCap;
  String price;
  num listedAt;
  num tier;
  String change;
  num rank;
  bool lowVolume;
  String coinrankingUrl;
  String volume;
  String btcPrice;

  CoinModel({
    required this.uuid,
    required this.symbol,
    required this.name,
    required this.color,
    required this.iconUrl,
    required this.marketCap,
    required this.price,
    required this.listedAt,
    required this.tier,
    required this.change,
    required this.rank,
    required this.lowVolume,
    required this.coinrankingUrl,
    required this.volume,
    required this.btcPrice,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'uuid': uuid,
      'symbol': symbol,
      'name': name,
      'color': color,
      'iconUrl': iconUrl,
      'marketCap': marketCap,
      'price': price,
      'listedAt': listedAt,
      'tier': tier,
      'change': change,
      'rank': rank,
      'lowVolume': lowVolume,
      'coinrankingUrl': coinrankingUrl,
      '24hVolume': volume,
      'btcPrice': btcPrice,
    };
  }

  factory CoinModel.fromMap(Map<String, dynamic> map) {
    return CoinModel(
      uuid: map['uuid'] as String,
      symbol: map['symbol'] as String,
      name: map['name'] as String,
      color: map['color'] as String,
      iconUrl: map['iconUrl'] as String,
      marketCap: map['marketCap'] as String,
      price: map['price'] as String,
      listedAt: map['listedAt'] as num,
      tier: map['tier'] as num,
      change: map['change'] as String,
      rank: map['rank'] as num,
      lowVolume: map['lowVolume'] as bool,
      coinrankingUrl: map['coinrankingUrl'] as String,
      volume: map['24hVolume'] as String,
      btcPrice: map['btcPrice'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory CoinModel.fromJson(String source) =>
      CoinModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
