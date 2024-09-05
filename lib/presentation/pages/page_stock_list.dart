import 'package:flutter/material.dart';
import 'package:stock_tracking_app/data/api_service.dart';
import 'package:stock_tracking_app/data/models/forex_stock_response.dart';
import 'package:stock_tracking_app/presentation/pages/stock_list_item.dart';
import 'package:stock_tracking_app/presentation/ui_elements/my_app_bar.dart';

class PageStockList extends StatefulWidget {
  const PageStockList({super.key});

  @override
  State<StatefulWidget> createState() => _PageStockListState();
}

class _PageStockListState extends State<PageStockList> {
  List<ForexStockResponse> _data = List.empty();
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    makeApiCall();
    return Scaffold(
      appBar: getDefaultAppBar(context, "Title"),
      body: ListView.builder(
        itemCount: _data.length,
        padding: const EdgeInsets.only(left: 8, right: 8),
        itemBuilder: (context, index) {
          final item = _data[index];
          return StockListItem(itemData: item);
        },
      ),
    );
  }

  void makeApiCall() async {
    setState(() {
      _isLoading = true;
    });
    if (_data.isEmpty) _data = await ApiService.instance.getForexStocks();
    setState(() {
      _isLoading = false;
    });
  }
}
