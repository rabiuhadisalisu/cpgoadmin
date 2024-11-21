import '../../../config.dart';

class CustomThemeColorDialog extends StatelessWidget {
  final List? themeColor;
  const CustomThemeColorDialog({Key? key, this.themeColor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ThemeColorController>(builder: (themeConfigureCtrl) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ColorLayout(
              width: Sizes.s500,
              color: themeConfigureCtrl.primaryLightColor,
              title: fonts.primaryColor.tr,
              onTap: () => showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return ThemeColorDialog(
                      title: fonts.selectedThemeColor,
                      index: 1,
                    );
                  })),
        ],
      );
    });
  }
}
