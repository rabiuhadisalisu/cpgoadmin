import 'package:goapp_admin/screens/notification/layout/notification_image.dart';

import '../../../../config.dart';

class DesktopNotificationLayout extends StatelessWidget {
  const DesktopNotificationLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<NotificationController>(builder: (notificationCtrl) {
      return Form(
        key: notificationCtrl.formKey,
        child: Column(
          children: [
            Responsive.isDesktop(context)
                ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(children: [
                        Expanded(
                            child: DesktopTextFieldCommon(
                                controller: notificationCtrl.txtTitle,
                                title: fonts.notificationTitle.tr,
                                validator: (number) =>
                                    Validation().statusValidation(number))),
                        const HSpace(Sizes.s15),
                        Expanded(
                            child: DesktopTextFieldCommon(
                                controller: notificationCtrl.txtText,
                                title: fonts.notificationText.tr, validator: (number) =>
                                Validation().statusValidation(number))),
                      ]).paddingSymmetric(
                        horizontal: Insets.i15, vertical: Insets.i20),
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(fonts.image.tr,
                              style: AppCss.outfitMedium18
                                  .textColor(
                                  appCtrl.appTheme.dark)
                                  .textHeight(1.5))
                             ,
                          NotificationImage(image:notificationCtrl.imageName)
                              .paddingSymmetric(

                              vertical: Insets.i10)
                        ]) .paddingSymmetric(
                        horizontal: Insets.i15)
                  ],
                )
                : Column(children: [
                    DesktopTextFieldCommon(
                        controller: notificationCtrl.txtTitle,

                        title: fonts.notificationTitle.tr,
                        validator: (number) =>
                            Validation().statusValidation(number)),
                    const VSpace(Sizes.s15),
                    DesktopTextFieldCommon(
                        controller: notificationCtrl.txtText,
                        title: fonts.notificationText.tr),
                  ]).paddingSymmetric(
                horizontal: Insets.i15, vertical: Insets.i20),
            CommonButton(
                    onTap: () {

                      notificationCtrl.uploadprintoFile(context);
                    },
                icon: notificationCtrl.isLoading ? const CircularProgressIndicator():null,
                    title: fonts.send.tr,
                    width: Sizes.s100,
                    style:
                        AppCss.outfitSemiBold14.textColor(appCtrl.appTheme.white))
                .alignment(Alignment.bottomRight),
            const VSpace(Sizes.s20),
          ],
        )
            .paddingSymmetric(horizontal: Insets.i20, vertical: Insets.i10)
            .boxExtension(),
      );
    });
  }
}
