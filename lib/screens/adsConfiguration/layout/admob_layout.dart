import '../../../config.dart';

class AdMobLayout extends StatelessWidget {
  const AdMobLayout({super.key});

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
                            "${fonts.adMobBanner.tr} (${fonts.forAndroid.tr})",
                        onChanged: (val) => {},
                        controller: adsCtrl.txtAdsBannerAndroid)),
                const VSpace(Sizes.s30),
                SizedBox(
                    width: double.infinity,
                    child: DesktopTextFieldCommon(
                        validator: (number) =>
                            Validation().statusValidation(number),
                        title: "${fonts.adMobBanner.tr} (${fonts.foriOS.tr})",
                        onChanged: (val) => {},
                        controller: adsCtrl.txtAdsBannerIos))
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
                            "${fonts.admobInterstitial.tr} (${fonts.forAndroid.tr})",
                        onChanged: (val) => {},
                        controller: adsCtrl.txtAdsInterstitialAndroid)),
                const SizedBox(height: 30),
                SizedBox(
                    width: double.infinity,
                    child: DesktopTextFieldCommon(
                        validator: (number) =>
                            Validation().statusValidation(number),
                        title:
                            "${fonts.admobInterstitial.tr} (${fonts.foriOS.tr})",
                        onChanged: (val) => {},
                        controller: adsCtrl.txtAdsInterstitialIos))
              ]))
            ])
          : Column(children: [
              SizedBox(
                  width: double.infinity,
                  child: DesktopTextFieldCommon(
                      validator: (number) =>
                          Validation().statusValidation(number),
                      title: "${fonts.adMobBanner.tr} (${fonts.forAndroid.tr})",
                      onChanged: (val) => {},
                      controller: adsCtrl.txtAdsBannerAndroid)),
              const VSpace(Sizes.s20),
              SizedBox(
                  width: double.infinity,
                  child: DesktopTextFieldCommon(
                      validator: (number) =>
                          Validation().statusValidation(number),
                      title: "${fonts.adMobBanner.tr} (${fonts.foriOS.tr})",
                      onChanged: (val) => {},
                      controller: adsCtrl.txtAdsBannerIos)),
              const VSpace(Sizes.s20),
              Column(children: [
                SizedBox(
                    width: double.infinity,
                    child: DesktopTextFieldCommon(
                        validator: (number) =>
                            Validation().statusValidation(number),
                        title:
                            "${fonts.admobInterstitial.tr} (${fonts.forAndroid.tr})",
                        onChanged: (val) => {},
                        controller: adsCtrl.txtAdsInterstitialAndroid)),
                const VSpace(Sizes.s20),
                SizedBox(
                    width: double.infinity,
                    child: DesktopTextFieldCommon(
                        validator: (number) =>
                            Validation().statusValidation(number),
                        title:
                            "${fonts.admobInterstitial.tr} (${fonts.foriOS.tr})",
                        onChanged: (val) => {},
                        controller: adsCtrl.txtAdsInterstitialIos))
              ])
            ]);
    });
  }
}
