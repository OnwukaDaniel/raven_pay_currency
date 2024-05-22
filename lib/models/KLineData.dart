class KLineData {
  /// This class represents a single KLine data point for a cryptocurrency.
  int openTime;
  String openPrice;
  String highPrice;
  String lowPrice;
  String closePrice;
  String volume;
  int closeTime;
  String quoteVolume;
  int numberOfTrades;
  String takeBuyBaseVolume;
  String takeBuyQuoteVolume;

  KLineData({
  this.openTime = 0,
  this.openPrice = '',
  this.highPrice = '',
  this.lowPrice = '',
  this.closePrice = '',
  this.volume = '',
  this.closeTime = 0,
  this.quoteVolume = '',
  this.numberOfTrades = 0,
  this.takeBuyBaseVolume = '',
  this.takeBuyQuoteVolume = '',
  });

  Map<String, dynamic> toJson() => {
    'openTime': openTime,
    'openPrice': openPrice,
    'highPrice': highPrice,
    'lowPrice': lowPrice,
    'closePrice': closePrice,
    'volume': volume,
    'closeTime': closeTime,
    'quoteVolume': quoteVolume,
    'numberOfTrades': numberOfTrades,
    'takeBuyBaseVolume': takeBuyBaseVolume,
    'takeBuyQuoteVolume': takeBuyQuoteVolume,
  };
}
