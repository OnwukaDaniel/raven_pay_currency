import 'package:raven_pay_currency/imports.dart';

class Landing extends StatelessWidget {
  const Landing({super.key});

  @override
  Widget build(BuildContext context) {
    var bs = TextUtils.bodySmall(context);
    var tl = TextUtils.titleLarge(context);

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            Image.asset('assets/landing/logo.png', width: 45, height: 45),
            const SizedBox(width: 6),
            Text('Sisyphus', style: tl.copyWith(fontWeight: FontWeight.bold)),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Image.asset(
              'assets/landing/profile_placeholder.png',
              width: 35,
              height: 35,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Image.asset(
              'assets/landing/globe_icon.png',
              width: 35,
              height: 35,
              color: AppColor.hintColor(context),
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Image.asset(
              'assets/landing/more_icon.png',
              width: 35,
              height: 35,
              color: AppColor.hintColor(context),
            ),
          ),
          const SizedBox(width: 6),
        ],
      ),
    );
  }
}
