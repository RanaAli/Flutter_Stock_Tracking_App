import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'generated/forex_stock_entity.g.dart';

@JsonSerializable()
class ForexStockEntity extends Equatable {
  String? description;
  @JsonKey(name: 'displaySymbol')
  String? displaySymbol;
  String? symbol;

  ForexStockEntity({this.description, this.displaySymbol, this.symbol});

  factory ForexStockEntity.fromJson(Map<String, dynamic> json) =>
      _$ForexStockEntityFromJson(json);

  Map<String, dynamic> toJson() => _$ForexStockEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }

  @override
  List<Object?> get props => [];
}
