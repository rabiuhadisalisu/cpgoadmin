import '../../../config.dart';

class SplashConfiguration extends StatelessWidget {
  final variantCtrl = Get.put(VariantController());

  SplashConfiguration({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<VariantController>(builder: (variantCtrl) {
      return Stack(alignment: Alignment.center, children: [
        Form(
            // key: variantCtrl.formKey,
            child: StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection(collectionName.splashConfiguration)
                    .snapshots(),
                builder: (context, snapShot) {
                  if (snapShot.hasData) {
                    FirebaseConfigModel config = FirebaseConfigModel.fromJson(
                        snapShot.data!.docs[0].data());
                    return Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                          Stack(children: [
                            SizedBox(
                                    child: Responsive.isDesktop(context)
                                        ? Row(
                                            children: [
                                              Expanded(
                                                child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(fonts.splashLogo.tr,
                                                          style: AppCss
                                                              .outfitMedium18
                                                              .textColor(appCtrl
                                                                  .appTheme
                                                                  .dark)
                                                              .textHeight(1.5)),
                                                      const VSpace(Sizes.s10),
                                                      SizedBox(
                                                          width: Sizes.s500,
                                                          child: SplashLogo(
                                                              title: fonts
                                                                  .splashLogo,
                                                              image: config
                                                                  .splashLogo)),
                                                      Container(
                                                        height:1,
                                                        width:
                                                        MediaQuery.of(context).size.width /
                                                            2.5,
                                                        color: appCtrl.appTheme.lightGray,
                                                      ).paddingSymmetric(vertical: Insets.i30),
                                                      Row(
                                                        children: [
                                                          Expanded(
                                                            child: SplashLogoSize(
                                                                                                                          title: fonts
                                                              .splashLogoHeight
                                                              .tr
                                                              .toString(),  index: 1,
                                                                                                                        ),
                                                          ),
                                                          const HSpace(
                                                              Sizes.s20),
                                                          Expanded(
                                                            child: SplashLogoSize(
                                                                                                                          title: fonts
                                                              .splashLogoWeight
                                                              .tr
                                                              .toString(),
                                                              index: 2,
                                                                                                                        ),
                                                          ),
                                                        ],
                                                      ),
                                                      Container(
                                                        height: 1,
                                                        width:
                                                        MediaQuery.of(context).size.width /
                                                            2.5,
                                                        color: appCtrl.appTheme.lightGray,
                                                      ).paddingSymmetric(vertical: Insets.i30),
                                                      Row(
                                                        children: [
                                                          Expanded(
                                                            child: ColorLayout(
                                                                width:
                                                                    Sizes.s250,
                                                                color: variantCtrl
                                                                    .firstColor,
                                                                title: fonts
                                                                    .firstColor
                                                                    .tr,
                                                                onTap: () =>
                                                                    showDialog(
                                                                        context:
                                                                            context,
                                                                        builder:
                                                                            (BuildContext
                                                                                context) {
                                                                          return SplashColorDialog(
                                                                            title:
                                                                                fonts.firstColor,
                                                                            index:
                                                                                1,
                                                                          );
                                                                        })),
                                                          ),
                                                          const HSpace(
                                                              Sizes.s20),
                                                          Expanded(
                                                            child: ColorLayout(
                                                                width:
                                                                    Sizes.s250,
                                                                color: variantCtrl
                                                                    .secondColor,
                                                                title: fonts
                                                                    .secondColor
                                                                    .tr,
                                                                onTap: () =>
                                                                    showDialog(
                                                                        context:
                                                                            context,
                                                                        builder:
                                                                            (BuildContext
                                                                                context) {
                                                                          return SplashColorDialog(
                                                                            title:
                                                                                fonts.secondColor,
                                                                            index:
                                                                                2,
                                                                          );
                                                                        })),
                                                          ),
                                                        ],
                                                      ),
                                                      Container(
                                                        height: 1,
                                                        width:
                                                        MediaQuery.of(context).size.width /
                                                            2.5,
                                                        color: appCtrl.appTheme.lightGray,
                                                      ).paddingSymmetric(vertical: Insets.i30),
                                                      DesktopSwitchCommon(
                                                          title: fonts
                                                              .splashTitleVisible
                                                              .tr,
                                                          value: variantCtrl
                                                              .titleVisible,
                                                          onChanged: (val) =>
                                                              variantCtrl
                                                                  .commonSwitcherValueChange(
                                                                      1, val)),
                                                      const VSpace(Sizes.s20),
                                                      variantCtrl.titleVisible
                                                          ? Row(children: [
                                                              SizedBox(
                                                                  width: Sizes
                                                                      .s250,
                                                                  child: DesktopTextFieldCommon(
                                                                      validator: (number) =>
                                                                          Validation().statusValidation(
                                                                              number),
                                                                      title: fonts
                                                                          .splashTitle
                                                                          .tr,
                                                                      onChanged:
                                                                          (val) => variantCtrl.commonSwitcherValueChange(
                                                                              2,
                                                                              val),
                                                                      controller:
                                                                          variantCtrl
                                                                              .txtSplashTitle)),
                                                              const HSpace(
                                                                  Sizes.s20),
                                                              ColorLayout(
                                                                  height:
                                                                      Sizes.s30,
                                                                  width: Sizes
                                                                      .s250,
                                                                  color: variantCtrl
                                                                      .titleColor,
                                                                  title: fonts
                                                                      .splashTitleColor
                                                                      .tr,
                                                                  onTap: () =>
                                                                      showDialog(
                                                                          context:
                                                                              context,
                                                                          builder:
                                                                              (BuildContext context) {
                                                                            return SplashColorDialog(
                                                                              title: fonts.splashTitleColor,
                                                                              index: 3,
                                                                            );
                                                                          })),
                                                            ])
                                                          : Container(),
                                                      const VSpace(Sizes.s30),
                                                      CommonButton(
                                                          width: Sizes.s200,
                                                          margin: 0,
                                                          icon: variantCtrl
                                                                  .isLoading
                                                              ? CircularProgressIndicator(
                                                                  color: appCtrl
                                                                      .appTheme
                                                                      .white,
                                                                )
                                                              : null,
                                                          onTap: () {
                                                            variantCtrl
                                                                .uploadSplashdata();
                                                          },
                                                          title:
                                                              fonts.update.tr,
                                                          style: AppCss
                                                              .outfitSemiBold14
                                                              .textColor(appCtrl
                                                                  .appTheme
                                                                  .white)),
                                                    ]),
                                              ),
                                              const HSpace(Insets.i70),
                                              Container(
                                                width:1,
                                                height:
                                                MediaQuery.of(context).size.height / 1.6,
                                                color: appCtrl.appTheme.lightGray,
                                              )
                                                  .paddingSymmetric(horizontal: Insets.i50)
                                                  .paddingOnly(right: Insets.i40),
                                              const PreviewLayout()
                                            ],
                                          )
                                        : Column(children: [
                                            Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(fonts.splashLogo.tr,
                                                      style: AppCss
                                                          .outfitMedium18
                                                          .textColor(appCtrl
                                                              .appTheme.dark)
                                                          .textHeight(1.5)),
                                                  const VSpace(Sizes.s10),
                                                  SizedBox(
                                                      width: Sizes.s500,
                                                      child: SplashLogo(
                                                          title:
                                                              fonts.splashLogo,
                                                          image: config
                                                              .splashLogo)),
                                                  const VSpace(Sizes.s30),
                                                  Row(
                                                    children: [
                                                      Expanded(
                                                        child: SplashLogoSize(
                                                          title: fonts
                                                              .splashLogoHeight
                                                              .tr
                                                              .toString(),
                                                          // index: 1,
                                                        ),
                                                      ),
                                                      const HSpace(Sizes.s20),
                                                      Expanded(
                                                        child: SplashLogoSize(
                                                          title: fonts
                                                              .splashLogoWeight
                                                              .tr
                                                              .toString(),
                                                          // index: 2,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  const VSpace(Sizes.s30),
                                                  Row(
                                                    children: [
                                                      Expanded(
                                                        child: ColorLayout(
                                                            width: Sizes.s250,
                                                            color: variantCtrl
                                                                .firstColor,
                                                            title: fonts
                                                                .firstColor.tr,
                                                            onTap: () =>
                                                                showDialog(
                                                                    context:
                                                                        context,
                                                                    builder:
                                                                        (BuildContext
                                                                            context) {
                                                                      return SplashColorDialog(
                                                                        title: fonts
                                                                            .firstColor,
                                                                        index:
                                                                            1,
                                                                      );
                                                                    })),
                                                      ),
                                                      const HSpace(Sizes.s20),
                                                      Expanded(
                                                        child: ColorLayout(
                                                            width: Sizes.s250,
                                                            color: variantCtrl
                                                                .secondColor,
                                                            title: fonts
                                                                .secondColor.tr,
                                                            onTap: () =>
                                                                showDialog(
                                                                    context:
                                                                        context,
                                                                    builder:
                                                                        (BuildContext
                                                                            context) {
                                                                      return SplashColorDialog(
                                                                        title: fonts
                                                                            .secondColor,
                                                                        index:
                                                                            2,
                                                                      );
                                                                    })),
                                                      ),
                                                    ],
                                                  ),
                                                  const VSpace(Sizes.s30),
                                                  DesktopSwitchCommon(
                                                      title: fonts
                                                          .splashTitleVisible
                                                          .tr,
                                                      value: variantCtrl
                                                          .titleVisible,
                                                      onChanged: (val) =>
                                                          variantCtrl
                                                              .commonSwitcherValueChange(
                                                                  1, val)),
                                                  const VSpace(Sizes.s20),
                                                  variantCtrl.titleVisible
                                                      ? Row(children: [
                                                          SizedBox(
                                                              width: Sizes.s250,
                                                              child: DesktopTextFieldCommon(
                                                                  validator: (number) =>
                                                                      Validation()
                                                                          .statusValidation(
                                                                              number),
                                                                  title: fonts
                                                                      .splashTitle
                                                                      .tr,
                                                                  onChanged: (val) =>
                                                                      variantCtrl
                                                                          .commonSwitcherValueChange(
                                                                              2,
                                                                              val),
                                                                  controller:
                                                                      variantCtrl
                                                                          .txtSplashTitle)),
                                                          const HSpace(
                                                              Sizes.s20),
                                                          ColorLayout(
                                                              height: Sizes.s30,
                                                              width: Sizes.s250,
                                                              color: variantCtrl
                                                                  .titleColor,
                                                              title: fonts
                                                                  .splashTitleColor
                                                                  .tr,
                                                              onTap: () =>
                                                                  showDialog(
                                                                      context:
                                                                          context,
                                                                      builder:
                                                                          (BuildContext
                                                                              context) {
                                                                        return SplashColorDialog(
                                                                          title:
                                                                              fonts.splashTitleColor,
                                                                          index:
                                                                              3,
                                                                        );
                                                                      })),
                                                        ])
                                                      : Container(),
                                                  const VSpace(Sizes.s30),
                                                  CommonButton(
                                                      width: Sizes.s200,
                                                      margin: 0,
                                                      icon: variantCtrl.isLoading
                                                          ? CircularProgressIndicator(
                                                        color: appCtrl.appTheme.white,
                                                      )
                                                          : null,
                                                      onTap: () {
                                                        variantCtrl
                                                            .uploadSplashdata();
                                                      },
                                                      title: fonts.update.tr,
                                                      style: AppCss.outfitSemiBold14
                                                          .textColor(appCtrl.appTheme.white))


                                                ]),
                                            const VSpace(Insets.i40),
                                            const PreviewLayout()
                                          ]))
                                .marginOnly(
                                    top: Insets.i70,
                                    left: Insets.i35,
                                    bottom: Insets.i20),
                            CommonHeading(
                              title: fonts.splashConfiguration.tr,
                              style: AppCss.outfitblack20
                                  .textColor(appCtrl.appTheme.primary),
                            ).paddingOnly(left: Insets.i15),
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
