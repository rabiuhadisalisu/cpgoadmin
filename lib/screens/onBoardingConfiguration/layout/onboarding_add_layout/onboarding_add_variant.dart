import '../../../../config.dart';

class OnBoardingAddVariant extends StatelessWidget {
  final String? idType;
  final int? index;

  const OnBoardingAddVariant({super.key, this.idType, this.index});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<VariantOnBoardingController>(
        builder: (variantOnBoardingCtrl) {
      return Column(
        children: [
          StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection(collectionName.splashConfiguration)
                  .snapshots(),
              builder: (context, snapShot) {
                if (snapShot.hasData) {
                  FirebaseConfigModel config = FirebaseConfigModel.fromJson(
                      snapShot.data!.docs[0].data());
                  return Column(children: [
                    Responsive.isDesktop(context)
                        ? Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                                Expanded(
                                    child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                      Text(fonts.onBoardingLogo.tr,
                                          style: AppCss.outfitMedium18
                                              .textColor(appCtrl.appTheme.dark)
                                              .textHeight(1.5)),
                                      const VSpace(Sizes.s10),
                                      SizedBox(
                                          width: Sizes.s500,
                                          child: OnBoardingImage(
                                              title: fonts.onBoardingLogo,
                                              image: config.onBoardingLogo))
                                    ])),
                                const HSpace(Sizes.s25),
                                Expanded(
                                    child: DesktopTextFieldCommon(
                                        validator: (number) => Validation()
                                            .statusValidation(number),
                                        title: fonts.onBoardingTitle.tr,
                                        onChanged: (val) => {},
                                        controller: variantOnBoardingCtrl
                                            .txtOnBoardingTitle)),
                                const HSpace(Sizes.s25),
                                Expanded(
                                  child: DesktopTextFieldCommon(
                                      validator: (number) =>
                                          Validation().statusValidation(number),
                                      title: fonts.onBoardingDescription.tr,
                                      onChanged: (val) => {},
                                      controller: variantOnBoardingCtrl
                                          .txtOnBoardingDescription),
                                ),
                                const HSpace(Sizes.s30),
                              ]).marginOnly(left: Insets.i15)
                        : Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                                Text(fonts.onBoardingLogo.tr,
                                    style: AppCss.outfitMedium18
                                        .textColor(appCtrl.appTheme.dark)
                                        .textHeight(1.5)),
                                const VSpace(Sizes.s15),
                                SizedBox(
                                    width: double.infinity,
                                    child: OnBoardingImage(
                                        title: fonts.onBoardingLogo,
                                        image: config.onBoardingLogo)),
                                const VSpace(Sizes.s25),
                                DesktopTextFieldCommon(
                                    width: double.infinity,
                                    validator: (number) =>
                                        Validation().statusValidation(number),
                                    title: fonts.onBoardingTitle.tr,
                                    onChanged: (val) => {},
                                    controller: variantOnBoardingCtrl
                                        .txtOnBoardingTitle),
                                const VSpace(Sizes.s25),
                                DesktopTextFieldCommon(
                                    width: double.infinity,
                                    validator: (number) =>
                                        Validation().statusValidation(number),
                                    title: fonts.onBoardingDescription.tr,
                                    onChanged: (val) => {},
                                    controller: variantOnBoardingCtrl
                                        .txtOnBoardingDescription),
                                const VSpace(Sizes.s30),
                              ]).marginOnly(left: Insets.i15),
                    const VSpace(Insets.i10),
                    Responsive.isDesktop(context)
                        ? Align(
                            alignment: Alignment.centerRight,
                            child: CommonButton(
                                    height: Sizes.s50,
                                    onTap: () => variantOnBoardingCtrl
                                        .commonValueChange(),
                                    icon: variantOnBoardingCtrl.isLoading
                                        ? CircularProgressIndicator(
                                            color: appCtrl.appTheme.white,
                                          )
                                        : Container(),
                                    title: fonts.add.tr,
                                    width: Sizes.s200,
                                    style: AppCss.outfitSemiBold18
                                        .textColor(appCtrl.appTheme.white))
                                .marginOnly(right: 14))
                        : CommonButton(
                            height: Sizes.s50,
                            onTap: () =>
                                variantOnBoardingCtrl.commonValueChange(),
                            icon: variantOnBoardingCtrl.isLoading
                                ? CircularProgressIndicator(
                                    color: appCtrl.appTheme.white)
                                : null,
                            title: fonts.add.tr,
                            width: Sizes.s200,
                            style: AppCss.outfitSemiBold18
                                .textColor(appCtrl.appTheme.white))
                  ]);
                } else {
                  return Container();
                }
              })
        ],
      );
    });
  }
}
