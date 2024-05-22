import 'package:raven_pay_currency/imports.dart';

class BidList extends StackedHookView<OrderBookViewModel> {
  final List<Order> bids;

  const BidList(this.bids, {super.key});

  @override
  Widget builder(BuildContext context, model) {
    var bs = TextUtils.bodySmall(context);
    var bidList = bids.sublist(0,
        bids.length >= model.orderContent ? model.orderContent : bids.length);

    return SizedBox(
      height: 20 * double.parse(model.orderContent.toString()),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: bidList.length,
              itemBuilder: (_, index) {
                var datum = bidList[index];
                return Padding(
                  padding: const EdgeInsets.all(2),
                  child: Text(
                    (double.tryParse(datum.price) ?? 0).toString(),
                    textAlign: TextAlign.center,
                    style: bs.copyWith(color: Colors.grey),
                  ),
                );
              },
            ),
          ),
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: bidList.length,
              itemBuilder: (_, index) {
                var datum = bidList[index];
                return Padding(
                  padding: const EdgeInsets.all(2),
                  child: Text(
                    (double.tryParse(datum.quantity) ?? 0).toString(),
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
              itemCount: bidList.length,
              itemBuilder: (_, index) {
                var datum = bidList[index];
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
    );
  }
}
