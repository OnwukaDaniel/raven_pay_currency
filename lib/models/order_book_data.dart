class OrderBookData {
  final String eventType;
  final int eventTime;
  final String symbol;
  final int firstUpdateId;
  final int finalUpdateId;
  final List<Order> bids;
  final List<Order> asks;

  OrderBookData({
    this.eventType = '',
    this.eventTime = 0,
    this.symbol = '',
    this.firstUpdateId = 0,
    this.finalUpdateId = 0,
    this.bids = const [],
    this.asks = const [],
  });

  factory OrderBookData.fromJson(Map<String, dynamic> json) {
    return OrderBookData(
      eventType: json['e'] ?? '',
      eventTime: json['E'] ?? 0,
      symbol: json['s'] ?? '',
      firstUpdateId: json['U'] ?? 0,
      finalUpdateId: json['u'] ?? 0,
      bids: (json['b'] as List)
          .map((item) => Order.fromJson(item))
          .toList(),
      asks: (json['a'] as List)
          .map((item) => Order.fromJson(item))
          .toList(),
    );
  }
}

class Order {
  final String price;
  final String quantity;

  Order({this.price = '', this.quantity = ''});

  factory Order.fromJson(List<dynamic> json) {
    return Order(
      price: json[0] ?? '',
      quantity: json[1] ?? '',
    );
  }
}