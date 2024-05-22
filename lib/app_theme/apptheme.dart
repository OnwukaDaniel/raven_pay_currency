import 'package:raven_pay_currency/imports.dart';

class AppTheme {
  static const double titleLarge = 24;
  static const double titleMedium = 20;
  static const double bodyLarge = 18;
  static const double bodyMedium = 16;
  static const double bodySmall = 14;
  static const double labelLarge = 12;
  static const double labelMedium = 10;

  static final ThemeData lightTheme = ThemeData(
    primaryColor: AppColor.appColor,
    canvasColor: Colors.white,
    useMaterial3: true,
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColor.appColor,
      iconTheme: IconThemeData(color: Colors.white),
    ),
    dividerColor: const Color(0xfff0f0f0),
    cardColor: const Color(0xfff1f1f1),
    fontFamily: 'Satoshi',
    buttonTheme: ButtonThemeData(
      buttonColor: AppColor.appColor,
      disabledColor: Colors.grey.withOpacity(0.1),
      colorScheme: const ColorScheme(
        brightness: Brightness.light,
        primary: AppColor.appColor,
        onPrimary: Colors.white,
        secondary: AppColor.appColor,
        onSecondary: Colors.white,
        error: AppColor.appColor,
        onError: Colors.white,
        background: AppColor.appColor,
        onBackground: Colors.white,
        surface: AppColor.appColor,
        onSurface: Colors.white,
      ),
    ),
    cardTheme: const CardTheme(color: Color(0xfff5f5f5)),
    textTheme: const TextTheme(
      titleLarge: TextStyle(
        color: Colors.black,
        fontSize: titleLarge,
      ),
      titleMedium: TextStyle(
        color: Colors.black,
        fontSize: titleMedium,
      ),
      bodyLarge: TextStyle(
        color: Colors.black,
        fontSize: bodyLarge,
      ),
      bodyMedium: TextStyle(
        color: Colors.black,
        fontSize: bodyMedium,
      ),
      bodySmall: TextStyle(
        color: Colors.black,
        fontSize: bodySmall,
      ),
      labelLarge: TextStyle(
        color: Colors.black,
        fontSize: labelLarge,
      ),
      labelMedium: TextStyle(
        color: Colors.black,
        fontSize: labelMedium,
      ),
    ),
    colorScheme: const ColorScheme.light(
      outline: Colors.transparent,
      surface: Colors.white,
      primary: AppColor.appColor,
      secondary: Color(0xfff1f1f1),
      onSurface: Colors.black,
      onPrimary: Colors.white,
      background: Colors.white,
    ),
  );

  static final ThemeData darkTheme = ThemeData(
    primaryColor: Colors.black,
    canvasColor: const Color(0xff444343),
    useMaterial3: true,
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.grey,
      iconTheme: IconThemeData(color: Colors.white),
    ),
    fontFamily: 'Satoshi',
    buttonTheme: ButtonThemeData(
      buttonColor: Colors.grey.withOpacity(0.8),
      disabledColor: Colors.grey.withOpacity(0.1),
      colorScheme: ColorScheme(
        brightness: Brightness.dark,
        primary: Colors.white,
        onPrimary: Colors.white,
        secondary: Colors.grey.withOpacity(0.1),
        onSecondary: Colors.white,
        error: Colors.grey.withOpacity(0.1),
        onError: Colors.white,
        background: Colors.grey.withOpacity(0.1),
        onBackground: Colors.white,
        surface: Colors.grey.withOpacity(0.1),
        onSurface: Colors.white,
      ),
    ),
    dividerColor: Colors.white,
    cardColor: const Color(0xff17181b),
    cardTheme: const CardTheme(color: Color(0xFF0E0E0E)),
    textTheme: const TextTheme(
      titleLarge: TextStyle(
        color: Colors.white,
        fontSize: titleLarge,
      ),
      titleMedium: TextStyle(
        color: Colors.white,
        fontSize: titleMedium,
      ),
      bodyLarge: TextStyle(
        color: Colors.white,
        fontSize: bodyLarge,
      ),
      bodyMedium: TextStyle(
        color: Colors.white,
        fontSize: bodyMedium,
      ),
      bodySmall: TextStyle(
        color: Colors.white,
        fontSize: bodySmall,
      ),
      labelLarge: TextStyle(
        color: Colors.white,
        fontSize: labelLarge,
      ),
      labelMedium: TextStyle(
        color: Colors.white,
        fontSize: labelMedium,
      ),
    ),
    colorScheme: const ColorScheme.dark(
      outline: Colors.transparent,
      surface: Color(0xde9f0ff),
      secondary: Color(0xff1c2127),
      primary: AppColor.appColor,
      onSurface: Colors.white,
      onPrimary: Color(0xff17181b),
      background: Color(0xff20252b),
    ),
  );
}
