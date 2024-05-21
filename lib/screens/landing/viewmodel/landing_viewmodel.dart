import 'dart:async';
import 'dart:convert';
import 'package:raven_pay_currency/imports.dart';
import 'package:web_socket_channel/status.dart' as status;
import 'package:web_socket_channel/web_socket_channel.dart';

class LandingViewModel extends BaseViewModel {
  late StreamController<dynamic> streamController;
  WebSocketChannel? channel;
  List<KLineData> kLineDataList = [];
  bool isSubscribed = false;
  String interval = '1h';

  init() async {
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

  setStream(String input){
    interval = input;
    notifyListeners();
  }

  setInterval(String input){
    interval = input;
    notifyListeners();
  }

  @override
  void dispose() {
    if (channel == null) return;
    channel!.sink.close(status.goingAway);
    streamController.close();
    super.dispose();
  }
}
