import '../../../config.dart';

class OnBoardingConfiguration extends StatelessWidget {
  final variantCtrl = Get.put(VariantOnBoardingController());
  OnBoardingConfiguration({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<VariantOnBoardingController>(
        builder: (variantOnBoardingCtrl) {
      return Stack(alignment: Alignment.center, children: [
        Form(
            // key: variantCtrl.formKey,
            child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
              Stack(children: [
                SizedBox(
                        child: variantCtrl.isListLayout
                            ? const OnBoardingListVariant()
                            : const OnBoardingAddVariant())
                    .marginOnly(
                        top: Insets.i70, left: Insets.i20, bottom: Insets.i20),
                CommonHeading(
                  title: fonts.onBoardingConfiguration.tr,
                  style:
                      AppCss.outfitblack20.textColor(appCtrl.appTheme.primary),
                ).paddingOnly(left: Insets.i15),
              ])
            ])
                .paddingSymmetric(horizontal: Insets.i20, vertical: Insets.i10)
                .boxExtension())
      ]);
    });
  }
}
