import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stock_tracking_app/app_strings.dart';
import 'package:stock_tracking_app/domain/bloc/list/stock_list_bloc.dart';
import 'package:stock_tracking_app/domain/entities/forex_stocks/forex_stock_entity.dart';
import 'package:stock_tracking_app/navigation/router.dart';
import 'package:stock_tracking_app/presentation/pages/list/stock_list_item.dart';
import 'package:stock_tracking_app/presentation/ui_elements/my_app_bar.dart';
import 'package:stock_tracking_app/presentation/ui_elements/text_styles.dart';
import 'package:synchronized/synchronized.dart';

class PageStockList extends StatefulWidget {
  const PageStockList({super.key});

  @override
  State<StatefulWidget> createState() => _PageStockListState();
}

class _PageStockListState extends State<PageStockList> {
  List<ForexStockEntity> searchList = [];
  List<ForexStockEntity> list = [];

  late TextEditingController _searchTextFieldController;

  @override
  void initState() {
    context.read<StockListBloc>().add(GetStockListEvent());
    super.initState();
    _searchTextFieldController = TextEditingController();
  }

  @override
  void dispose() {
    _searchTextFieldController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Lock lock = Lock();
    return Scaffold(
      appBar: getDefaultAppBar(context, AppStrings.appTitle),
      body: BlocBuilder<StockListBloc, StockListState>(
        builder: (context, state) {
          if (state is StockListLoadingState) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is StockListSuccessState) {
            list = state.list;
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: _searchTextFieldController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8.0)),
                      ),
                      labelText: AppStrings.searchLabel,
                      labelStyle: textStyleSmallGrey,
                    ),
                    onChanged: (value) {
                      setState(() {
                        searchList = list
                            .where((item) => listSearchValidation(item, value))
                            .toList();
                      });
                    },
                  ),
                ),
                searchList.isEmpty
                    ? defaultListView(list, lock)
                    : defaultListView(searchList, lock),
              ],
            );
          } else if (state is StockListNetworkErrorState) {
            return const Center(
                child: Text(AppStrings.networkError, style: textStyleError));
          } else if (state is StockListErrorState) {
            return const Center(
                child: Text(AppStrings.error, style: textStyleError));
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

  Expanded defaultListView(List<ForexStockEntity> list, Lock lock) {
    return Expanded(
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: list.length,
        padding: const EdgeInsets.only(left: 8, right: 8),
        itemBuilder: (context, index) {
          final itemData = list[index];
          return GestureDetector(
            onTap: () {
              navigateToChartScreen(context, itemData);
            },
            child: StockListItem(itemData: itemData, lock: lock),
          );
        },
      ),
    );
  }

  bool listSearchValidation(ForexStockEntity item, String value) {
    return item.symbol.toString().toLowerCase().contains(value.toLowerCase());
  }
}
