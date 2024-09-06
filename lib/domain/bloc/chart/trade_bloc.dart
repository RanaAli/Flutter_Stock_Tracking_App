import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:stock_tracking_app/data/api/api_constants.dart';
import 'package:stock_tracking_app/domain/entities/trade/trade_model.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

part 'trade_event.dart';
part 'trade_state.dart';

class TradeBloc extends Bloc<TraderEvent, TradeState> {
  late WebSocketChannel channel;

  TradeBloc() : super(TradeInitial()) {
    on<TraderOpenChannelEvent>((event, emit) async {
      channel = WebSocketChannel.connect(
        Uri.parse(ApiConstants.webSocketApi),
      );
      emit(const TradeLoadingState(null));
      try {
        channel.sink.add('{"type":"subscribe","symbol":"${event.symbol}"}');
        emitStateLoaded();
      } catch (e) {
        rethrow;
      }
    });
    on<TradeCloseChannelEvent>((event, emit) async {
      channel.sink.close();
    });
  }

  void emitStateLoaded() {
    channel.stream.listen((stream) async {
      print(stream.toString() + "\n");
      final trade =
          TradeModelList.fromJson(jsonDecode(stream) as Map<String, dynamic>);
      emit(TradeLoadedState(data: trade.data.first));
    });
  }
}
