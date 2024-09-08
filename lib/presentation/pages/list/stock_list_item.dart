import 'dart:async';

import 'package:flutter/material.dart';
import 'package:stock_tracking_app/data/api/api_service.dart';
import 'package:stock_tracking_app/data/datasource/remote/stocks_datastore.dart';
import 'package:stock_tracking_app/data/repositories/stock_repository_impl.dart';
import 'package:stock_tracking_app/domain/entities/forex_stocks/forex_stock_entity.dart';
import 'package:stock_tracking_app/presentation/ui_elements/text_styles.dart';
import 'package:synchronized/synchronized.dart';

class StockListItem extends StatefulWidget {
  final ForexStockEntity itemData;
  final Lock lock;

  const StockListItem({super.key, required this.itemData, required this.lock});

  @override
  State<StatefulWidget> createState() => _StockListItemState();
}

class _StockListItemState extends State<StockListItem> {
  String? _quote;
  Timer? _operation;

  @override
  void initState() {
    getQuote();
    super.initState();
  }

  @override
  void dispose() {
    _operation?.cancel();
    super.dispose();
  }

  void getQuote() async {
    // if (_quote == null) {
    await widget.lock.synchronized(
      () async {
        _operation = Timer(const Duration(seconds: 5), () async {
          var quotesResponse = await getStockRepository()
              .getQuotes(widget.itemData.symbol.toString());
          setState(() {
            _quote = quotesResponse.currentPrice;
          });
        });

        if (!mounted) _operation?.cancel();
      },
    );
    // }
  }

  StockRepositoryImpl getStockRepository() {
    return StockRepositoryImpl(
        datastore: StocksDatastoreImpl(service: ApiServiceImpl.getService()));
  }

  @override
  Widget build(BuildContext context) {
    final displaySymbol = widget.itemData.displaySymbol.toString();
    return Card(
      elevation: 0.1,
      child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(displaySymbol, style: textStyleLargeBoldBlue),
            const SizedBox(width: 16),
            if (_quote == null)
              const SizedBox(
                height: 12,
                width: 12,
                child: CircularProgressIndicator(strokeWidth: 1),
              )
            else
              Text(_quote.toString(), style: textStyleNormalBlack)
          ],
        ),
      ),
    );
  }
}
