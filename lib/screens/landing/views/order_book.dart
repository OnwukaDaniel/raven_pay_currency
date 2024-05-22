import 'package:raven_pay_currency/imports.dart';

class OrderBook extends StatelessWidget {
  const OrderBook({super.key});

  @override
  Widget build(BuildContext context) {
    var bs = TextUtils.bodySmall(context);
    var orderBookFormatEnum = OrderBookFormatEnum.book1;

    return ViewModelBuilder.nonReactive(
      viewModelBuilder: () => OrderBookViewModel(),
      builder: (_, model, __) {
        model.init();

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
                  const OrderContentView(),
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
            StreamBuilder(
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
                    if (stream.connectionState == ConnectionState.waiting)
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 150),
                        child: Center(
                          child: SpinKitDoubleBounce(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    if (stream.connectionState != ConnectionState.waiting)
                      AskList(data.asks),
                    const SizedBox(height: 12),
                    const AveragePriceText(),
                    const SizedBox(height: 12),
                    if (stream.connectionState == ConnectionState.waiting)
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 150),
                        child: Center(
                          child: SpinKitDoubleBounce(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    if (stream.connectionState != ConnectionState.waiting)
                      BidList(data.bids),
                  ],
                );
              },
            ),
          ],
        );
      },
    );
  }
}
