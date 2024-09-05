import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'generated/forex_stock_response.g.dart';

@JsonSerializable()
class ForexStockResponse {
  late String? description;
  late String? displaySymbol;
  late String? symbol;

  ForexStockResponse();

  factory ForexStockResponse.fromJson(Map<String, dynamic> json) =>
      _$ForexStockResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ForexStockResponseToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
