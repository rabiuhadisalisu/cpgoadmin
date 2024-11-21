import '../../../config.dart';

class MobileAppConfiguration extends StatelessWidget {
  final appConfigureCtrl = Get.put(AppConfigurationController());
  final FirebaseConfigModel? configModel;

  MobileAppConfiguration({Key? key, this.configModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppConfigurationController>(builder: (appConfigureCtrl) {
      return Stack(alignment: Alignment.center, children: [
        Form(
            key: appConfigureCtrl.formKey,
            child: StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection(collectionName.config)
                    .snapshots(),
                builder: (context, snapShot) {
                  if (snapShot.hasData) {
                    FirebaseConfigModel config = FirebaseConfigModel.fromJson(
                        snapShot.data!.docs[0].data());
                    return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                          Stack(children: [
                            SizedBox(
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    const VSpace(Sizes.s30),
                                    Text(fonts.appLogo.tr,
                                        style: AppCss.outfitMedium18
                                            .textColor(appCtrl.appTheme.dark)
                                            .textHeight(1.5)),
                                    const VSpace(Sizes.s10),
                                    AppLogo(image: config.appLogo),
                                    const VSpace(Sizes.s30),
                                    DesktopTextFieldCommon(
                                        validator: (number) => Validation()
                                            .statusValidation(number),
                                        title: fonts.appName.tr,
                                        onChanged: (val) => {
                                              appConfigureCtrl
                                                  .commonSwitcherValueChange(
                                                      1, val)
                                            },
                                        controller:
                                            appConfigureCtrl.txtappName),
                                    const VSpace(Sizes.s30),
                                    DesktopSwitchCommon(
                                        width: double.infinity,
                                        title: fonts.isSplashVisible.tr,
                                        value: appConfigureCtrl.isSplashVisible,
                                        onChanged: (val) => appConfigureCtrl
                                            .commonSwitcherValueChange(2, val)),
                                    const VSpace(Sizes.s30),
                                    DesktopSwitchCommon(
                                        width: double.infinity,
                                        title: fonts.isOnboardingVisible.tr,
                                        value: appConfigureCtrl
                                            .isOnboardingVisible,
                                        onChanged: (val) => appConfigureCtrl
                                            .commonSwitcherValueChange(3, val)),
                                    const VSpace(Sizes.s30),
                                    DesktopSwitchCommon(
                                        width: double.infinity,
                                        title: fonts.pullToRefresh.tr,
                                        value: appConfigureCtrl.pullToRefresh,
                                        onChanged: (val) => appConfigureCtrl
                                            .commonSwitcherValueChange(4, val)),
                                    const VSpace(Sizes.s30),
                                    DesktopSwitchCommon(
                                        width: double.infinity,
                                        title: fonts.clearCookies.tr,
                                        value: appConfigureCtrl.clearCookies,
                                        onChanged: (val) => appConfigureCtrl
                                            .commonSwitcherValueChange(5, val)),
                                    const VSpace(Sizes.s30),
                                    DesktopSwitchCommon(
                                        width: double.infinity,
                                        title: fonts.footerVisible.tr,
                                        value: appConfigureCtrl.footerVisible,
                                        onChanged: (val) => appConfigureCtrl
                                            .commonSwitcherValueChange(6, val)),
                                    const VSpace(Sizes.s30),
                                    DesktopSwitchCommon(
                                        width: double.infinity,
                                        title: fonts.headerVisible.tr,
                                        value: appConfigureCtrl.headerVisible,
                                        onChanged: (val) => appConfigureCtrl
                                            .commonSwitcherValueChange(7, val)),
                                    //     ]),
                                    const VSpace(Sizes.s30),

                                    Text("${fonts.onboardingStyle.tr} : ",
                                        style: AppCss.outfitBold18
                                            .textColor(appCtrl.appTheme.primary)
                                            .textHeight(1.5)),
                                    const VSpace(Sizes.s20),
                                    const OnBoardingVariant(
                                        idType: "onBoardingVariant1", index: 1),
                                    const VSpace(Sizes.s20),
                                    const OnBoardingVariant(
                                        idType: "onBoardingVariant2", index: 2),
                                    const VSpace(Sizes.s20),
                                    const OnBoardingVariant(
                                        idType: "onBoardingVariant3", index: 3),
                                    const VSpace(Sizes.s30),
                                    CommonButton(
                                        icon: appConfigureCtrl.isLoading
                                            ? CircularProgressIndicator(
                                                color: appCtrl.appTheme.white)
                                            : null,
                                        onTap: () {
                                          appConfigureCtrl
                                              .uploadAppConfiguartion();
                                        },
                                        title: fonts.update.tr,
                                        style: AppCss.outfitSemiBold14
                                            .textColor(appCtrl.appTheme.white))
                                  ]).paddingOnly(left: Insets.i40).marginOnly(
                                  top: Insets.i15),
                            ).marginOnly(top: Insets.i30),
                            CommonHeading(
                              title: fonts.appConfiguration.tr,
                              style: AppCss.outfitblack20
                                  .textColor(appCtrl.appTheme.primary),
                            ).paddingOnly(left: Insets.i15)
                          ])
                        ])
                        .paddingOnly(bottom: Insets.i50)
                        .paddingSymmetric(
                            horizontal: Insets.i20, vertical: Insets.i10)
                        .boxExtension();
                  } else {
                    return Container();
                  }
                })),
        if (appConfigureCtrl.isLoading)
          Center(
              child: CircularProgressIndicator(color: appCtrl.appTheme.primary))
      ]);
    });
  }
}
