import 'package:stock_tracking_app/domain/entities/forex_stocks/forex_stock_entity.dart';
import 'package:stock_tracking_app/domain/entities/quotes/quotes_entity.dart';

abstract class StockRepository {
  Future<List<ForexStockEntity>> getForexStocks();

  Future<QuotesEntity> getQuotes(String symbol);
}
