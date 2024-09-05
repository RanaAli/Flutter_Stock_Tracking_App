import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stock_tracking_app/app_strings.dart';
import 'package:stock_tracking_app/domain/bloc/list/stock_list_bloc.dart';
import 'package:stock_tracking_app/presentation/pages/stock_list_item.dart';
import 'package:stock_tracking_app/presentation/ui_elements/my_app_bar.dart';
import 'package:stock_tracking_app/presentation/ui_elements/text_styles.dart';

class PageStockList extends StatefulWidget {
  const PageStockList({super.key});

  @override
  State<StatefulWidget> createState() => _PageStockListState();
}

class _PageStockListState extends State<PageStockList> {
  @override
  void initState() {
    context.read<StockListBloc>().add(GetStockListEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getDefaultAppBar(context, AppStrings.appTitle),
      body: BlocBuilder<StockListBloc, StockListState>(
        builder: (context, state) {
          if (state is StockListLoadingState) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is StockListSuccessState) {
            return ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: state.list.length,
              padding: const EdgeInsets.only(left: 8, right: 8),
              itemBuilder: (context, index) {
                return StockListItem(itemData: state.list[index]);
              },
            );
          } else if (state is StockListErrorState) {
            return const Center(child: Text(AppStrings.error));
          } else {
            return const Center(
              child: Text(
                AppStrings.downloadingStocks,
                style: textStyleNormalBoldBlack,
              ),
            );
          }
        },
      ),
    );
  }
}
