import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:stock_tracking_app/data/datasource/remote/stocks_datastore.dart';
import 'package:stock_tracking_app/data/models/forex_stocks/forex_stock_response.dart';
import 'package:stock_tracking_app/data/models/quotes/quotes_response.dart';

import '../../../lib/data/api/api_service.dart';

import 'stock_datastore_test.mocks.dart';

@GenerateNiceMocks([MockSpec<ApiService>()])
void main() {
  late MockApiService apiService;

  final List<ForexStockResponse> stocks = <ForexStockResponse>[
    ForexStockResponse(
      description: "description",
      displaySymbol: "displaySymbol",
      symbol: "symbol",
    )
  ];

  final QuotesResponse quote = QuotesResponse(currentPrice: "1");

  setUp(() {
    apiService = MockApiService();
  });

  test('Api service should fetch stock responses as a list', () async {
    when(apiService.getForexStocks()).thenAnswer((_) async => stocks);

    StocksDatastore datastore = StocksDatastoreImpl(service: apiService);
    var response = await datastore.getForexStocks();

    expect(stocks, response);
  });

  test('Api service should fetch Quotes responses', () async {
    when(apiService.getQuotes("")).thenAnswer((_) async => quote);

    StocksDatastore datastore = StocksDatastoreImpl(service: apiService);
    var response = await datastore.getQuotes("");

    expect(quote, response);
  });
}
