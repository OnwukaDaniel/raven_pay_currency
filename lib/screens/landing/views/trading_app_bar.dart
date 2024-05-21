import 'dart:convert';

import 'package:raven_pay_currency/imports.dart';
import 'package:raven_pay_currency/models/price_stream_response.dart';

class TradingAppBar extends StackedHookView<LandingViewModel> {
  const TradingAppBar({super.key});

  @override
  Widget builder(BuildContext context, model) {
    var bl = TextUtils.bodyLarge(context);
    var bm = TextUtils.bodyMedium(context);
    var bs = TextUtils.bodySmall(context);
    var highlightColor = AppColor.hintColor(context);
    var lastAmount = ''; // to avoid 0.0 sent occasionally from binance

    return Material(
      elevation: 2,
      color: AppColor.cardColor(context),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Image.asset(
                  'assets/landing/currency_pair.png',
                  width: 40,
                  height: 40,
                ),
                const SizedBox(width: 6),
                Text('BTC/USDT',
                    style: bl.copyWith(fontWeight: FontWeight.bold)),
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.keyboard_arrow_down_sharp, color: bl.color),
                ),
                const SizedBox(width: 6),
                StreamBuilder(
                  stream: model.streamController.stream,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      var data = PriceStreamResponse.fromJson(
                          jsonDecode(snapshot.data));
                      var amount = (double.tryParse(data.p) ?? 0).round();
                      String formattedAmount =
                          NumberFormat.currency(locale: 'en_US', symbol: '\$')
                              .format(amount);
                      if(amount != 0) lastAmount = formattedAmount;
                      return Text(
                        lastAmount,
                        style: bl.copyWith(
                          fontWeight: FontWeight.bold,
                          color: data.m? Colors.green: Colors.red,
                        ),
                      );
                    } else if (snapshot.hasError) {
                      return Text('Error: ${snapshot.error}');
                    }
                    return const Text('Connecting...');
                  },
                ),
              ],
            ),
            const SizedBox(height: 12),
            SizedBox(
              height: 50,
              child: ListView(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                children: [
                  Row(
                    children: [
                      Column(
                        children: [
                          Row(
                            children: [
                              Icon(Icons.access_time,
                                  color: highlightColor, size: 20),
                              const SizedBox(width: 6),
                              Text(
                                '24h change',
                                style: bs.copyWith(color: highlightColor),
                              ),
                            ],
                          ),
                          const SizedBox(height: 6),
                          Text(
                            '520.80 + 1.25%',
                            style: bm.copyWith(color: Colors.green),
                          ),
                        ],
                      ),
                      const SizedBox(width: 12),
                      Container(height: 40, color: Colors.grey, width: .1),
                      const SizedBox(width: 12),
                      Column(
                        children: [
                          Row(
                            children: [
                              Icon(Icons.arrow_upward,
                                  color: highlightColor, size: 20),
                              const SizedBox(width: 6),
                              Text(
                                '24h High',
                                style: bs.copyWith(color: highlightColor),
                              ),
                            ],
                          ),
                          const SizedBox(height: 6),
                          Text('520.80 + 1.25%', style: bm),
                        ],
                      ),
                      const SizedBox(width: 12),
                      Container(height: 40, color: Colors.grey, width: .1),
                      const SizedBox(width: 12),
                      Column(
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.arrow_downward,
                                color: highlightColor,
                                size: 20,
                              ),
                              const SizedBox(width: 6),
                              Text(
                                '24h Low',
                                style: bs.copyWith(color: highlightColor),
                              ),
                            ],
                          ),
                          const SizedBox(height: 6),
                          Text('520.80 + 1.25%', style: bm),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
