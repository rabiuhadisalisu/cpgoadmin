import '../../../../config.dart';

class LoginLeftDesktopView extends StatelessWidget {
  const LoginLeftDesktopView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        color: appCtrl.appTheme.secondary.withOpacity(0.1),
        height: MediaQuery.of(context).size.height,
        child: Image.asset(
          imageAssets.loginBanner,
          fit: BoxFit.fill,
        ));
  }
}
