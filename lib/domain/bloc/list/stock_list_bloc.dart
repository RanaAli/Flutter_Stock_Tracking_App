import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:stock_tracking_app/data/api/api_service.dart';
import 'package:stock_tracking_app/data/datasource/remote/stocks_datastore.dart';
import 'package:stock_tracking_app/data/repositories/stock_repository_impl.dart';
import 'package:stock_tracking_app/domain/entities/forex_stocks/forex_stock_entity.dart';
import 'package:stock_tracking_app/domain/repositories/stock_repository.dart';

part 'stock_list_event.dart';
part 'stock_list_state.dart';

class StockListBloc extends Bloc<StockListEvent, StockListState> {
  StockRepository repo = StockRepositoryImpl(
      datastore: StocksDatastoreImpl(service: ApiServiceImpl.getService()));

  StockListBloc() : super(StockListInitialState()) {
    on<StockListEvent>((event, emit) async {
      emit(StockListLoadingState());
      final list = await repo.getForexStocks();
      if (list != null) {
        emit(StockListSuccessState(list: list));
      } else {
        emit(StockListErrorState());
      }
    });
  }
}
