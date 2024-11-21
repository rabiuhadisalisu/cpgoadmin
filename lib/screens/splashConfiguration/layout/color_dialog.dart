import '../../../config.dart';

class SplashColorDialog extends StatelessWidget {
  final String? title;
  final int? index;
  const SplashColorDialog({Key? key, this.title, this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<VariantController>(builder: (variantCtrl) {
      return AlertDialog(
        scrollable: true,
        titlePadding: const EdgeInsets.all(0),
        contentPadding: const EdgeInsets.all(0),
        content: Column(
          children: [
            ColorPicker(
              pickerColor: index == 1
                  ? variantCtrl.firstColor
                  : index == 2
                      ? variantCtrl.secondColor
                      : variantCtrl.titleColor,
              onColorChanged: (color) =>
                  variantCtrl.setColor(index, title, color),
              colorHistory: variantCtrl.colorHistory,
              onHistoryChanged: (List<Color> colors) =>
                  variantCtrl.colorHistory = colors,
            ),
          ],
        ),
      );
    });
  }
}
