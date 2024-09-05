import 'package:stock_tracking_app/domain/entities/forex_stock_entity.dart';

abstract class StockRepository{
  Future<List<ForexStockEntity>> getForexStocks();
}