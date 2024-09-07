import 'package:stock_tracking_app/data/api/api_service.dart';
import 'package:stock_tracking_app/data/models/forex_stocks/forex_stock_response.dart';
import 'package:stock_tracking_app/data/models/quotes/quotes_response.dart';

abstract class StocksDatastore {
  Future<List<ForexStockResponse>> getForexStocks();

  Future<QuotesResponse> getQuotes(String symbol);
}

class StocksDatastoreImpl implements StocksDatastore {
  final ApiService service;

  StocksDatastoreImpl({required this.service});

  @override
  Future<List<ForexStockResponse>> getForexStocks() => service.getForexStocks();

  @override
  Future<QuotesResponse> getQuotes(String symbol) => service.getQuotes(symbol);
}