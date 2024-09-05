import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stock_tracking_app/data/models/forex_stock_response.dart';
import 'package:stock_tracking_app/presentation/ui_elements/text_styles.dart';

class StockListItem extends StatefulWidget {
  final ForexStockResponse itemData;

  const StockListItem({super.key, required this.itemData});

  @override
  State<StatefulWidget> createState() => _StockListItemState();
}

class _StockListItemState extends State<StockListItem> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              widget.itemData.displaySymbol.toString(),
              style: textStyleSmallGrey,
            ),
            const SizedBox(width: 16),
            Column(
              children: [
                Text(
                  widget.itemData.symbol.toString().trim(),
                  style: textStyleNormalBoldBlue,
                  textAlign: TextAlign.start,
                ),
                const SizedBox(height: 8),
                Text(widget.itemData.description.toString().trim(),
                  style: textStyleSmallBlack,
                  textAlign: TextAlign.start,
                ),
              ],
            ),
            const SizedBox(width: 16),
          ],
        ),
      ),
    );
  }
}
