import 'package:raven_pay_currency/imports.dart';

class ChartRepo {
  static final dio = Dio(BaseOptions(baseUrl: 'https://api.binance.com/api'));

  static Future<List<KLineData>> getKLine({String interval = '1h'}) async {
    try {
      List<KLineData> kLineDataList = [];
      final response =
          await dio.get('/v3/klines?symbol=BTCUSDT&interval=$interval');
      var data = response.data as List<dynamic>;
      for(dynamic e in data){
        var list = e as List<dynamic>;
        var count = 0;
        var kLineData = KLineData();
        for(dynamic i in list){
          switch(count){
            case 0:
              kLineData.openTime = i as int;
              break;
            case 1:
              kLineData.openPrice = i as String;
              break;
            case 2:
              kLineData.highPrice = i as String;
              break;
            case 3:
              kLineData.lowPrice = i as String;
              break;
            case 4:
              kLineData.closePrice = i as String;
              break;
            case 5:
              kLineData.volume = i as String;
              break;
            case 6:
              kLineData.closeTime = i as int;
              break;
            case 7:
              kLineData.quoteVolume = i as String;
              break;
            case 8:
              kLineData.numberOfTrades = i as int;
              break;
            case 9:
              kLineData.takeBuyBaseVolume = i as String;
              break;
            case 10:
              kLineData.takeBuyQuoteVolume = i as String;
              break;
          }
          count++;
        }
        kLineDataList.add(kLineData);
      }
      data.map((e) {
      });
      return kLineDataList;
    } on DioException catch (e) {
      log('ChartRepo DioException ************* ${e.message}');
      return [];
    }
  }
}
