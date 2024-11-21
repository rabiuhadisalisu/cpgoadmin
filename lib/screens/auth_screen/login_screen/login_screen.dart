import '../../../config.dart';

class LoginScreen extends StatelessWidget {
  final loginCtrl = Get.put(LoginController());

  LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(builder: (_) {
      return Scaffold(
          backgroundColor: appCtrl.appTheme.whiteColor,
          body: SingleChildScrollView(
              child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Row(children: [
                    // LoginLayout(),
                    if (Responsive.isDesktop(context))
                      const LoginLeftDesktopView().paddingOnly(right: 20),
                    Expanded(
                        child: GlassMorphicLayout(
                            linearGradient: loginLinearGradient(),
                            child: const SingleChildScrollView(
                                child: Column(children: [
                              DarkLanguageLayout(),
                              VSpace(Sizes.s80),
                              LoginLayout(),
                              VSpace(Sizes.s30)
                            ]))))
                  ]))));
    });
  }
}
