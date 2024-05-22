import 'dart:async';
import 'dart:convert';
import 'package:raven_pay_currency/enum/body_tab_enum.dart';
import 'package:raven_pay_currency/imports.dart';
import 'package:web_socket_channel/status.dart' as status;
import 'package:web_socket_channel/web_socket_channel.dart';

class OrderBookViewModel extends BaseViewModel {
  late StreamController<dynamic> orderBookController;
  WebSocketChannel? orderBookChannel;
  double averagePrice = 0.0;
  String symbol = "btcusdt";

  init() async {
    orderBookController = StreamController<dynamic>.broadcast();
    String streamNameOrderBook = "$symbol@depth";
    String orderBookWebSocketUrl =
        "wss://stream.binance.com:9443/ws/$streamNameOrderBook";
    orderBookChannel =
        WebSocketChannel.connect(Uri.parse(orderBookWebSocketUrl));
    orderBookChannel!.stream.listen((data) {
      orderBookController.add(data);
    });
    averagePriceEventBus.on<AveragePriceEvent>().listen((event) {
      averagePrice = event.input;
      notifyListeners();
    });
  }

  @override
  void dispose() {
    //if (orderBookChannel == null) return;
    //orderBookChannel!.sink.close(status.goingAway);
    //orderBookController.close();
    super.dispose();
  }
}
