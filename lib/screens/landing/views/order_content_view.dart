import 'package:raven_pay_currency/imports.dart';

class OrderContentView extends StackedHookView<OrderBookViewModel> {
  const OrderContentView({super.key});

  @override
  Widget builder(BuildContext context, model) {
    var bs = TextUtils.bodySmall(context);

    return PopupMenuButton<String>(
      color: AppColor.cardColor(context),
      onSelected: (String value) => model.setOrderContent(
        int.tryParse(value) ?? 10,
      ),
      itemBuilder: (context) => [
        const PopupMenuItem<String>(
          value: '5',
          child: Padding(
            padding: EdgeInsets.only(right: 64),
            child: Text('5'),
          ),
        ),
        const PopupMenuItem<String>(
          value: '10',
          child: Padding(
            padding: EdgeInsets.only(right: 64),
            child: Text('10'),
          ),
        ),
        const PopupMenuItem<String>(
          value: '20',
          child: Padding(
            padding: EdgeInsets.only(right: 64),
            child: Text('20'),
          ),
        ),
      ],
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: AppColor.surfaceColor(context),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          children: [
            const SizedBox(width: 8),
            Text(model.orderContent.toString(), style: bs),
            const SizedBox(width: 12),
            Icon(Icons.keyboard_arrow_down, color: bs.color),
            const SizedBox(width: 8),
          ],
        ),
      ), // Optional: Customize the button icon
    );
  }
}
