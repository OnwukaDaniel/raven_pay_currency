import 'package:raven_pay_currency/imports.dart';

class AveragePriceText extends StackedHookView<OrderBookViewModel> {
  const AveragePriceText({super.key});

  @override
  Widget builder(BuildContext context, model) {
    var tm = TextUtils.titleMedium(context);

    return Text(
      model.averagePrice.toStringAsFixed(2),
      style: tm,
      textAlign: TextAlign.center,
    );
  }
}
