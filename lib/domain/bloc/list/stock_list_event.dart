part of 'stock_list_bloc.dart';

abstract class StockListEvent extends Equatable{
  const StockListEvent();
}

class GetStockListEvent extends StockListEvent{
  @override
  List<Object?> get props => [];

}