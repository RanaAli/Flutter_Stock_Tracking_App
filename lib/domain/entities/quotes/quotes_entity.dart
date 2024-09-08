import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'generated/quotes_entity.g.dart';

@JsonSerializable()
class QuotesEntity extends Equatable{
  @JsonKey(name: 'c')
  String currentPrice;

  QuotesEntity({required this.currentPrice});

  factory QuotesEntity.fromJson(Map<String, dynamic> json) =>
      _$QuotesEntityFromJson(json);

  Map<String, dynamic> toJson() => _$QuotesEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }

  @override
  List<Object?> get props => [];
}
