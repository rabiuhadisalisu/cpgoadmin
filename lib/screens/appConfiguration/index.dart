
import '../../../config.dart';

class AppConfiguration extends StatelessWidget {
  final appConfigureCtrl = Get.put(AppConfigurationController());
  final FirebaseConfigModel? configModel;

  AppConfiguration({Key? key, this.configModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ExitPopupController>(builder: (exitPopupCtrl) {
      return Card(
          elevation: 3,
          shadowColor: appCtrl.appTheme.blackColor,
          color: appCtrl.appTheme.whiteColor,
          child: Responsive.isDesktop(context) && MediaQuery.of(context).size.width > 1700
              ? DesktopAppConfiguration()
              : MobileAppConfiguration());
    });
  }
}
