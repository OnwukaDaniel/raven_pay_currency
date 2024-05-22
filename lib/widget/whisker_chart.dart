import 'dart:convert';

import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:raven_pay_currency/imports.dart';

class WhiskerChart extends StackedHookView<LandingViewModel> {
  const WhiskerChart({super.key});

  @override
  Widget builder(BuildContext context, parentModel) {
    return ViewModelBuilder.nonReactive(
      viewModelBuilder: () => ChartViewModel(),
      builder: (context, model, _) {
        model.init(parentModel.interval);
        return const WhiskerChartBody();
      },
    );
  }
}

class WhiskerChartBody extends StackedHookView<ChartViewModel> {
  const WhiskerChartBody({super.key});

  @override
  Widget builder(BuildContext context, model) {
    var bs = TextUtils.bodySmall(context);
    var size = MediaQuery.of(context).size;
    var height = size.width;
    return Material(
      color: AppColor.cardColor(context),
      child: StreamBuilder(
        stream: model.kLineStreamController.stream,
        builder: (context, stream) {
          KLineData newData = KLineData();
          if (stream.data != null) {
            var json = jsonDecode(stream.data) as Map<String, dynamic>;
            newData = KLineData(
              openTime: int.tryParse(json['E'].toString()) ?? 0,
              highPrice: json['h'].toString(),
              lowPrice: json['l'].toString(),
              openPrice: json['o'].toString(),
              closePrice: json['c'].toString(),
              volume: json['v'].toString(),
            );
            model.kLineStreamController.add(jsonEncode({
              'E': newData.openTime,
              'h': newData.highPrice,
              'l': newData.lowPrice,
              'o': newData.openPrice,
              'c': newData.closePrice,
              'v': newData.volume,
            }));
            //model.kLineDataList.add(newData);
          }

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 40,
                child: ListView(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  children: [
                    Image.asset('assets/landing/arrow_drop_down.png'),
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(model.symbol.toUpperCase(), style: bs),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Text('O', style: bs),
                          const SizedBox(width: 8),
                          Text(
                            (double.tryParse(newData.openPrice) ?? 0)
                                .toStringAsFixed(2),
                            style: bs.copyWith(color: Colors.green),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Text('H', style: bs),
                          const SizedBox(width: 8),
                          Text(
                            (double.tryParse(newData.highPrice) ?? 0)
                                .toStringAsFixed(2),
                            style: bs.copyWith(color: Colors.green),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Text('L', style: bs),
                          const SizedBox(width: 8),
                          Text(
                            (double.tryParse(newData.lowPrice) ?? 0)
                                .toStringAsFixed(2),
                            style: bs.copyWith(color: Colors.green),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Text('C', style: bs),
                          const SizedBox(width: 8),
                          Text(
                            (double.tryParse(newData.closePrice) ?? 0)
                                .toStringAsFixed(2),
                            style: bs.copyWith(color: Colors.green),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Stack(
                children: [
                  SizedBox(
                    height: height,
                    width: height,
                    child: Candlesticks(
                      candles:
                          List.generate(model.kLineDataList.length, (index) {
                        var data = model.kLineDataList[index];
                        return Candle(
                          date: DateTime.fromMillisecondsSinceEpoch(
                            data.openTime,
                          ),
                          high: double.tryParse(data.highPrice) ?? 0,
                          low: double.tryParse(data.lowPrice) ?? 0,
                          open: double.tryParse(data.openPrice) ?? 0,
                          close: double.tryParse(data.closePrice) ?? 0,
                          volume: double.tryParse(data.volume) ?? 0,
                        );
                      }),
                    ),
                  ),
                  if (model.kLineDataList.isEmpty ||
                      model.busy(model.getKLineKey))
                    Center(
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: (height / 2) - 8),
                        child: const SpinKitDoubleBounce(
                          color: AppColor.appColor,
                        ),
                      ),
                    )
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}
