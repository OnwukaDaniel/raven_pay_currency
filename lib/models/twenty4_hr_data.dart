class Twenty4HrData {
  final String symbol;
  final double priceChange;
  final double priceChangePercent;
  final double weightedAveragePrice;
  final double previousClosePrice;
  final double currentPrice;
  final double quoteVolume;
  final double bestBidPrice;
  final double bestBidQuantity;
  final double bestAskPrice;
  final double bestAskQuantity;
  final double openPrice;
  final double highPrice;
  final double lowPrice;
  final double baseVolume;
  final double quoteVolumeReal;
  final int openTime;
  final int closeTime;
  final int firstTradeId;
  final int lastTradeId;
  final int tradeCount;

  Twenty4HrData({
    this.symbol = '',
    this.priceChange = 0,
    this.priceChangePercent = 0,
    this.weightedAveragePrice = 0,
    this.previousClosePrice = 0,
    this.currentPrice = 0,
    this.quoteVolume = 0,
    this.bestBidPrice = 0,
    this.bestBidQuantity = 0,
    this.bestAskPrice = 0,
    this.bestAskQuantity = 0,
    this.openPrice = 0,
    this.highPrice = 0,
    this.lowPrice = 0,
    this.baseVolume = 0,
    this.quoteVolumeReal = 0,
    this.openTime = 0,
    this.closeTime = 0,
    this.firstTradeId = 0,
    this.lastTradeId = 0,
    this.tradeCount = 0,
  });

  factory Twenty4HrData.fromJson(Map<String, dynamic> json) => Twenty4HrData(
        symbol: (json['s'] ?? ''),
        priceChange: double.tryParse(json['p'] as String) ?? 0.0,
        priceChangePercent: double.tryParse(json['P'] as String) ?? 0.0,
        weightedAveragePrice: double.tryParse(json['w'] as String) ?? 0.0,
        previousClosePrice: double.tryParse(json['x'] as String) ?? 0.0,
        currentPrice: double.tryParse(json['c'] as String) ?? 0.0,
        quoteVolume: double.tryParse(json['Q'] as String) ?? 0.0,
        bestBidPrice: double.tryParse(json['b'] as String) ?? 0.0,
        bestBidQuantity: double.tryParse(json['B'] as String) ?? 0.0,
        bestAskPrice: double.tryParse(json['a'] as String) ?? 0.0,
        bestAskQuantity: double.tryParse(json['A'] as String) ?? 0.0,
        openPrice: double.tryParse(json['o'] as String) ?? 0.0,
        highPrice: double.tryParse(json['h'] as String) ?? 0.0,
        lowPrice: double.tryParse(json['l'] as String) ?? 0.0,
        baseVolume: double.tryParse(json['v'] as String) ?? 0.0,
        quoteVolumeReal: double.tryParse(json['q'] as String) ?? 0.0,
        openTime: (json['O'] ?? 0),
        closeTime: (json['O'] ?? 0),
        firstTradeId: (json['F'] ?? 0),
        lastTradeId: (json['L'] ?? 0),
        tradeCount: (json['n'] ?? 0),
      );
}
