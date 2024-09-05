import 'package:dio/dio.dart';
import 'package:stock_tracking_app/data/ApiConstants.dart';
import 'package:stock_tracking_app/data/infrastructure/http_infra.dart';
import 'package:stock_tracking_app/data/models/forex_stock_response.dart';

class ApiService {
  static ApiService instance = ApiService();

  Future<List<ForexStockResponse>> getForexStocks() async {
    Response response = await getDio().get(ApiConstants.forex_symbols);

    List<dynamic> data = response.data;

    return data.map((item) => ForexStockResponse.fromJson(item)).toList();

  }
}
