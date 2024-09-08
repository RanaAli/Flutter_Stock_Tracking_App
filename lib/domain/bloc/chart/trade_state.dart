part of 'trade_bloc.dart';

abstract class TradeState extends Equatable {
  const TradeState();
}

class TradeInitial extends TradeState {
  @override
  List<Object> get props => [];
}

class TradeLoadingState extends TradeState {
  final TradeModel? data;

  const TradeLoadingState(this.data);

  @override
  List<Object?> get props => [data];
}

class TradeErrorState extends TradeState {
  @override
  List<Object?> get props => [];
}

class TradeNetworkErrorState extends TradeState {
  @override
  List<Object?> get props => [];
}

class TradeSuccessState extends TradeState {
  const TradeSuccessState({required this.data});

  final TradeModel data;

  @override
  List<Object?> get props => [data];
}
