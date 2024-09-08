import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:stock_tracking_app/domain/entities/forex_stocks/forex_stock_entity.dart';
import 'package:stock_tracking_app/presentation/pages/list/stock_list_item.dart';
import 'package:synchronized/synchronized.dart';

void main() {
  testWidgets("the stock listItem should display stock displaySymbol",
      (tester) async {
    final item = ForexStockEntity(
        displaySymbol: "displaySymbol",
        description: "description",
        symbol: "symbol");

    await tester.pumpWidget(MaterialApp(
        home: Scaffold(
      body: StockListItem(
        itemData: item,
        lock: Lock(),
      ),
    )));

    final displaySymbolExtracted = find.text("displaySymbol");

    expect(displaySymbolExtracted, findsOneWidget);
  });
}
