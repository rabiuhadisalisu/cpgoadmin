import '../../../config.dart';

class CustomGradientColorDialog extends StatelessWidget {
  final List? themeColor;
  const CustomGradientColorDialog({Key? key, this.themeColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ThemeColorController>(builder: (themeConfigureCtrl) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Column(
                children: [
                  ColorLayout(
                      width: Sizes.s500,
                      color: themeConfigureCtrl.gradientColor1,
                      title: fonts.gradientColor1.tr,
                      onTap: () => showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return ThemeColorDialog(
                              title: fonts.selectedGradientColor1,
                              index: 2,
                            );
                          })),
                  const VSpace(Sizes.s20),
                  ColorLayout(
                      width: Sizes.s500,
                      color: themeConfigureCtrl.gradientColor2,
                      title: fonts.gradientColor2.tr,
                      onTap: () => showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return ThemeColorDialog(
                              title: fonts.selectedGradientColor2,
                              index: 3,
                            );
                          })),
                ],
              ),
              const HSpace(Sizes.s50),
              Container(
                height: Sizes.s120,
                width: Sizes.s120,
                decoration: BoxDecoration(
                  borderRadius:
                      const BorderRadius.all(Radius.circular(AppRadius.r20)),
                  gradient: LinearGradient(
                    begin: const Alignment(-0.00, -1.00),
                    end: const Alignment(0, 1),
                    colors: [
                      themeConfigureCtrl.gradientColor1,
                      themeConfigureCtrl.gradientColor2
                    ],
                  ),
                ),
              ).marginOnly(top: Insets.i30)
            ],
          )
        ],
      );
    });
  }
}
