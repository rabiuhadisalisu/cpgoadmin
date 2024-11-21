import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:goapp_admin/screens/appConfiguration/layout/app_log_dark.dart';

import '../../../config.dart';

class DesktopAppConfiguration extends StatelessWidget {
  final appConfigureCtrl = Get.put(AppConfigurationController());
  final FirebaseConfigModel? configModel;

  DesktopAppConfiguration({Key? key, this.configModel}) : super(key: key);

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
                    return Stack(children: [
                      Column(children: [
                        Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Expanded(
                                          child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(fonts.appLogo.tr,
                                                    style: AppCss.outfitMedium18
                                                        .textColor(appCtrl
                                                            .appTheme.dark)
                                                        .textHeight(1.5)),
                                                const VSpace(Sizes.s12),
                                                AppLogo(image: config.appLogo)
                                              ])
                                        ),
                                        Expanded(
                                          child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(fonts.appLogoDark.tr,
                                                    style: AppCss.outfitMedium18
                                                        .textColor(appCtrl
                                                            .appTheme.dark)
                                                        .textHeight(1.5)),
                                                const VSpace(Sizes.s12),
                                                AppLogoDark(image: config.appLogoDark)
                                              ]),
                                        ),
                                      ],
                                    ),
                                    const VSpace(Sizes.s30),
                                    DesktopSwitchCommon(
                                        title: fonts.isSplashVisible.tr,
                                        value: appConfigureCtrl.isSplashVisible,
                                        onChanged: (val) => appConfigureCtrl
                                            .commonSwitcherValueChange(2, val)),
                                    const VSpace(Sizes.s30),
                                    DesktopSwitchCommon(
                                        title: fonts.isOnboardingVisible.tr,
                                        value: appConfigureCtrl
                                            .isOnboardingVisible,
                                        onChanged: (val) => appConfigureCtrl
                                            .commonSwitcherValueChange(3, val)),
                                    const VSpace(Sizes.s30),
                                    DesktopSwitchCommon(
                                        title: fonts.pullToRefresh.tr,
                                        value: appConfigureCtrl.pullToRefresh,
                                        onChanged: (val) => appConfigureCtrl
                                            .commonSwitcherValueChange(4, val)),
                                    const VSpace(Sizes.s30),
                                    DesktopSwitchCommon(
                                        title: fonts.clearCookies.tr,
                                        value: appConfigureCtrl.clearCookies,
                                        onChanged: (val) => appConfigureCtrl
                                            .commonSwitcherValueChange(5, val)),
                                    const VSpace(Sizes.s30),
                                    DesktopSwitchCommon(
                                        title: fonts.footerVisible.tr,
                                        value: appConfigureCtrl.footerVisible,
                                        onChanged: (val) => appConfigureCtrl
                                            .commonSwitcherValueChange(6, val)),
                                    const VSpace(Sizes.s30),
                                    DesktopSwitchCommon(
                                        isDivider: true,
                                        title: fonts.headerVisible.tr,
                                        value: appConfigureCtrl.headerVisible,
                                        onChanged: (val) => appConfigureCtrl
                                            .commonSwitcherValueChange(7, val))
                                  ])),
                              Container(
                                      width: 1,
                                      height:
                                          MediaQuery.of(context).size.height /
                                              1.6,
                                      color: appCtrl.appTheme.lightGray)
                                  .paddingSymmetric(horizontal: Insets.i50),
                              Expanded(
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                    Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Expanded(
                                            child: SizedBox(
                                                // width: Sizes.s500,
                                                child: DesktopTextFieldCommon(
                                                    validator: (number) =>
                                                        Validation()
                                                            .statusValidation(
                                                                number),
                                                    title: fonts.appName.tr,
                                                    onChanged: (val) => {
                                                          appConfigureCtrl
                                                              .commonSwitcherValueChange(
                                                                  1, val)
                                                        },
                                                    controller: appConfigureCtrl
                                                        .txtappName)),
                                          )
                                        ]),
                                    Container(
                                            height: 1,
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                2.5,
                                            color: appCtrl.appTheme.lightGray)
                                        .paddingSymmetric(vertical: Insets.i30),
                                    Text("${fonts.onboardingStyle.tr} : ",
                                        style: AppCss.outfitMedium18
                                            .textColor(appCtrl.appTheme.dark)
                                            .textHeight(1.5)),
                                    const VSpace(Sizes.s10),
                                    const Row(children: [
                                      Expanded(
                                          child: OnBoardingVariant(
                                              idType: "onBoardingVariant1",
                                              index: 1)),
                                      HSpace(Sizes.s20),
                                      Expanded(
                                          child: OnBoardingVariant(
                                              idType: "onBoardingVariant2",
                                              index: 2)),
                                      HSpace(Sizes.s20),
                                      Expanded(
                                          child: OnBoardingVariant(
                                              idType: "onBoardingVariant3",
                                              index: 3))
                                    ])
                                  ]))
                            ]).paddingSymmetric(
                            vertical: Insets.i20, horizontal: Insets.i20),
                        Container(
                          height: 1,
                          width: MediaQuery.of(context).size.width / 1.2,
                          color: appCtrl.appTheme.lightGray,
                        ).paddingSymmetric(vertical: Insets.i20),
                        CommonButton(
                                width: Sizes.s200,
                                icon: appConfigureCtrl.isLoading
                                    ? CircularProgressIndicator(
                                        color: appCtrl.appTheme.white,
                                      )
                                    : null,
                                onTap: () {
                                  appConfigureCtrl.uploadAppConfiguartion();
                                },
                                title: fonts.update.tr,
                                style: AppCss.outfitSemiBold14
                                    .textColor(appCtrl.appTheme.white))
                            .alignment(Alignment.bottomLeft),
                      ])
                    ])
                        .paddingSymmetric(
                            horizontal: Insets.i20, vertical: Insets.i20)
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
