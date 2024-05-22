import 'package:raven_pay_currency/imports.dart';

class AskList extends StackedHookView<OrderBookViewModel> {
  final List<Order> asks;

  const AskList(this.asks, {super.key});

  @override
  Widget builder(BuildContext context, model) {
    var bs = TextUtils.bodySmall(context);
    var askList = asks.sublist(0,
        asks.length >= model.orderContent ? model.orderContent : asks.length);

    return SizedBox(
      height: 20 * double.parse(model.orderContent.toString()),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: askList.length,
              itemBuilder: (_, index) {
                var datum = askList[index];
                return Padding(
                  padding: const EdgeInsets.all(2),
                  child: Text(
                    (double.tryParse(datum.price) ?? 0).toString(),
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
              itemCount: askList.length,
              itemBuilder: (_, index) {
                var datum = askList[index];
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
              itemCount: askList.length,
              itemBuilder: (_, index) {
                var datum = askList[index];
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
