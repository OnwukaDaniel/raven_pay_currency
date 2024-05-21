import 'dart:convert';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:raven_pay_currency/imports.dart';

class WhiskerChart extends StackedHookView<LandingViewModel> {
  const WhiskerChart({super.key});

  @override
  Widget builder(BuildContext context, parentModel) {
    var size = MediaQuery.of(context).size;
    var height = size.width;

    return ViewModelBuilder.reactive(
      viewModelBuilder: () => ChartViewModel(),
      builder: (context, model, _) {
        model.init(parentModel.interval);
        if (model.kLineDataList.isEmpty) {
          return const Center(
            child: Padding(
              padding: EdgeInsets.all(64),
              child: SpinKitDoubleBounce(color: AppColor.appColor),
            ),
          );
        }

        return Material(
          child: SizedBox(
            height: height,
            width: height,
            child: StreamBuilder(
              stream: model.kLineStreamController.stream,
              builder: (context, stream) {
                if (stream.data != null) {
                  var json = jsonDecode(stream.data) as Map<String, dynamic>;
                  var newData = KLineData(
                    openTime: int.tryParse(json['E'].toString()) ?? 0,
                    highPrice: json['h'].toString(),
                    lowPrice: json['l'].toString(),
                    openPrice: json['o'].toString(),
                    closePrice: json['c'].toString(),
                    volume: json['v'].toString(),
                  );
                  model.kLineDataList.add(newData);
                }

                return Candlesticks(
                  candles: List.generate(model.kLineDataList.length, (index) {
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
                );
              },
            ),
          ),
        );
      },
    );
  }
}
