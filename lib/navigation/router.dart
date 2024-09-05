import 'package:flutter/material.dart';
import 'package:stock_tracking_app/presentation/pages/page_stock_list.dart';

void navigateToStockListScreen(BuildContext context) {
  Navigator.of(context)
      .push(MaterialPageRoute(builder: (context) => PageStockList()));
}
