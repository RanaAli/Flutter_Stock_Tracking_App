import 'package:stock_tracking_app/domain/bloc/chart/trade_bloc.dart';
import 'package:stock_tracking_app/domain/bloc/list/stock_list_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppBlocProvider {
  static final provider = [
    BlocProvider<StockListBloc>(create: (context) => StockListBloc()),
    BlocProvider<TradeBloc>(create: (context) => TradeBloc()),
  ];
}
