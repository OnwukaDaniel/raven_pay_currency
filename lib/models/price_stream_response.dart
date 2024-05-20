class PriceStreamResponse {
  String s;
  String p;
  bool m;

  PriceStreamResponse({
    this.s = '',
    this.p = '',
    this.m = false,
  });

  factory PriceStreamResponse.fromJson(Map<String, dynamic> map) {
    return PriceStreamResponse(
      s: map['s'] ?? '',
      p: map['p'] ?? '',
      m: map['m'] ?? false,
    );
  }
}
