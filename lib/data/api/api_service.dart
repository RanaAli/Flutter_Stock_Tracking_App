import 'package:dio/dio.dart';
import 'package:stock_tracking_app/data/api/api_constants.dart';
import 'package:stock_tracking_app/data/infrastructure/http_infra.dart';
import 'package:stock_tracking_app/data/models/forex_stock_response.dart';

abstract class ApiService {
  Future<List<ForexStockResponse>> getForexStocks();
}

class ApiServiceImpl implements ApiService {
  Dio dio;

  ApiServiceImpl({required this.dio});

  static final ApiService _instance = ApiServiceImpl(dio: getDio());

  static ApiService getService() {
    return _instance;
  }

  @override
  Future<List<ForexStockResponse>> getForexStocks() async {
    Response response = await dio
        .get(ApiConstants.forexSymbols)
        .timeout(const Duration(seconds: ApiConstants.timeout));

    List<dynamic> data = response.data;

    return data.map((item) => ForexStockResponse.fromJson(item)).toList();
  }
}
