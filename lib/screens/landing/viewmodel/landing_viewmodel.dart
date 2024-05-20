import 'dart:async';
import 'dart:convert';

import 'package:raven_pay_currency/imports.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:web_socket_channel/status.dart' as status;

class LandingViewModel extends BaseViewModel {
  late StreamController<dynamic> streamController;
  WebSocketChannel? channel;
  bool isSubscribed = false;

  init() {
    streamController = StreamController<dynamic>.broadcast();
    channel = WebSocketChannel.connect(
      Uri.parse('wss://stream.binance.com:9443/ws'),
    );
    sendRequest();
  }

  void sendRequest() {
    if (isSubscribed) return;
    final request = jsonEncode(
      {
        "method": "SUBSCRIBE",
        "params": ["btcusdt@aggTrade", "btcusdt@depth"],
        "id": 1
      },
    );
    channel!.stream.listen((data) {
      streamController.add(data);
    });
    channel!.sink.add(request);
  }

  @override
  void dispose() {
    if(channel == null) return;
    channel!.sink.close(status.goingAway);
    streamController.close();
    super.dispose();
  }
}
