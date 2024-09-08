import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:stock_tracking_app/data/datasource/remote/stocks_datastore.dart';
import 'package:stock_tracking_app/data/models/forex_stocks/forex_stock_response.dart';
import 'package:stock_tracking_app/data/models/quotes/quotes_response.dart';
import 'package:stock_tracking_app/data/repositories/stock_repository_impl.dart';
import 'package:stock_tracking_app/domain/entities/forex_stocks/forex_stock_entity.dart';
import 'package:stock_tracking_app/domain/entities/quotes/quotes_entity.dart';
import 'package:stock_tracking_app/domain/repositories/stock_repository.dart';

import '../../../lib/data/api/api_service.dart';

import 'stock_repo_test.mocks.dart';

@GenerateNiceMocks([MockSpec<ApiService>()])
void main() {
  late MockApiService apiService;

  final List<ForexStockResponse> stocksRepose = <ForexStockResponse>[
    ForexStockResponse(
        description: "description",
        displaySymbol: "displaySymbol",
        symbol: "symbol")
  ];

  final QuotesResponse quotesResponse = QuotesResponse(currentPrice: "1");

  setUp(() {
    apiService = MockApiService();
  });

  test('Stock Repo should fetch stock responses as a list', () async {
    when(apiService.getForexStocks()).thenAnswer((_) async => stocksRepose);

    StockRepository repo = StockRepositoryImpl(
        datastore: StocksDatastoreImpl(service: apiService));

    var entity = await repo.getForexStocks();

    List<ForexStockEntity> list = [
      ForexStockEntity(
        displaySymbol: stocksRepose[0].displaySymbol,
        symbol: stocksRepose[0].symbol,
        description: stocksRepose[0].description,
      ),
    ];

    expect(list, entity);
  });

  test('Stock Repo should fetch Quotes responses', () async {
    when(apiService.getQuotes("")).thenAnswer((_) async => quotesResponse);

    StockRepository repo = StockRepositoryImpl(
      datastore: StocksDatastoreImpl(service: apiService),
    );
    var entity = await repo.getQuotes("");

    expect(entity, QuotesEntity(currentPrice: quotesResponse.currentPrice));
  });
}
