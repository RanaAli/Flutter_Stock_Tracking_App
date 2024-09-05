import 'package:stock_tracking_app/data/api/api_service.dart';
import 'package:stock_tracking_app/data/models/forex_stock_response.dart';

abstract class StocksDatastore {
  Future<List<ForexStockResponse>> getForexStocks();
}

class StocksDatastoreImpl implements StocksDatastore {
  final ApiService service;

  StocksDatastoreImpl({required this.service});

  @override
  Future<List<ForexStockResponse>> getForexStocks() => service.getForexStocks();
}