import 'package:flutter/material.dart';
import 'package:stock_tracking_app/domain/entities/forex_stock_entity.dart';
import 'package:stock_tracking_app/presentation/ui_elements/text_styles.dart';

class StockListItem extends StatefulWidget {
  final ForexStockEntity itemData;

  const StockListItem({super.key, required this.itemData});

  @override
  State<StatefulWidget> createState() => _StockListItemState();
}

class _StockListItemState extends State<StockListItem> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              widget.itemData.displaySymbol.toString(),
              style: textStyleNormalBoldBlue,
            ),
            const SizedBox(width: 16),
            Column(
              children: [
                Text(
                  widget.itemData.symbol.toString().trim(),
                  style: textStyleSmallBlack,
                  textAlign: TextAlign.start,
                ),
                const SizedBox(height: 8),
                Text(
                  widget.itemData.description.toString().trim(),
                  style: textStyleSmallGrey,
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
