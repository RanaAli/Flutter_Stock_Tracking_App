part of 'trade_bloc.dart';

abstract class TraderEvent extends Equatable {
  const TraderEvent();
}

class TraderOpenChannelEvent extends TraderEvent {
  final String symbol;

  const TraderOpenChannelEvent({required this.symbol});

  @override
  List<Object?> get props => [];
}

class TradeCloseChannelEvent extends TraderEvent {
  final String symbol;

  const TradeCloseChannelEvent({required this.symbol});

  @override
  List<Object?> get props => [];
}
