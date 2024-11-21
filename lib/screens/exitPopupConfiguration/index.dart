import '../../config.dart';

class ExitPopupConfiguration extends StatelessWidget {
  final exitPopupCtrl = Get.put(ExitPopupController());

  ExitPopupConfiguration({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ExitPopupController>(builder: (exitPopupCtrl) {
      return Card(
        elevation: 0,

        color: appCtrl.appTheme.whiteColor,
        child: const DesktopExitPopupLayout()
                .paddingSymmetric(horizontal: Insets.i15, vertical: Insets.i20),
      );
    });
  }
}
