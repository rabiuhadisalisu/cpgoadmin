import 'package:flutter/services.dart';
import 'package:flutter_switch/flutter_switch.dart';

import '../../../config.dart';

class SettingScreen extends StatelessWidget {
  final settingsCtrl = Get.put(SettingController());

  SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppController>(builder: (appCtrl) {
      return GetBuilder<SettingController>(builder: (settingsCtrl) {
        return Stack(alignment: Alignment.center, children: [
          Form(
              // key: settingsCtrl.formKey,
              child: StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection(collectionName.config)
                      .snapshots(),
                  builder: (context, snapShot) {
                    if (snapShot.hasData) {
                      return Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const VSpace(Sizes.s20),
                            if (Responsive.isDesktop(context)) Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                        Expanded(
                                          child: Row(

                                            children: [
                                              SelectableText(fonts.showLoader.tr, textAlign: TextAlign.center, style: AppCss.outfitblack20
                                                  .textColor(appCtrl
                                                  .appTheme
                                                  .primary)),
                                              const HSpace(Sizes.s12),
                       /*                       FlutterSwitch(
activeColor: appCtrl.appTheme.primary,
                                                  height: Sizes.s25,
                                                  width: Sizes.s45,
                                                  inactiveColor: appCtrl.appTheme.lightGray,
                                                  value:
                                                      settingsCtrl.showLoading,
                                                  onToggle: (v) => settingsCtrl
                                                      .commonSwitcherValueChange(
                                                          v))*/
                                              FlutterSwitch(
                                                width: 55.0,
                                                height: 25.0,
                                                  activeColor: appCtrl.appTheme.primary,
                                                  inactiveColor: appCtrl.appTheme.lightGray,
                                                valueFontSize: 12.0,
                                                toggleSize: 18.0,
                                                value: settingsCtrl.showLoading,
                                                  onToggle: (v) => settingsCtrl
                                                      .commonSwitcherValueChange(
                                                      v)
                                              )
                                            ],
                                          ),
                                        ),
                                        if (settingsCtrl.showLoading)
                                          Expanded(
                                            child: Row(
                                                mainAxisAlignment: MainAxisAlignment.end,
                                                children: [
                                              // SizedBox(
                                              //     width: Sizes.s200,
                                              //     child: Column(
                                              //         crossAxisAlignment:
                                              //             CrossAxisAlignment
                                              //                 .start,
                                              //         children: [
                                              //           Text(fonts.fontSize.tr,
                                              //               style: AppCss
                                              //                   .outfitMedium18
                                              //                   .textColor(appCtrl
                                              //                       .appTheme
                                              //                       .dark)
                                              //                   .textHeight(1.5)),
                                              //           const VSpace(Sizes.s5),
                                              //           CommonTextBox(
                                              //               keyboardType:
                                              //                   TextInputType
                                              //                       .number,
                                              //               inputFormatters: <TextInputFormatter>[
                                              //                 FilteringTextInputFormatter
                                              //                     .digitsOnly
                                              //               ],
                                              //               filled: true,
                                              //               fillColor: appCtrl
                                              //                   .appTheme
                                              //                   .fillColor,
                                              //               controller:
                                              //                   settingsCtrl
                                              //                       .txtFontSize,
                                              //               onChanged: (value) =>
                                              //                   settingsCtrl
                                              //                       .setFontSize(
                                              //                           value),
                                              //               hinText:
                                              //                   fonts.fontSize,
                                              //               labelText:
                                              //                   fonts.fontSize)
                                              //         ])),
                                              // const HSpace(Sizes.s20),
                                              ColorLayout(
                                                  padding: 0,
                                                  height: Sizes.s45,
                                                  width: Sizes.s200,
                                                  color: settingsCtrl.loaderColor,
                                                  title: fonts.loaderColor.tr,
                                                  onTap: () => showDialog(
                                                      context: context,
                                                      builder:
                                                          (BuildContext context) {
                                                        return ColorLoaderDialog(
                                                          title:
                                                              fonts.loaderColor,
                                                        );
                                                      })),
                                            ]).paddingOnly(top: Insets.i40),
                                          )
                                      ]).paddingOnly(left: Insets.i15) else Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                        Row(
                                          children: [
                                            Row(

                                              children: [
                                                SelectableText(fonts.showLoader.tr, textAlign: TextAlign.center, style: AppCss.outfitblack20
                                                    .textColor(appCtrl
                                                    .appTheme
                                                    .primary)),
                                                const HSpace(Sizes.s12),
                                                SizedBox(
                                                  width: 80,
                                                  height: Sizes.s50,
                                                  child: Switch(
                                                      splashRadius: 20,
                                                      activeColor:
                                                      appCtrl.appTheme.primary,
                                                      materialTapTargetSize:
                                                      MaterialTapTargetSize
                                                          .shrinkWrap,
                                                      value:
                                                      settingsCtrl.showLoading,
                                                      onChanged: (v) => settingsCtrl
                                                          .commonSwitcherValueChange(
                                                          v)),
                                                )
                                              ],
                                            )
                                          ],
                                        ),
                                        if (settingsCtrl.showLoading)
                                          Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                               /* SizedBox(
                                                    width: Sizes.s200,
                                                    child: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                              fonts.fontSize.tr,
                                                              style: AppCss
                                                                  .outfitMedium18
                                                                  .textColor(
                                                                      appCtrl
                                                                          .appTheme
                                                                          .dark)
                                                                  .textHeight(
                                                                      1.5)),
                                                          const VSpace(
                                                              Sizes.s5),
                                                          CommonTextBox(
                                                              keyboardType:
                                                                  TextInputType
                                                                      .number,
                                                              inputFormatters: <TextInputFormatter>[
                                                                FilteringTextInputFormatter
                                                                    .digitsOnly
                                                              ],
                                                              filled: true,
                                                              fillColor: appCtrl
                                                                  .appTheme
                                                                  .fillColor,
                                                              controller:
                                                                  settingsCtrl
                                                                      .txtFontSize,
                                                              onChanged: (value) =>
                                                                  settingsCtrl
                                                                      .setFontSize(
                                                                          value),
                                                              hinText: fonts
                                                                  .fontSize,
                                                              labelText: fonts
                                                                  .fontSize)
                                                        ])),
                                                const VSpace(Sizes.s10),*/
                                                ColorLayout(
                                                    padding: 0,
                                                    height: Sizes.s45,
                                                    width: Sizes.s100,
                                                    color: settingsCtrl
                                                        .loaderColor,
                                                    title: fonts.loaderColor.tr,
                                                    onTap: () => showDialog(
                                                        context: context,
                                                        builder: (BuildContext
                                                            context) {
                                                          return ColorLoaderDialog(
                                                              title: fonts
                                                                  .loaderColor);
                                                        }))
                                              ]).paddingOnly(top: Insets.i40)
                                      ]).paddingOnly(left: Insets.i15),
                            if (settingsCtrl.showLoading)
                              SizedBox(
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                    Text(fonts.loaderStyle.tr,
                                        style: AppCss.outfitMedium18
                                            .textColor(appCtrl.appTheme.dark)
                                            .textHeight(1.5)),
                                    const VSpace(Sizes.s10),
                                    const LoaderStyleDialog(),
                                    const VSpace(Sizes.s40),
                                    CommonButton(
                                      width: Sizes.s200,
                                        margin: 0,
                                        icon: settingsCtrl.isLoading
                                            ? CircularProgressIndicator(
                                                color: appCtrl.appTheme.white,
                                              )
                                            :null,
                                        onTap: () {
                                          settingsCtrl.updateSettingData();
                                        },
                                        title: fonts.update.tr,
                                        style: AppCss.outfitSemiBold14
                                            .textColor(appCtrl.appTheme.white))
                                  ]).paddingAll(Insets.i20)),
                            const VSpace(Insets.i30)
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
    });
  }
}
