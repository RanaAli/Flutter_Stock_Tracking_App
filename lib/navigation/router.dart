import 'package:flutter/material.dart';
import 'package:stock_tracking_app/domain/entities/forex_stocks/forex_stock_entity.dart';
import 'package:stock_tracking_app/presentation/pages/chart/page_trade_chart.dart';
import 'package:stock_tracking_app/presentation/pages/list/page_stock_list.dart';

void navigateToStockListScreen(BuildContext context) {
  Navigator.of(context)
      .push(MaterialPageRoute(builder: (context) => const PageStockList()));
}

void navigateToChartScreen(BuildContext context, ForexStockEntity stockItem) {
  Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => PageTradeChart(stock: stockItem)));
}
