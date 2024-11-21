import 'package:goapp_admin/screens/adsConfiguration/layout/admob_layout.dart';
import 'package:goapp_admin/screens/adsConfiguration/layout/facebook_admob_layout.dart';
import '../../../config.dart';

class AdsConfiguration extends StatelessWidget {
  final adsCtrl = Get.put(AdsController());

  AdsConfiguration({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AdsController>(builder: (adsCtrl) {
      return Stack(alignment: Alignment.center, children: [
        Form(
            // key: variantCtrl.formKey,
            child: StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection(collectionName.adsConfiguration)
                    .snapshots(),
                builder: (context, snapShot) {
                  if (snapShot.hasData) {
                    return Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                          Stack(children: [
                            SizedBox(
                                child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                  Responsive.isDesktop(context)
                                      ? Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                              if (adsCtrl.noAdsVisible)
                                                Expanded(
                                                    child: DesktopSwitchCommon(
                                                        width: double.infinity,
                                                        title: fonts.adMob.tr,
                                                        value: adsCtrl
                                                            .googleAdsVisible,
                                                        onChanged: (val) => {
                                                              adsCtrl.commonSwitcherValueChange(
                                                                  val,
                                                                  font: fonts
                                                                      .googleAdsVisible),
                                                            })),
                                              const HSpace(Sizes.s30),
                                              if (adsCtrl.noAdsVisible)
                                                Expanded(
                                                    child: DesktopSwitchCommon(
                                                        width: double.infinity,
                                                        title: fonts
                                                            .facebookAds.tr,
                                                        value: adsCtrl
                                                            .facebookAdsVisible,
                                                        onChanged: (val) => {
                                                              adsCtrl.commonSwitcherValueChange(
                                                                  val,
                                                                  font: fonts
                                                                      .facebookAdsVisible)
                                                            }))
                                            ])
                                      : Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                              DesktopSwitchCommon(
                                                  width: double.infinity,
                                                  title: fonts.none.tr,
                                                  value: adsCtrl.noAdsVisible,
                                                  onChanged: (val) => {
                                                        adsCtrl
                                                            .commonSwitcherValueChange(
                                                                val,
                                                                font: fonts
                                                                    .isAdVisible),
                                                      }),
                                              if (adsCtrl.noAdsVisible)
                                                const HSpace(Sizes.s30),
                                              if (adsCtrl.noAdsVisible)
                                                DesktopSwitchCommon(
                                                    width: double.infinity,
                                                    title: fonts.adMob.tr,
                                                    value: adsCtrl
                                                        .googleAdsVisible,
                                                    onChanged: (val) => {
                                                          adsCtrl.commonSwitcherValueChange(
                                                              val,
                                                              font: fonts
                                                                  .googleAdsVisible)
                                                        }),
                                              if (adsCtrl.noAdsVisible)
                                                const HSpace(Sizes.s30),
                                              if (adsCtrl.noAdsVisible)
                                                DesktopSwitchCommon(
                                                    width: double.infinity,
                                                    title: fonts.facebookAds.tr,
                                                    value: adsCtrl
                                                        .facebookAdsVisible,
                                                    onChanged: (val) => {
                                                          adsCtrl.commonSwitcherValueChange(
                                                              val,
                                                              font: fonts
                                                                  .facebookAdsVisible),
                                                        })
                                            ]),
                                  const VSpace(Sizes.s30),
                                  adsCtrl.googleAdsVisible == true
                                      ? const AdMobLayout()
                                      : adsCtrl.facebookAdsVisible == true
                                          ? const FacebookAdsLayout()
                                          : Container(),
                                  const VSpace(Sizes.s30),
                                  adsCtrl.noAdsVisible == false
                                      ? Container()
                                      : adsCtrl.googleAdsVisible ||
                                              adsCtrl.facebookAdsVisible
                                          ? CommonButton(
                                              height: Sizes.s50,
                                              width: Sizes.s200,
                                              margin: 0,
                                              onTap: () =>
                                                  adsCtrl.updateAdsData(),
                                              icon: adsCtrl.isLoading
                                                  ? CircularProgressIndicator(
                                                      color: appCtrl
                                                          .appTheme.white)
                                                  : Container(),
                                              title: fonts.update.tr,
                                              style: AppCss.outfitSemiBold18
                                                  .textColor(
                                                      appCtrl.appTheme.white))
                                          : Container()
                                ])).marginOnly(
                                top: Insets.i70,
                                left: Insets.i30,
                                bottom: Insets.i50),
                            Row(
                              children: [
                                Text(
                                  fonts.isAdVisible.tr,
                                  overflow: TextOverflow.ellipsis,
                                  style: AppCss.outfitMedium18
                                      .textColor(appCtrl.appTheme.dark),
                                ),
                                const HSpace(Sizes.s15),
                                Switch(
                                    activeColor: appCtrl.appTheme.primary,
                                    materialTapTargetSize:
                                        MaterialTapTargetSize.shrinkWrap,
                                    value: adsCtrl.noAdsVisible,
                                    onChanged: (val) => {
                                          adsCtrl.commonSwitcherValueChange(val,
                                              font: fonts.isAdVisible)
                                        }),
                              ],
                            ).paddingOnly(left: Insets.i30, top: Insets.i20)
                          ])
                        ])
                        .paddingSymmetric(
                            horizontal: Insets.i20, vertical: Insets.i10)
                        .boxExtension();
                  } else {
                    return Container();
                  }
                }))
      ]);
    });
  }
}
