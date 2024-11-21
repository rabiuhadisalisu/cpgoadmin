import '../../../config.dart';

class SolidColorDialog extends StatelessWidget {
  final List? themeColor;
  const SolidColorDialog({Key? key, this.themeColor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ThemeColorController>(builder: (themeConfigureCtrl) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(fonts.solidColors.tr,
              style: AppCss.outfitMedium18
                  .textColor(appCtrl.appTheme.dark)
                  .textHeight(1.5)),
          const VSpace(Sizes.s10),
          GridView.builder(
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: Sizes.s120,
                crossAxisSpacing: Sizes.s20,
                mainAxisSpacing: Sizes.s10,
                mainAxisExtent: Sizes.s140,
              ),
              itemCount: themeColor!.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Radio(
                          value: "Theme ${index + 1}",
                          groupValue: themeConfigureCtrl.idType1,
                          onChanged: (value) {
                            themeConfigureCtrl.idType1 = value!;
                            themeConfigureCtrl.setColor(
                                1,
                                themeConfigureCtrl
                                    .hexStringToColor(themeColor![index]));
                            themeConfigureCtrl.update();
                          },
                        ),
                        Text("Theme ${index + 1}")
                      ],
                    ),
                    Container(
                        height: Sizes.s100,
                        width: Sizes.s100,
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.all(
                              Radius.circular(AppRadius.r20)),
                          color: themeConfigureCtrl
                              .hexStringToColor(themeColor![index]),
                        )),
                  ],
                );
              }),
        ],
      );
    });
  }
}
