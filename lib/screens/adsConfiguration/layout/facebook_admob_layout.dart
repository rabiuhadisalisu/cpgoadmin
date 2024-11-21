import '../../../config.dart';

class FacebookAdsLayout extends StatelessWidget {
  const FacebookAdsLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AdsController>(builder: (adsCtrl) {
      return Responsive.isDesktop(context)
          ? Row(children: [
              Expanded(
                  child: Column(children: [
                SizedBox(
                    width: double.infinity,
                    child: DesktopTextFieldCommon(
                        validator: (number) =>
                            Validation().statusValidation(number),
                        title:
                            "${fonts.facebookAdBanner.tr} (${fonts.forAndroid.tr})",
                        onChanged: (val) => {},
                        controller: adsCtrl.txtFacebookBannerAndroid)),
                const VSpace(Sizes.s30),
                SizedBox(
                    width: double.infinity,
                    child: DesktopTextFieldCommon(
                        validator: (number) =>
                            Validation().statusValidation(number),
                        title:
                            "${fonts.facebookAdBanner.tr} (${fonts.foriOS.tr})",
                        onChanged: (val) => {},
                        controller: adsCtrl.txtFacebookBannerIos))
              ])),
              const HSpace(Sizes.s50),
              Expanded(
                  child: Column(children: [
                SizedBox(
                    width: double.infinity,
                    child: DesktopTextFieldCommon(
                        validator: (number) =>
                            Validation().statusValidation(number),
                        title:
                            "${fonts.facebookAdInterstitial.tr} (${fonts.forAndroid.tr})",
                        onChanged: (val) => {},
                        controller: adsCtrl.txtFacebookInterstitialAndroid)),
                const VSpace(Sizes.s30),
                SizedBox(
                    width: double.infinity,
                    child: DesktopTextFieldCommon(
                        validator: (number) =>
                            Validation().statusValidation(number),
                        title:
                            "${fonts.facebookAdInterstitial.tr} (${fonts.foriOS.tr})",
                        onChanged: (val) => {},
                        controller: adsCtrl.txtFacebookInterstitialIos))
              ]))
            ])
          : Column(children: [
              Column(children: [
                SizedBox(
                    width: double.infinity,
                    child: DesktopTextFieldCommon(
                        validator: (number) =>
                            Validation().statusValidation(number),
                        title:
                            "${fonts.facebookAdBanner.tr} (${fonts.forAndroid.tr})",
                        onChanged: (val) => {},
                        controller: adsCtrl.txtFacebookBannerAndroid)),
                const VSpace(Sizes.s30),
                SizedBox(
                    width: double.infinity,
                    child: DesktopTextFieldCommon(
                        validator: (number) =>
                            Validation().statusValidation(number),
                        title:
                            "${fonts.facebookAdBanner.tr} (${fonts.foriOS.tr})",
                        onChanged: (val) => {},
                        controller: adsCtrl.txtFacebookBannerIos))
              ]),
              const HSpace(Sizes.s50),
              Column(children: [
                SizedBox(
                    width: double.infinity,
                    child: DesktopTextFieldCommon(
                        validator: (number) =>
                            Validation().statusValidation(number),
                        title:
                            "${fonts.facebookAdInterstitial.tr} (${fonts.forAndroid.tr})",
                        onChanged: (val) => {},
                        controller: adsCtrl.txtFacebookInterstitialAndroid)),
                const VSpace(Sizes.s30),
                SizedBox(
                    width: double.infinity,
                    child: DesktopTextFieldCommon(
                        validator: (number) =>
                            Validation().statusValidation(number),
                        title:
                            "${fonts.facebookAdInterstitial.tr} (${fonts.foriOS.tr})",
                        onChanged: (val) => {},
                        controller: adsCtrl.txtFacebookInterstitialIos))
              ])
            ]);
    });
  }
}
