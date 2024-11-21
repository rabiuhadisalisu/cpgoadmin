import 'dart:developer';

import '../../../../config.dart';

class OnBoardingVariant extends StatelessWidget {
 final String? idType;
 final int? index;

  const OnBoardingVariant({super.key, this.idType, this.index});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppConfigurationController>(
        builder: (variantOnBoardingCtrl) {
          log("WID :${MediaQuery.of(context).size.width}");
      return Row(mainAxisAlignment: MainAxisAlignment.start, children: [
        GestureDetector(
            onTap: () => {
                  variantOnBoardingCtrl.idType = idType!,
                  variantOnBoardingCtrl.saveBanner("onBoardingVariant", index),
                  variantOnBoardingCtrl.update()
                },
            child: Container(
                width: (MediaQuery.of(context).size.width / 4).clamp(100,MediaQuery.of(context).size.width > 1800 ? 200:170),
                decoration: variantOnBoardingCtrl.idType == idType
                    ? BoxDecoration(
                        borderRadius: const BorderRadius.all(
                            Radius.circular(AppRadius.r20)),
                        border: Border.all(
                            color: appCtrl.appTheme.primary.withOpacity(0.8),
                            width: 2))
                    : BoxDecoration(
                        borderRadius: const BorderRadius.all(
                            Radius.circular(AppRadius.r20)),
                        border: Border.all(
                            color: appCtrl.appTheme.gray.withOpacity(0.8),
                            width: 2)),
                child: Stack(alignment: Alignment.topCenter, children: [
                  MediaQuery.of(context).size.width > 1611?  Image(
                          image: AssetImage(index == 1
                              ? ImageAssets().onBoardingVariant_1
                              : index == 2
                                  ? ImageAssets().onBoardingVariant_2
                                  : ImageAssets().onBoardingVariant_3),
                        )
                      .paddingSymmetric(horizontal:Insets.i20,vertical: Insets.i20) :   Image(
                      image: AssetImage(index == 1
                          ? ImageAssets().onBoardingVariant_1
                          : index == 2
                          ? ImageAssets().onBoardingVariant_2
                          : ImageAssets().onBoardingVariant_3),
                      height:  Sizes.s200,width: Sizes.s100,)
                      .paddingSymmetric(horizontal: MediaQuery.of(context).size.width > 1611? Insets.i20:0,vertical: Insets.i20),
                  RadioListTile(
                      contentPadding: EdgeInsets.zero,
                      value: idType,
                      groupValue: variantOnBoardingCtrl.idType,
                      activeColor: appCtrl.appTheme.primary,
                      onChanged: (value) {
                        variantOnBoardingCtrl.idType = value!;
                        variantOnBoardingCtrl.saveBanner(
                            "onBoardingVariant", index);
                        variantOnBoardingCtrl.update();
                      })
                ])))
      ]);
    });
  }
}
