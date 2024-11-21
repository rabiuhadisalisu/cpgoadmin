import '../../../../config.dart';

class DesktopShareContentLayout extends StatelessWidget {
  const DesktopShareContentLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ShareContentController>(builder: (shareContentCtrl) {
      return Stack(alignment: Alignment.center, children: [
        Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          DesktopTextFieldCommon(
            controller: shareContentCtrl.txtText,
            title: fonts.shareContent.tr,
            validator: (number) => Validation().statusValidation(number),
          ),
          const VSpace(Sizes.s15),
          CommonButton(
              icon: shareContentCtrl.isLoading
                  ? CircularProgressIndicator(
                      color: appCtrl.appTheme.white,
                    )
                  : null,

margin: 0,
width: Sizes.s200,              onTap: () {
                shareContentCtrl.shareContentConfiguartion();
              },
              title: fonts.update.tr,
              style: AppCss.outfitSemiBold14.textColor(appCtrl.appTheme.white)),
        ]).paddingSymmetric(horizontal: Insets.i15, vertical: Insets.i20)
      ])
          .paddingSymmetric(horizontal: Insets.i20, vertical: Insets.i10)
          .boxExtension();
    });
  }
}
