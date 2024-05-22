import 'package:raven_pay_currency/imports.dart';

class ChartBody extends StackedHookView<LandingViewModel> {
  const ChartBody({super.key});

  @override
  Widget builder(BuildContext context, model) {
    var bl = TextUtils.bodyLarge(context);
    var bm = TextUtils.bodyMedium(context);
    var bs = TextUtils.bodySmall(context);
    var highlightColor = AppColor.hintColor(context);
    var selectedHistoryView = TradeHistoryEnum.openOrders;

    return Column(
      children: [
        Material(
          elevation: 3,
          color: AppColor.onPrimaryColor(context),
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: AppColor.surfaceSecondaryColor(context),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: InkWell(
                          onTap: () => model.setBodyTab(BodyTabEnum.chart),
                          highlightColor: Colors.transparent,
                          splashColor: Colors.transparent,
                          child: Container(
                            padding: const EdgeInsets.all(8),
                            margin: const EdgeInsets.all(2),
                            decoration: BoxDecoration(
                              color: model.bodyTabEnum == BodyTabEnum.chart
                                  ? AppColor.surfaceColor(context)
                                  : Colors.transparent,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Center(
                              child:
                                  FittedBox(child: Text('Charts', style: bl)),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 4),
                      Expanded(
                        child: InkWell(
                          onTap: () => model.setBodyTab(BodyTabEnum.orderBook),
                          highlightColor: Colors.transparent,
                          splashColor: Colors.transparent,
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 8,
                            ),
                            margin: const EdgeInsets.all(2),
                            decoration: BoxDecoration(
                              color: model.bodyTabEnum == BodyTabEnum.orderBook
                                  ? AppColor.surfaceColor(context)
                                  : Colors.transparent,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Center(
                              child: FittedBox(
                                  child: Text('Orderbook', style: bl)),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 4),
                      Expanded(
                        child: InkWell(
                          onTap: () =>
                              model.setBodyTab(BodyTabEnum.recentTrade),
                          highlightColor: Colors.transparent,
                          splashColor: Colors.transparent,
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 8,
                            ),
                            margin: const EdgeInsets.all(2),
                            decoration: BoxDecoration(
                              color:
                                  model.bodyTabEnum == BodyTabEnum.recentTrade
                                      ? AppColor.surfaceColor(context)
                                      : Colors.transparent,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Center(
                              child: FittedBox(
                                child: Text('Recent trades', style: bl),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 8),
                if (model.bodyTabEnum == BodyTabEnum.chart)
                  Column(
                    children: [
                      SizedBox(
                        height: 46,
                        child: Center(
                          child: ListView(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            children: [
                              Center(child: Text('Time', style: bs)),
                              const SizedBox(width: 4),
                              InkWell(
                                highlightColor: Colors.transparent,
                                splashColor: Colors.transparent,
                                onTap: () => model.setInterval('1h'),
                                child: Container(
                                  margin: const EdgeInsets.all(8),
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 8,
                                    horizontal: 12,
                                  ),
                                  decoration: BoxDecoration(
                                    color: model.interval.toLowerCase() == '1h'
                                        ? Colors.grey
                                        : Colors.transparent,
                                    borderRadius: BorderRadius.circular(36),
                                  ),
                                  child: Text('1H', style: bs),
                                ),
                              ),
                              InkWell(
                                highlightColor: Colors.transparent,
                                splashColor: Colors.transparent,
                                onTap: () => model.setInterval('2h'),
                                child: Container(
                                  margin: const EdgeInsets.all(8),
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 8,
                                    horizontal: 12,
                                  ),
                                  decoration: BoxDecoration(
                                    color: model.interval.toLowerCase() == '2h'
                                        ? Colors.grey
                                        : Colors.transparent,
                                    borderRadius: BorderRadius.circular(36),
                                  ),
                                  child: Text('2H', style: bs),
                                ),
                              ),
                              InkWell(
                                highlightColor: Colors.transparent,
                                splashColor: Colors.transparent,
                                onTap: () => model.setInterval('4h'),
                                child: Container(
                                  margin: const EdgeInsets.all(8),
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 8,
                                    horizontal: 12,
                                  ),
                                  decoration: BoxDecoration(
                                    color: model.interval.toLowerCase() == '4h'
                                        ? Colors.grey
                                        : Colors.transparent,
                                    borderRadius: BorderRadius.circular(36),
                                  ),
                                  child: Text('4H', style: bs),
                                ),
                              ),
                              InkWell(
                                highlightColor: Colors.transparent,
                                splashColor: Colors.transparent,
                                onTap: () => model.setInterval('1d'),
                                child: Container(
                                  margin: const EdgeInsets.all(8),
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 8,
                                    horizontal: 12,
                                  ),
                                  decoration: BoxDecoration(
                                    color: model.interval.toLowerCase() == '1d'
                                        ? Colors.grey
                                        : Colors.transparent,
                                    borderRadius: BorderRadius.circular(36),
                                  ),
                                  child: Text('1D', style: bs),
                                ),
                              ),
                              InkWell(
                                highlightColor: Colors.transparent,
                                splashColor: Colors.transparent,
                                onTap: () => model.setInterval('1w'),
                                child: Container(
                                  margin: const EdgeInsets.all(8),
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 8,
                                    horizontal: 12,
                                  ),
                                  decoration: BoxDecoration(
                                    color: model.interval.toLowerCase() == '1w'
                                        ? Colors.grey
                                        : Colors.transparent,
                                    borderRadius: BorderRadius.circular(36),
                                  ),
                                  child: Text('1W', style: bs),
                                ),
                              ),
                              InkWell(
                                highlightColor: Colors.transparent,
                                splashColor: Colors.transparent,
                                onTap: () => model.setInterval('1m'),
                                child: Container(
                                  margin: const EdgeInsets.all(8),
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 8,
                                    horizontal: 12,
                                  ),
                                  decoration: BoxDecoration(
                                    color: model.interval.toLowerCase() == '1m'
                                        ? Colors.grey
                                        : Colors.transparent,
                                    borderRadius: BorderRadius.circular(36),
                                  ),
                                  child: Text('1M', style: bs),
                                ),
                              ),
                              IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.keyboard_arrow_down_rounded,
                                  color: bs.color,
                                ),
                              ),
                              Image.asset(
                                'assets/landing/candle_icon.png',
                                width: 30,
                                height: 30,
                              ),
                              const SizedBox(width: 12),
                              Center(child: Text('Fx Indicators', style: bs)),
                              const SizedBox(width: 8),
                              Image.asset(
                                'assets/landing/undo.png',
                                width: 35,
                                height: 35,
                                color: highlightColor,
                              ),
                              const SizedBox(width: 8),
                              Image.asset(
                                'assets/landing/redo.png',
                                width: 35,
                                height: 35,
                                color: highlightColor,
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 2,
                            ),
                            margin: const EdgeInsets.all(2),
                            decoration: BoxDecoration(
                              color: Colors.grey.withOpacity(.2),
                              borderRadius: BorderRadius.circular(56),
                            ),
                            child: Center(
                              child: FittedBox(
                                child: Text('Trading view', style: bl),
                              ),
                            ),
                          ),
                          const SizedBox(width: 16),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 2,
                            ),
                            margin: const EdgeInsets.all(2),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(56),
                            ),
                            child: Center(
                              child: FittedBox(child: Text('Depth', style: bl)),
                            ),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: Image.asset('assets/landing/pinch.png'),
                          )
                        ],
                      ),
                      const WhiskerChart(),
                    ],
                  ),
                if (model.bodyTabEnum == BodyTabEnum.orderBook)
                  const OrderBook(),
                if (model.bodyTabEnum == BodyTabEnum.recentTrade)
                  SizedBox(
                    height: 300,
                    child: Center(child: Text('Recent Trades', style: bs)),
                  ),
                const SizedBox(height: 8),
              ],
            ),
          ),
        ),
        const SizedBox(height: 8),
        StatefulBuilder(builder: (context, setState) {
          return Material(
            elevation: 3,
            color: AppColor.onPrimaryColor(context),
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 46,
                    decoration: BoxDecoration(
                      color: AppColor.surfaceSecondaryColor(context),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      children: [
                        Row(
                          children: [
                            InkWell(
                              onTap: () {
                                setState(() {
                                  selectedHistoryView =
                                      TradeHistoryEnum.openOrders;
                                });
                              },
                              highlightColor: Colors.transparent,
                              splashColor: Colors.transparent,
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 8,
                                  horizontal: 36,
                                ),
                                margin: const EdgeInsets.all(2),
                                decoration: BoxDecoration(
                                  color: selectedHistoryView ==
                                      TradeHistoryEnum.openOrders
                                      ? AppColor.surfaceColor(context)
                                      : Colors.transparent,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Center(
                                  child: Text('Open Orders', style: bl),
                                ),
                              ),
                            ),
                            const SizedBox(width: 12),
                            Container(
                                height: 30, color: Colors.grey, width: .1),
                            const SizedBox(width: 12),
                            InkWell(
                              onTap: () {
                                setState(() {
                                  selectedHistoryView =
                                      TradeHistoryEnum.positions;
                                });
                              },
                              highlightColor: Colors.transparent,
                              splashColor: Colors.transparent,
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 8,
                                  horizontal: 36,
                                ),
                                margin: const EdgeInsets.all(2),
                                decoration: BoxDecoration(
                                  color: selectedHistoryView ==
                                      TradeHistoryEnum.positions
                                      ? AppColor.surfaceColor(context)
                                      : Colors.transparent,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child:
                                    Center(child: Text('Positions', style: bl)),
                              ),
                            ),
                            const SizedBox(width: 12),
                            Container(
                                height: 30, color: Colors.grey, width: .1),
                            const SizedBox(width: 12),
                            InkWell(
                              onTap: () {
                                setState(() {
                                  selectedHistoryView =
                                      TradeHistoryEnum.orderHistory;
                                });
                              },
                              highlightColor: Colors.transparent,
                              splashColor: Colors.transparent,
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 8,
                                  horizontal: 36,
                                ),
                                margin: const EdgeInsets.all(2),
                                decoration: BoxDecoration(
                                  color: selectedHistoryView ==
                                      TradeHistoryEnum.orderHistory
                                      ? AppColor.surfaceColor(context)
                                      : Colors.transparent,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Center(
                                    child: Text('Order History', style: bl)),
                              ),
                            ),
                            const SizedBox(width: 12),
                            Container(
                                height: 30, color: Colors.grey, width: .1),
                            const SizedBox(width: 12),
                            InkWell(
                              onTap: () {
                                setState(() {
                                  selectedHistoryView =
                                      TradeHistoryEnum.tradeHistory;
                                });
                              },
                              highlightColor: Colors.transparent,
                              splashColor: Colors.transparent,
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 8,
                                  horizontal: 36,
                                ),
                                margin: const EdgeInsets.all(2),
                                decoration: BoxDecoration(
                                  color: selectedHistoryView ==
                                          TradeHistoryEnum.tradeHistory
                                      ? AppColor.surfaceColor(context)
                                      : Colors.transparent,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Center(
                                  child: Text('Trade History', style: bl),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 320,
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Builder(
                            builder: (context) {
                              var centerText = '';
                              switch(selectedHistoryView){

                                case TradeHistoryEnum.openOrders:
                                  centerText = 'No Open Orders';
                                  break;
                                case TradeHistoryEnum.positions:
                                  centerText = 'No Positions';
                                  break;
                                case TradeHistoryEnum.orderHistory:
                                  centerText = 'No Order history';
                                  break;
                                case TradeHistoryEnum.tradeHistory:
                                  centerText = 'No Trade History';
                                  break;
                              }
                              return Text(
                                centerText,
                                style: bl.copyWith(fontWeight: FontWeight.bold),
                              );
                            }
                          ),
                          Padding(
                            padding: const EdgeInsets.all(32),
                            child: Text(
                              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Id pulvinar nullam sit imperdiet pulvinar.',
                              textAlign: TextAlign.center,
                              style: bm,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Material(
                    color: AppColor.surfaceColor(context),
                    child: Row(
                      children: [
                        Expanded(
                          child: InkWell(
                            onTap: () => buy(context),
                            highlightColor: Colors.transparent,
                            splashColor: Colors.transparent,
                            child: Container(
                              padding: const EdgeInsets.all(8),
                              margin: const EdgeInsets.symmetric(
                                vertical: 16,
                                horizontal: 6,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.green,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Text(
                                'BUY',
                                style: bl,
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: InkWell(
                            onTap: () => buy(context, sell: true),
                            highlightColor: Colors.transparent,
                            splashColor: Colors.transparent,
                            child: Container(
                              padding: const EdgeInsets.all(8),
                              margin: const EdgeInsets.symmetric(
                                vertical: 16,
                                horizontal: 6,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Text(
                                'Sell',
                                style: bl,
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        }),
      ],
    );
  }

  buy(BuildContext context, {bool sell = false}) {
    bool isSell = sell;
    bool isPost = false;
    var marketTypeEnum = MarketTypeEnum.limit;
    var bs = TextUtils.bodySmall(context);
    var hc = AppColor.hintColor(context);

    showModalBottomSheet(
      constraints: const BoxConstraints(maxHeight: 800),
      isScrollControlled: true,
      context: context,
      builder: (_) {
        return Wrap(
          runAlignment: WrapAlignment.end,
          alignment: WrapAlignment.end,
          children: [
            Material(
              color: AppColor.surfaceBackgroundColor(context),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
              ),
              child: StatefulBuilder(builder: (context, setState) {
                return Padding(
                  padding: const EdgeInsets.all(18),
                  child: Column(
                    children: [
                      const SizedBox(height: 16),
                      Container(
                        decoration: BoxDecoration(
                          color: AppColor.surfaceSecondaryColor(context),
                          borderRadius: BorderRadius.circular(24),
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: InkWell(
                                onTap: () => setState(() => isSell = false),
                                highlightColor: Colors.transparent,
                                splashColor: Colors.transparent,
                                child: Container(
                                  padding: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    color: !isSell
                                        ? AppColor.surfaceBackgroundColor(
                                            context)
                                        : Colors.transparent,
                                    borderRadius: BorderRadius.circular(16),
                                    border: Border.all(
                                      color: isSell
                                          ? Colors.transparent
                                          : Colors.green,
                                    ),
                                  ),
                                  child: Text(
                                    'Buy',
                                    textAlign: TextAlign.center,
                                    style: bs,
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: InkWell(
                                onTap: () => setState(() => isSell = true),
                                highlightColor: Colors.transparent,
                                splashColor: Colors.transparent,
                                child: Container(
                                  padding: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    color: isSell
                                        ? AppColor.surfaceBackgroundColor(
                                            context)
                                        : Colors.transparent,
                                    borderRadius: BorderRadius.circular(16),
                                    border: Border.all(
                                      color: !isSell
                                          ? Colors.transparent
                                          : Colors.green,
                                    ),
                                  ),
                                  child: Text(
                                    'Sell',
                                    textAlign: TextAlign.center,
                                    style: bs,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: () {
                              setState(() {
                                marketTypeEnum = MarketTypeEnum.limit;
                              });
                            },
                            highlightColor: Colors.transparent,
                            splashColor: Colors.transparent,
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                vertical: 6,
                                horizontal: 12,
                              ),
                              margin: const EdgeInsets.only(left: 8),
                              decoration: BoxDecoration(
                                color: marketTypeEnum == MarketTypeEnum.limit
                                    ? AppColor.hintColor(context)
                                    : Colors.transparent,
                                borderRadius: BorderRadius.circular(24),
                              ),
                              child: Text('Limit', style: bs),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              setState(() {
                                marketTypeEnum = MarketTypeEnum.market;
                              });
                            },
                            highlightColor: Colors.transparent,
                            splashColor: Colors.transparent,
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                vertical: 6,
                                horizontal: 12,
                              ),
                              decoration: BoxDecoration(
                                color: marketTypeEnum == MarketTypeEnum.market
                                    ? AppColor.hintColor(context)
                                    : Colors.transparent,
                                borderRadius: BorderRadius.circular(24),
                              ),
                              child: Text('Market', style: bs),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              setState(() {
                                marketTypeEnum = MarketTypeEnum.stopLimit;
                              });
                            },
                            highlightColor: Colors.transparent,
                            splashColor: Colors.transparent,
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                vertical: 6,
                                horizontal: 12,
                              ),
                              margin: const EdgeInsets.only(right: 8),
                              decoration: BoxDecoration(
                                color:
                                    marketTypeEnum == MarketTypeEnum.stopLimit
                                        ? AppColor.hintColor(context)
                                        : Colors.transparent,
                                borderRadius: BorderRadius.circular(24),
                              ),
                              child: Text('Stop-Limit', style: bs),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: hc),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Row(
                          children: [
                            const SizedBox(width: 16),
                            Text('Limit price', style: bs.copyWith(color: hc)),
                            const SizedBox(width: 4),
                            Icon(Icons.info_outline, color: hc, size: 16),
                            const SizedBox(width: 8),
                            Expanded(
                              child: TextFormField(
                                decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  focusedBorder: InputBorder.none,
                                ),
                              ),
                            ),
                            const Spacer(),
                            Text('USD', style: bs.copyWith(color: hc)),
                            const SizedBox(width: 16),
                          ],
                        ),
                      ),
                      const SizedBox(height: 16),
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: hc),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Row(
                          children: [
                            const SizedBox(width: 16),
                            Text('Amount', style: bs.copyWith(color: hc)),
                            const SizedBox(width: 4),
                            Icon(Icons.info_outline, color: hc, size: 16),
                            const SizedBox(width: 8),
                            Expanded(
                              child: TextFormField(
                                decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  focusedBorder: InputBorder.none,
                                ),
                              ),
                            ),
                            const Spacer(),
                            Text('USD', style: bs.copyWith(color: hc)),
                            const SizedBox(width: 16),
                          ],
                        ),
                      ),
                      const SizedBox(height: 16),
                      Container(
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        decoration: BoxDecoration(
                          border: Border.all(color: hc),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Row(
                          children: [
                            const SizedBox(width: 16),
                            Text('Type', style: bs.copyWith(color: hc)),
                            const SizedBox(width: 4),
                            Icon(Icons.info_outline, color: hc, size: 16),
                            const SizedBox(width: 8),
                            const Spacer(),
                            Text(
                              'Good till canceled',
                              style: bs.copyWith(color: hc),
                            ),
                            const SizedBox(width: 8),
                            Icon(Icons.keyboard_arrow_down, color: hc),
                            const SizedBox(width: 16),
                          ],
                        ),
                      ),
                      const SizedBox(height: 16),
                      Row(
                        children: [
                          InkWell(
                            onTap: () {
                              setState(() {
                                isPost = !isPost;
                              });
                            },
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                Image.asset(
                                  'assets/landing/check_box.png',
                                  width: 20,
                                  height: 20,
                                  color: hc,
                                ),
                                if (isPost)
                                  Icon(
                                    Icons.check,
                                    color: hc,
                                    size: 18,
                                  )
                              ],
                            ),
                          ),
                          const SizedBox(width: 16),
                          Text('Post Only', style: bs.copyWith(color: hc)),
                          const SizedBox(width: 4),
                          Icon(Icons.info_outline, color: hc, size: 16),
                        ],
                      ),
                      const SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Total', style: bs.copyWith(color: hc)),
                          Text('0:0', style: bs.copyWith(color: hc)),
                        ],
                      ),
                      const SizedBox(height: 16),
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          Image.asset(
                            'assets/landing/market_btn_back.png',
                            fit: BoxFit.fill,
                            height: 46,
                          ),
                          Center(
                            child: Text(
                              '${isSell ? 'Sell' : 'Buy'} BTC',
                              textAlign: TextAlign.center,
                              style: bs.copyWith(
                                color: hc,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Divider(color: Colors.grey.withOpacity(.2)),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          Text(
                            'Total account value',
                            style: bs.copyWith(color: hc),
                          ),
                          const Spacer(),
                          Text('NGN ', style: bs.copyWith(color: hc)),
                          Icon(Icons.keyboard_arrow_down, color: hc)
                        ],
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          '0.0',
                          style: bs.copyWith(fontWeight: FontWeight.bold),
                        ),
                      ),
                      const SizedBox(height: 16),
                      Row(
                        children: [
                          Text(
                            'Open Order',
                            style: bs.copyWith(color: hc),
                          ),
                          const Spacer(),
                          Text('Available', style: bs.copyWith(color: hc)),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          Text(
                            '0.00',
                            style: bs.copyWith(fontWeight: FontWeight.bold),
                          ),
                          const Spacer(),
                          Text(
                            '0.00',
                            style: bs.copyWith(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Container(
                          width: 100,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 12,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Center(
                            child: Text(
                              'Deposit',
                              textAlign: TextAlign.center,
                              style: bs.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                );
              }),
            ),
          ],
        );
      },
    );
  }
}
