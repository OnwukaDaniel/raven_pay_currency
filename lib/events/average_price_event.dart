import 'package:raven_pay_currency/imports.dart';

final averagePriceEventBus = EventBus();

class AveragePriceEvent {
  final double input;

  AveragePriceEvent(this.input);
}