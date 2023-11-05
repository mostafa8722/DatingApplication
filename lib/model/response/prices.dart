import 'dart:convert';

/// price_chat : 5

Prices pricesFromJson(String str) => Prices.fromJson(json.decode(str));
String pricesToJson(Prices data) => json.encode(data.toJson());
class Prices {
  Prices({
    num? priceChat,}){
    _priceChat = priceChat;
  }

  Prices.fromJson(dynamic json) {
    _priceChat = json['price_chat'];
  }
  num? _priceChat;
  Prices copyWith({  num? priceChat,
  }) => Prices(  priceChat: priceChat ?? _priceChat,
  );
  num? get priceChat => _priceChat;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['price_chat'] = _priceChat;
    return map;
  }

}