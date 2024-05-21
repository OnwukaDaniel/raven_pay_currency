import 'package:raven_pay_currency/imports.dart';
import 'package:raven_pay_currency/widget/whisker_chart.dart';

class ChartBody extends StackedHookView<LandingViewModel> {
  const ChartBody({super.key});

  @override
  Widget builder(BuildContext context, model) {
    var bl = TextUtils.bodyLarge(context);
    var bm = TextUtils.bodyMedium(context);
    var bs = TextUtils.bodySmall(context);
    var highlightColor = AppColor.hintColor(context);

    return Column(
      children: [
        Material(
          elevation: 3,
          color: AppColor.cardColor(context),
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
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
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          margin: const EdgeInsets.all(2),
                          decoration: BoxDecoration(
                            color: AppColor.surfaceColor(context),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Center(
                            child: FittedBox(child: Text('Charts', style: bl)),
                          ),
                        ),
                      ),
                      const SizedBox(width: 4),
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 8,
                          ),
                          margin: const EdgeInsets.all(2),
                          decoration: BoxDecoration(
                            color: AppColor.surfaceColor(context),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Center(
                            child:
                                FittedBox(child: Text('Orderbook', style: bl)),
                          ),
                        ),
                      ),
                      const SizedBox(width: 4),
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 8,
                          ),
                          margin: const EdgeInsets.all(2),
                          decoration: BoxDecoration(
                            color: AppColor.surfaceColor(context),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Center(
                            child: FittedBox(
                              child: Text('Recent trades', style: bl),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 8),
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
                              color: model.interval.toLowerCase() == '1h'? Colors.grey : Colors.transparent,
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
                              color: model.interval.toLowerCase() == '2h'? Colors.grey : Colors.transparent,
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
                              color: model.interval.toLowerCase() == '4h'? Colors.grey : Colors.transparent,
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
                              color: model.interval.toLowerCase() == '1d'? Colors.grey : Colors.transparent,
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
                              color: model.interval.toLowerCase() == '1w'? Colors.grey : Colors.transparent,
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
                              color: model.interval.toLowerCase() == '1m'? Colors.grey : Colors.transparent,
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
                        color: Colors.grey.withOpacity(.2),
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
                const SizedBox(height: 8),
              ],
            ),
          ),
        ),
        const SizedBox(height: 8),
        Material(
          elevation: 3,
          color: AppColor.cardColor(context),
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
                          Container(
                            padding: const EdgeInsets.symmetric(
                              vertical: 8,
                              horizontal: 36,
                            ),
                            margin: const EdgeInsets.all(2),
                            decoration: BoxDecoration(
                              color: AppColor.surfaceColor(context),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Center(
                              child: Text('Open Orders', style: bl),
                            ),
                          ),
                          const SizedBox(width: 12),
                          Container(height: 30, color: Colors.grey, width: .1),
                          const SizedBox(width: 12),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              vertical: 8,
                              horizontal: 36,
                            ),
                            margin: const EdgeInsets.all(2),
                            decoration: BoxDecoration(
                              color: AppColor.surfaceColor(context),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Center(child: Text('Positions', style: bl)),
                          ),
                          const SizedBox(width: 12),
                          Container(height: 30, color: Colors.grey, width: .1),
                          const SizedBox(width: 12),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              vertical: 8,
                              horizontal: 36,
                            ),
                            margin: const EdgeInsets.all(2),
                            decoration: BoxDecoration(
                              color: AppColor.surfaceColor(context),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child:
                                Center(child: Text('Order History', style: bl)),
                          ),
                          const SizedBox(width: 12),
                          Container(height: 30, color: Colors.grey, width: .1),
                          const SizedBox(width: 12),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              vertical: 8,
                              horizontal: 36,
                            ),
                            margin: const EdgeInsets.all(2),
                            decoration: BoxDecoration(
                              color: AppColor.surfaceColor(context),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Center(
                              child: Text('Trade History', style: bl),
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
                        Text(
                          'No Open Orders',
                          style: bl.copyWith(fontWeight: FontWeight.bold),
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
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
