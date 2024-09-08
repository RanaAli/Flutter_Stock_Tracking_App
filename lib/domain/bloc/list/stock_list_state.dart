part of 'stock_list_bloc.dart';

abstract class StockListState extends Equatable {
  const StockListState();
}

class StockListInitialState extends StockListState {
  @override
  List<Object> get props => [];
}

class StockListLoadingState extends StockListState {
  @override
  List<Object> get props => [];
}

class StockListErrorState extends StockListState {
  @override
  List<Object> get props => [];
}

class StockListNetworkErrorState extends StockListState {
  @override
  List<Object> get props => [];
}

class StockListSuccessState extends StockListState {
  final List<ForexStockEntity> list;

  const StockListSuccessState({required this.list});

  @override
  List<Object> get props => [list];
}
