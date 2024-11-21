import '../../../config.dart';

class ColorLoaderDialog extends StatelessWidget {
  final String? title;
  const ColorLoaderDialog({Key? key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SettingController>(builder: (settingsCtrl) {
      return AlertDialog(
        scrollable: true,
        titlePadding: const EdgeInsets.all(0),
        contentPadding: const EdgeInsets.all(0),
        content: Column(
          children: [
            ColorPicker(
              pickerColor: settingsCtrl.loaderColor,
              onColorChanged: (color) => settingsCtrl.setColor(color),
              colorHistory: settingsCtrl.colorHistory,
              onHistoryChanged: (List<Color> colors) =>
                  settingsCtrl.colorHistory = colors,
            ),
          ],
        ),
      );
    });
  }
}
