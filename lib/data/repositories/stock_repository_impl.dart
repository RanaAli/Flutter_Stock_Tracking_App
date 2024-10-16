import 'package:stock_tracking_app/data/datasource/remote/stocks_datastore.dart';
import 'package:stock_tracking_app/domain/entities/forex_stocks/forex_stock_entity.dart';
import 'package:stock_tracking_app/domain/entities/quotes/quotes_entity.dart';
import 'package:stock_tracking_app/domain/repositories/stock_repository.dart';

class StockRepositoryImpl implements StockRepository {
  StocksDatastore datastore;

  StockRepositoryImpl({required this.datastore});

  @override
  Future<List<ForexStockEntity>> getForexStocks() async {
    final list = await datastore.getForexStocks();

    return list
        .map((item) => ForexStockEntity(
              description: item.description,
              displaySymbol: item.displaySymbol,
              symbol: item.symbol,
            ))
        .toList();
  }

  @override
  Future<QuotesEntity> getQuotes(String symbol) async {
    final response = await datastore.getQuotes(symbol);
    return QuotesEntity(currentPrice: response.currentPrice);
  }
}
