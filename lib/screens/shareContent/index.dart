import '../../config.dart';

class ShareContentConfiguration extends StatelessWidget {
  final shareContentCtrl = Get.put(ShareContentController());
  ShareContentConfiguration({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ShareContentController>(builder: (shareContentCtrl) {
      return Card(
        elevation: 3,
        shadowColor: appCtrl.appTheme.blackColor,
        color: appCtrl.appTheme.whiteColor,
        child: Responsive.isDesktop(context)
            ? const DesktopShareContentLayout()
            : const DesktopShareContentLayout()
                .paddingSymmetric(horizontal: Insets.i15, vertical: Insets.i20),
      );
    });
  }
}
