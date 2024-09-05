import 'dart:async';

import 'package:dio/dio.dart';
import 'package:stock_tracking_app/data/api/api_constants.dart';
import 'package:stock_tracking_app/data/infrastructure/http_infra.dart';
import 'package:stock_tracking_app/data/models/forex_stocks/forex_stock_response.dart';
import 'package:stock_tracking_app/data/models/quotes/quotes_response.dart';

abstract class ApiService {
  Future<List<ForexStockResponse>> getForexStocks();

  Future<QuotesResponse> getQuotes(String symbol);
}

class ApiServiceImpl implements ApiService {
  Dio dio;
  final Duration timeOut = const Duration(seconds: ApiConstants.timeout);

  ApiServiceImpl({required this.dio});

  static final ApiService _instance = ApiServiceImpl(dio: getDio());

  static ApiService getService() {
    return _instance;
  }

  @override
  Future<List<ForexStockResponse>> getForexStocks() async {
    Response response =
        await dio.get(ApiConstants.getCryptoSymbols).timeout(timeOut);

    List<dynamic> data = response.data;

    return data.map((item) => ForexStockResponse.fromJson(item)).toList();
  }

  @override
  Future<QuotesResponse> getQuotes(String symbol) async {
    Response response = await dio
        .get(
          ApiConstants.getQuotes + "&symbol=$symbol",
          // queryParameters: {'symbol': "$symbol"},
        )
        .timeout(timeOut);

    print("quote data = " + response.data.toString());

    return QuotesResponse(currentPrice: response.data['c'].toString());
  }
}
