import '../../../config.dart';

class GradientColorLayout extends StatelessWidget {
  final List? gradientColor;
  const GradientColorLayout({Key? key, this.gradientColor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ThemeColorController>(builder: (themeConfigureCtrl) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(fonts.gradientColor.tr,
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
              itemCount: gradientColor!.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                Color color1 = themeConfigureCtrl
                    .hexStringToColor(gradientColor![index]['color1']);
                Color color2 = themeConfigureCtrl
                    .hexStringToColor(gradientColor![index]['color2']);
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Radio(
                          value: "Theme ${index + 1}",
                          groupValue: themeConfigureCtrl.idType2,
                          onChanged: (value) {
                            themeConfigureCtrl.idType2 = value!;
                            themeConfigureCtrl.setColor(
                                2,
                                themeConfigureCtrl.hexStringToColor(
                                    gradientColor![index]['color1']));
                            themeConfigureCtrl.setColor(
                                3,
                                themeConfigureCtrl.hexStringToColor(
                                    gradientColor![index]['color2']));
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
                        gradient: LinearGradient(
                          begin: const Alignment(-0.00, -1.00),
                          end: const Alignment(0, 1),
                          colors: [color1, color2],
                        ),
                      ),
                    )
                  ],
                );
              }),
        ],
      );
    });
  }
}
