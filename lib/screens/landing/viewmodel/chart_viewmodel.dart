import 'dart:async';

import 'package:raven_pay_currency/imports.dart';
import 'package:raven_pay_currency/repository/chart_repo.dart';
import 'package:web_socket_channel/status.dart' as status;
import 'package:web_socket_channel/web_socket_channel.dart';

class ChartViewModel extends BaseViewModel {
  late StreamController<dynamic> kLineStreamController;
  WebSocketChannel? kLineChannel;
  List<KLineData> kLineDataList = [];
  String interval = '';

  init(String interval) async {
    this.interval = interval;
    kLineStreamController = StreamController<dynamic>.broadcast();
    var list = await ChartRepo.getKLine(interval: this.interval);
    kLineDataList = list.reversed.toList();
    if (kLineDataList.isNotEmpty) {
      subToKLine();
      notifyListeners();
    }
  }

  subToKLine({String interval = '1h'}) {
    if (kLineChannel != null) kLineChannel!.sink.close();
    String symbol = "btcusdt";
    String streamName = "$symbol@miniTicker";
    String binanceWebSocketUrl = "wss://stream.binance.com:9443/ws/$streamName";
    kLineChannel = WebSocketChannel.connect(Uri.parse(binanceWebSocketUrl));
    kLineChannel!.stream.listen((event) {
      kLineStreamController.add(event);
    });
  }

  @override
  void dispose() {
    if (kLineChannel == null) return;
    kLineChannel!.sink.close(status.goingAway);
    kLineStreamController.close();
    super.dispose();
  }
}
