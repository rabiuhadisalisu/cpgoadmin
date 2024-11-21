import '../../../config.dart';

class ThemeColorDialog extends StatelessWidget {
  final String? title;
  final int? index;
  const ThemeColorDialog({Key? key, this.title, this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ThemeColorController>(builder: (themeConfigureCtrl) {
      return AlertDialog(
        scrollable: true,
        titlePadding: const EdgeInsets.all(0),
        contentPadding: const EdgeInsets.all(0),
        content: Column(
          children: [
            ColorPicker(
              pickerColor: index == 1
                  ? themeConfigureCtrl.primaryLightColor
                  : index == 2
                      ? themeConfigureCtrl.gradientColor1
                      : themeConfigureCtrl.gradientColor2,
              onColorChanged: (color) =>
                  themeConfigureCtrl.setColor(index, color),
              colorHistory: themeConfigureCtrl.colorHistory,
              onHistoryChanged: (List<Color> colors) =>
                  themeConfigureCtrl.colorHistory = colors,
            ),
          ],
        ),
      );
    });
  }
}
