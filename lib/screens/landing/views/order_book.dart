import 'dart:convert';
import 'package:raven_pay_currency/imports.dart';

class OrderBook extends StatelessWidget {
  const OrderBook({super.key});

  @override
  Widget build(BuildContext context) {
    var bs = TextUtils.bodySmall(context);
    var orderBookFormatEnum = OrderBookFormatEnum.book1;

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        StatefulBuilder(builder: (context, setState) {
          return Row(
            children: [
              InkWell(
                onTap: () {
                  setState(() {
                    orderBookFormatEnum = OrderBookFormatEnum.book1;
                  });
                },
                child: Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: orderBookFormatEnum == OrderBookFormatEnum.book1
                        ? AppColor.surfaceColor(context)
                        : Colors.transparent,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Image.asset(
                    'assets/landing/more1.png',
                    width: 15,
                    height: 15,
                  ),
                ),
              ),
              const SizedBox(width: 8),
              InkWell(
                onTap: () {
                  setState(() {
                    orderBookFormatEnum = OrderBookFormatEnum.book2;
                  });
                },
                child: Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: orderBookFormatEnum == OrderBookFormatEnum.book2
                        ? AppColor.surfaceColor(context)
                        : Colors.transparent,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Image.asset(
                    'assets/landing/more2.png',
                    width: 15,
                    height: 15,
                  ),
                ),
              ),
              const SizedBox(width: 8),
              InkWell(
                onTap: () {
                  setState(() {
                    orderBookFormatEnum = OrderBookFormatEnum.book3;
                  });
                },
                child: Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: orderBookFormatEnum == OrderBookFormatEnum.book3
                        ? AppColor.surfaceColor(context)
                        : Colors.transparent,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Image.asset(
                    'assets/landing/more3.png',
                    width: 15,
                    height: 15,
                  ),
                ),
              ),
              const Spacer(),
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: AppColor.surfaceColor(context),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  children: [
                    const SizedBox(width: 8),
                    Text('10', style: bs),
                    const SizedBox(width: 12),
                    Icon(Icons.keyboard_arrow_down, color: bs.color),
                    const SizedBox(width: 8),
                  ],
                ),
              )
            ],
          );
        }),
        Padding(
          padding: const EdgeInsets.all(12),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Price\n(USDT)',
                style: bs.copyWith(color: AppColor.hintColor(context)),
              ),
              Text(
                'Amount\n(BTC)',
                style: bs.copyWith(color: AppColor.hintColor(context)),
              ),
              Text(
                'Total',
                style: bs.copyWith(color: AppColor.hintColor(context)),
              ),
            ],
          ),
        ),
        ViewModelBuilder.nonReactive(
          viewModelBuilder: () => OrderBookViewModel(),
          builder: (_, model, __) {
            model.init();

            return StreamBuilder(
              stream: model.orderBookController.stream,
              builder: (_, stream) {
                OrderBookData data = OrderBookData();
                if (stream.data != null) {
                  data = OrderBookData.fromJson(jsonDecode(stream.data));
                }
                return ListView(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    SizedBox(
                      height: 300,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: data.asks.length,
                              itemBuilder: (_, index) {
                                var datum = data.asks[index];
                                return Padding(
                                  padding: const EdgeInsets.all(2),
                                  child: Text(
                                    (double.tryParse(datum.price)??0).toString(),
                                    textAlign: TextAlign.center,
                                    style: bs.copyWith(color: Colors.red),
                                  ),
                                );
                              },
                            ),
                          ),
                          Expanded(
                            child: ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: data.asks.length,
                              itemBuilder: (_, index) {
                                var datum = data.asks[index];
                                return Padding(
                                  padding: const EdgeInsets.all(2),
                                  child: Text(
                                    (double.tryParse(datum.quantity)??0).toString(),
                                    textAlign: TextAlign.center,
                                    style: bs,
                                  ),
                                );
                              },
                            ),
                          ),
                          Expanded(
                            child: ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: data.asks.length,
                              itemBuilder: (_, index) {
                                var datum = data.asks[index];
                                var amt = ((double.tryParse(datum.price) ?? 0) *
                                    (double.tryParse(datum.quantity) ?? 0))
                                    .toStringAsFixed(2);
                                return Padding(
                                  padding: const EdgeInsets.all(2),
                                  child: Text(
                                    amt,
                                    textAlign: TextAlign.center,
                                    style: bs,
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 12),
                    const AveragePriceText(),
                    const SizedBox(height: 12),
                    SizedBox(
                      height: 300,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: data.bids.length,
                              itemBuilder: (_, index) {
                                var datum = data.bids[index];
                                return Padding(
                                  padding: const EdgeInsets.all(2),
                                  child: Text(
                                    (double.tryParse(datum.price)??0).toString(),
                                    textAlign: TextAlign.center,
                                    style: bs.copyWith(color: Colors.green),
                                  ),
                                );
                              },
                            ),
                          ),
                          Expanded(
                            child: ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: data.asks.length,
                              itemBuilder: (_, index) {
                                var datum = data.asks[index];
                                return Padding(
                                  padding: const EdgeInsets.all(2),
                                  child: Text(
                                    (double.tryParse(datum.quantity)??0).toString(),
                                    textAlign: TextAlign.center,
                                    style: bs,
                                  ),
                                );
                              },
                            ),
                          ),
                          Expanded(
                            child: ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: data.asks.length,
                              itemBuilder: (_, index) {
                                var datum = data.asks[index];
                                var amt = ((double.tryParse(datum.price) ?? 0) *
                                    (double.tryParse(datum.quantity) ?? 0))
                                    .toStringAsFixed(2);
                                return Padding(
                                  padding: const EdgeInsets.all(2),
                                  child: Text(
                                    amt,
                                    textAlign: TextAlign.center,
                                    style: bs,
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              },
            );
          },
        ),
      ],
    );
  }
}
