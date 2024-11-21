import '../../../config.dart';
import 'package:flutter/services.dart';

class SplashLogoSize extends StatelessWidget {
  final String? title;
  final int? index;
  const SplashLogoSize({Key? key, this.title, this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<VariantController>(builder: (variantCtrl) {
      return SizedBox(
        width: Sizes.s280,
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(title!,
                  style: AppCss.outfitBold18
                      .textColor(appCtrl.appTheme.dark)
                      .textHeight(1.5)),
              const VSpace(Sizes.s10),
              CommonTextBox(
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly
                  ],
                  filled: true,
                  fillColor: appCtrl.appTheme.fillColor,
                  controller:
                      index == 1 ? variantCtrl.txtHeight : variantCtrl.txtWidth,
                  onChanged: (value) => variantCtrl.setFontSize(value, index),
                  hinText: title!,
                  labelText: title!),
            ]),
      );
    });
  }
}
