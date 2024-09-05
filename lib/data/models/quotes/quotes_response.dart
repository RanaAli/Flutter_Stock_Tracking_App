import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'generated/quotes_response.g.dart';

@JsonSerializable()
class QuotesResponse {
  @JsonKey(name: 'c')
  String currentPrice;

  QuotesResponse({required this.currentPrice});

  factory QuotesResponse.fromJson(Map<String, dynamic> json) =>
      _$QuotesResponseFromJson(json);

  Map<String, dynamic> toJson() => _$QuotesResponseToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
