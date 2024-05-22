import 'package:raven_pay_currency/imports.dart';

class Landing extends StatelessWidget {
  const Landing({super.key});

  @override
  Widget build(BuildContext context) {
    var tl = TextUtils.titleLarge(context);

    return ViewModelBuilder.nonReactive(
      viewModelBuilder: ()=> LandingViewModel(),
      builder: (context, model, _) {
        model.init();

        return Scaffold(
          backgroundColor: AppColor.bgColor(context),
          appBar: AppBar(
            backgroundColor: AppColor.onPrimaryColor(context),
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
              PopupMenuButton<String>(
                color: AppColor.cardColor(context),
                onSelected: (String value) {
                  if(value == 'Log out') Navigator.pop(context);
                },
                itemBuilder: (context) => [
                  const PopupMenuItem<String>(
                    value: 'Exchange',
                    child: Padding(
                      padding: EdgeInsets.only(right: 64),
                      child: Text('Exchange'),
                    ),
                  ),
                  const PopupMenuItem<String>(
                    value: 'Wallets',
                    child: Padding(
                      padding: EdgeInsets.only(right: 64),
                      child: Text('Wallets'),
                    ),
                  ),
                  const PopupMenuItem<String>(
                    value: 'Roqqu Hub',
                    child: Padding(
                      padding: EdgeInsets.only(right: 64),
                      child: Text('Roqqu Hub'),
                    ),
                  ),
                  const PopupMenuItem<String>(
                    value: 'Log out',
                    child: Padding(
                      padding: EdgeInsets.only(right: 64),
                      child: Text('Log out'),
                    ),
                  ),
                ],
                child: Image.asset(
                  'assets/landing/more_icon.png',
                  width: 35,
                  height: 35,
                  color: AppColor.hintColor(context),
                ), // Optional: Customize the button icon
              ),
              const SizedBox(width: 6),
            ],
          ),
          body: ListView(
            children: const [
              SizedBox(height: 6),
              TradingAppBar(),
              SizedBox(height: 6),
              ChartBody(),
            ],
          ),
        );
      }
    );
  }
}
