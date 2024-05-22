import 'package:raven_pay_currency/imports.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: themeData,
      builder: (context, theme, _) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'RavenPay Currency',
          theme: theme,
          darkTheme: AppTheme.darkTheme,
          home: const Landing(),
        );
      }
    );
  }
}