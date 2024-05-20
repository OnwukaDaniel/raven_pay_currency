import 'dart:convert';

import 'package:raven_pay_currency/imports.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:web_socket_channel/status.dart' as status;

class LandingViewModel extends BaseViewModel {
  late WebSocketChannel channel;

  init() {
    channel = WebSocketChannel.connect(
      Uri.parse('wss://stream.binance.com:9443/ws'),
    );
    sendRequest();
  }

  void sendRequest() {
    final request = jsonEncode(
      {
        "method": "SUBSCRIBE",
        "params": ["btcusdt@aggTrade", "btcusdt@depth"],
        "id": 1
      },
    );
    channel.sink.add(request);
  }

  @override
  void dispose() {
    channel.sink.close(status.goingAway);
    super.dispose();
  }
}
