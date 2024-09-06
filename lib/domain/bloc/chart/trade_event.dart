part of 'trade_bloc.dart';

abstract class TraderEvent extends Equatable {
  const TraderEvent();
}

class TraderOpenChannelEvent extends TraderEvent {
  @override
  List<Object?> get props => [];
}

class TradeCloseChannelEvent extends TraderEvent {
  @override
  List<Object?> get props => [];
}
