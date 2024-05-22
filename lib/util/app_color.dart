import 'package:raven_pay_currency/imports.dart';

class AppColor {
  static const Color appColor = Colors.blueGrey;


  static Color textColor(BuildContext context) {
    return Theme.of(context).textTheme.bodyMedium!.color!;
  }

  static Color bgColor(BuildContext context) {
    return Theme.of(context).colorScheme.background;
  }

  static Color appBarColor(BuildContext context) {
    return Theme.of(context).appBarTheme.backgroundColor!;
  }

  static Color btnColor(BuildContext context) {
    return Theme.of(context).buttonTheme.colorScheme!.primary;
  }

  static Color cardColor(BuildContext context) {
    return Theme.of(context).cardColor;
  }

  static CardTheme cardTheme(BuildContext context) {
    return Theme.of(context).cardTheme;
  }

  static Color hintColor(BuildContext context) {
    return Theme.of(context).hintColor;
  }

  static Color surfaceColor(BuildContext context) {
    return Theme.of(context).colorScheme.surface;
  }

  static Color surfaceSecondaryColor(BuildContext context) {
    return Theme.of(context).colorScheme.secondary;
  }

  static Color surfaceBackgroundColor(BuildContext context) {
    return Theme.of(context).colorScheme.background;
  }

  static Color onPrimaryColor(BuildContext context) {
    return Theme.of(context).colorScheme.onPrimary;
  }

  static Color dividerColor(BuildContext context) {
    return Theme.of(context).dividerColor;
  }

  static Color canvasColor(BuildContext context) {
    return Theme.of(context).canvasColor;
  }

  static Color iconColor(BuildContext context) {
    return Theme.of(context).buttonTheme.colorScheme!.primary;
  }
}