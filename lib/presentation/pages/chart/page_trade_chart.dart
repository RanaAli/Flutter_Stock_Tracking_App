import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stock_tracking_app/domain/bloc/chart/trade_bloc.dart';
import 'package:stock_tracking_app/presentation/ui_elements/my_app_bar.dart';
import 'package:stock_tracking_app/presentation/ui_elements/text_styles.dart';

class PageTradeChart extends StatefulWidget {
  const PageTradeChart({super.key});

  @override
  State<PageTradeChart> createState() => _PageTradeChartState();
}

class _PageTradeChartState extends State<PageTradeChart> {
  late List<double> stockValueList = [];

  @override
  void initState() {
    context.read<TradeBloc>().add(TraderOpenChannelEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: Scaffold(
        appBar: getDefaultAppBar(context, "Subscribed"),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const SizedBox(height: 16),
              const Text('BINANCE - Trade', style: textStyleNormalBoldBlack),
              const SizedBox(height: 32),
              BlocBuilder<TradeBloc, TradeState>(builder: (context, state) {
                if (state is TradeLoadedState) {
                  stockValueList.add(state.data.p);
                  return Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.7,
                        child: LineChart(
                          duration: const Duration(seconds: 1),
                          LineChartData(
                            titlesData: FlTitlesData(
                                show: true,
                                leftTitles: getLeftTitles(),
                                rightTitles: getRightTiles(),
                                topTitles: getRightTiles(),
                                bottomTitles: getRightTiles()),
                            borderData: FlBorderData(show: false),
                            gridData: const FlGridData(show: true),
                            lineBarsData: [
                              LineChartBarData(
                                spots: stockValueList.asMap().entries.map(
                                  (entry) {
                                    return FlSpot(
                                      entry.key.toDouble(),
                                      entry.value,
                                    );
                                  },
                                ).toList(),
                                shadow: const Shadow(color: Colors.black),
                                isCurved: true,
                                color: Colors.green,
                                barWidth: 1,
                                show: true,
                                dotData: const FlDotData(show: true),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  );
                }
                return const Text('Waiting data...', style: textStyleError);
              }),
            ],
          ),
        ),
      ),
      onWillPop: () async {
        context.read<TradeBloc>().add(TradeCloseChannelEvent());
        return true;
      },
    );
  }

  AxisTitles getRightTiles() {
    return const AxisTitles(sideTitles: SideTitles(showTitles: false));
  }

  AxisTitles getLeftTitles() {
    return AxisTitles(
      sideTitles: SideTitles(
        getTitlesWidget: (value, meta) {
          return SideTitleWidget(
            axisSide: meta.axisSide,
            child: Text(meta.formattedValue, style: textStyleTinyGrey),
          );
        },
        reservedSize: 38,
        showTitles: true,
      ),
    );
  }
}
