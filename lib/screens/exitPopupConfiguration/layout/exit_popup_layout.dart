import '../../../../config.dart';

class DesktopExitPopupLayout extends StatelessWidget {
  const DesktopExitPopupLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ExitPopupController>(builder: (exitPopupCtrl) {
      return Stack(alignment: Alignment.center, children: [
        Form(
            child: StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection(collectionName.exitPopupConfiguration)
                    .snapshots(),
                builder: (context, snapShot) {
                  if (snapShot.hasData) {
                    FirebaseConfigModel config = FirebaseConfigModel.fromJson(
                        snapShot.data!.docs[0].data());
                    return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                          Responsive.isDesktop(context)
                              ? Row(children: [
                                  Expanded(
                                      child: DesktopTextFieldCommon(
                                          controller: exitPopupCtrl.txtText,
                                          title: fonts.title.tr,
                                          validator: (number) => Validation()
                                              .statusValidation(number))),
                                  const HSpace(Sizes.s15),
                            Expanded(
                                child: DesktopTextFieldCommon(
                                    controller: exitPopupCtrl.txtDescText,
                                    title: fonts.desc.tr,
                                    validator: (number) => Validation()
                                        .statusValidation(number))),
                            const HSpace(Sizes.s15),
                                  Expanded(
                                      child: DesktopTextFieldCommon(
                                          controller:
                                              exitPopupCtrl.txtPositiveText,
                                          title: fonts.positiveText.tr,
                                          validator: (number) => Validation()
                                              .statusValidation(number))),
                                  const HSpace(Sizes.s15),
                                  Expanded(
                                      child: DesktopTextFieldCommon(
                                          controller:
                                              exitPopupCtrl.txtNegativeText,
                                          title: fonts.negativeText.tr))
                                ]).paddingSymmetric(
                                  horizontal: Insets.i15, vertical: Insets.i20)
                              : Column(children: [
                                  DesktopTextFieldCommon(
                                      controller: exitPopupCtrl.txtText,
                                      title: fonts.title.tr,
                                      validator: (number) => Validation()
                                          .statusValidation(number)),
                                  const VSpace(Sizes.s15),
                                  DesktopTextFieldCommon(
                                      controller: exitPopupCtrl.txtPositiveText,
                                      title: fonts.positiveText.tr,
                                      validator: (number) => Validation()
                                          .statusValidation(number)),
                                  const VSpace(Sizes.s15),
                                  DesktopTextFieldCommon(
                                      controller: exitPopupCtrl.txtNegativeText,
                                      title: fonts.negativeText.tr)
                                ]).paddingSymmetric(
                                  horizontal: Insets.i15, vertical: Insets.i20),
                          DesktopSwitchCommon(
                                  title: fonts.showImage.tr,
                                  value: exitPopupCtrl.isImageShow,
                                  onChanged: (val) => exitPopupCtrl
                                      .commonSwitcherValueChange(val))
                              .paddingSymmetric(
                                  horizontal: Insets.i15, vertical: Insets.i10),
                          exitPopupCtrl.isImageShow
                              ? Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                      Text(fonts.image.tr,
                                              style: AppCss.outfitMedium18
                                                  .textColor(
                                                      appCtrl.appTheme.dark)
                                                  .textHeight(1.5))
                                          .paddingSymmetric(
                                              horizontal: Insets.i15),
                                      PopupImage(image: config.image)
                                          .paddingSymmetric(
                                              horizontal: Insets.i15,
                                              vertical: Insets.i10)
                                    ])
                              : Container(),
                          const VSpace(Sizes.s10),
                          CommonButton(
                            margin: 0,
                              width: Sizes.s200,
                              icon: exitPopupCtrl.isLoading
                                  ? CircularProgressIndicator(
                                      color: appCtrl.appTheme.white)
                                  : null,
                              onTap: () {
                                exitPopupCtrl.uploadExitPopupConfiguartion();
                              },
                              title: fonts.update.tr,
                              style: AppCss.outfitSemiBold14
                                  .textColor(appCtrl.appTheme.white)),
                          const VSpace(Sizes.s20)
                        ])
                        .paddingSymmetric(
                            horizontal: Insets.i20, vertical: Insets.i10)
                        .boxExtension();
                  } else {
                    return Container();
                  }
                }))
      ]);
    });
  }
}
