import 'dart:developer';

import 'package:flutter_switch/flutter_switch.dart';
import 'package:goapp_admin/screens/themeColor/layout/custom_theme_color_dialog.dart';

import '../../../config.dart';

class ThemeColor extends StatelessWidget {
  final themeConfigureCtrl = Get.put(ThemeColorController());

  ThemeColor({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ThemeColorController>(builder: (themeConfigureCtrl) {
      return Stack(alignment: Alignment.center, children: [
        Form(
            // key: themeConfigureCtrl.formKey,
            child: StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection(collectionName.themeColor)
                    .snapshots(),
                builder: (context, snapShot) {
                  if (snapShot.hasData) {

                    var themeColor =
                        snapShot.data!.docs[0].data()['themeColor'];
                    var gradientColor =
                        snapShot.data!.docs[0].data()['gredientColor'];

                    return Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                          Stack(children: [
                            SizedBox(
                                child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                  Responsive.isDesktop(context)
                                      ? Theme(
                                    data: ThemeData(
                                        unselectedWidgetColor: Colors.green,
                                        radioTheme: RadioThemeData(fillColor: MaterialStateProperty.all(appCtrl.appTheme.lightGray))
                                    ),
                                        child: Column(
                                            children: [
                                              Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Text(
                                                            fonts.gradientVisible
                                                                .tr,
                                                            overflow: TextOverflow
                                                                .ellipsis,
                                                            style: AppCss
                                                                .outfitMedium18
                                                                .textColor(appCtrl
                                                                    .appTheme
                                                                    .dark),
                                                          ),
                                                          const HSpace(Sizes.s12),
                                                          FlutterSwitch(
                                                            width: 50,
                                                            height: 30,
                                                            activeColor: appCtrl
                                                                .appTheme.primary,
                                                            value: themeConfigureCtrl
                                                                .isGradientVisible,
                                                            onToggle: (value) =>
                                                                themeConfigureCtrl
                                                                    .isGradientSwitch(
                                                                        value),
                                                          )
                                                        ]),

                                                  ]),
                                               const VSpace(Sizes.s20),
                                               Divider(color: appCtrl.appTheme.lightGray,),
                                               (!themeConfigureCtrl
                                                  .isGradientVisible) ?
                                               Row(
                                                 children: [
                                                   Expanded(
                                                     child: RadioListTile(
                                                       contentPadding:
                                                           EdgeInsets.zero,
                                                       title:  Text(
                                                           fonts.defaultColor.tr,style: AppCss.outfitMedium16.textColor(appCtrl.appTheme.dark)),
                                                       value: "default",
                                                       groupValue:
                                                           themeConfigureCtrl
                                                               .solidOption,
                                                       activeColor: appCtrl
                                                           .appTheme.primary,

                                                       onChanged: (value) {
                                                         themeConfigureCtrl
                                                                 .solidOption =
                                                             value!;
                                                         themeConfigureCtrl
                                                             .solidColor = true;
                                                         themeConfigureCtrl
                                                             .update();
                                                       },
                                                     ),
                                                   ),
                                                   Expanded(
                                                     child: RadioListTile(
                                                       contentPadding:
                                                           EdgeInsets.zero,
                                                       title:
                                                            Text(fonts.customColor.tr,style: AppCss.outfitMedium16.textColor(appCtrl.appTheme.dark)),
                                                       value: "custom",
                                                       groupValue:
                                                           themeConfigureCtrl
                                                               .solidOption,
                                                       activeColor: appCtrl
                                                           .appTheme.primary,
                                                       onChanged: (value) {
                                                         themeConfigureCtrl
                                                                 .solidOption =
                                                             value!;
                                                         themeConfigureCtrl
                                                             .solidColor = false;
                                                         themeConfigureCtrl
                                                             .update();
                                                       },
                                                     ),
                                                   )
                                                 ],
                                               ).marginOnly(top: Insets.i20) :Row(
                                                 children: [
                                                   Expanded(
                                                     child: RadioListTile(
                                                       contentPadding:
                                                       EdgeInsets.zero,
                                                       title:  Text(
                                                           fonts.defaultGradientColor.tr,style: AppCss.outfitMedium16.textColor(appCtrl.appTheme.dark),),
                                                       value: "defaultGradient",
                                                       groupValue:
                                                       themeConfigureCtrl
                                                           .gradientOption,
                                                       activeColor: appCtrl
                                                           .appTheme.primary,
                                                       onChanged: (value) {
                                                         themeConfigureCtrl
                                                             .gradientOption =
                                                         value!;
                                                         themeConfigureCtrl
                                                             .customThemeColorVisible = true;
                                                         themeConfigureCtrl
                                                             .update();

                                                         log("themeConfigureCtrl :${themeConfigureCtrl
                                                             .gradientOption}");
                                                       },
                                                     ),
                                                   ),
                                                   Expanded(
                                                     child: RadioListTile(
                                                       contentPadding:
                                                       EdgeInsets.zero,
                                                       title:
                                                        Text(fonts.customGradientColor.tr,style: AppCss.outfitMedium16.textColor(appCtrl.appTheme.dark)),
                                                       value: "custom",
                                                       groupValue:
                                                       themeConfigureCtrl
                                                           .gradientOption,
                                                       activeColor: appCtrl
                                                           .appTheme.primary,
                                                       onChanged: (value) {
                                                         themeConfigureCtrl
                                                             .gradientOption =
                                                         value!;
                                                         themeConfigureCtrl
                                                             .customThemeColorVisible = false;
                                                         themeConfigureCtrl
                                                             .update();
                                                       },
                                                     ),
                                                   )
                                                 ],
                                               ).marginOnly(top: Insets.i20),
                                              const VSpace(Sizes.s20),
                                              Divider(color: appCtrl.appTheme.lightGray,),
                                            ],
                                          ),
                                      )
                                      : Theme(
                                    data: ThemeData(
                                        unselectedWidgetColor: Colors.green,
                                        radioTheme: RadioThemeData(fillColor: MaterialStateProperty.all(appCtrl.appTheme.lightGray))
                                    ),
                                        child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Row(
                                                  mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                                  children: [
                                                    Row(
                                                        mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                        children: [
                                                          Text(
                                                            fonts.gradientVisible
                                                                .tr,
                                                            overflow: TextOverflow
                                                                .ellipsis,
                                                            style: AppCss
                                                                .outfitMedium18
                                                                .textColor(appCtrl
                                                                .appTheme
                                                                .dark),
                                                          ),
                                                          const HSpace(Sizes.s12),
                                                          FlutterSwitch(
                                                            width: 50,
                                                            height: 30,
                                                            activeColor: appCtrl
                                                                .appTheme.primary,
                                                            value: themeConfigureCtrl
                                                                .isGradientVisible,
                                                            onToggle: (value) =>
                                                                themeConfigureCtrl
                                                                    .isGradientSwitch(
                                                                    value),
                                                          )
                                                        ]),

                                                  ]),
                                              const VSpace(Sizes.s20),
                                              Divider(color: appCtrl.appTheme.lightGray,),
                                              (!themeConfigureCtrl
                                                  .isGradientVisible) ?
                                              Row(
                                                children: [
                                                  Expanded(
                                                    child: RadioListTile(
                                                      contentPadding:
                                                      EdgeInsets.zero,
                                                      title:  Text(
                                                          fonts.defaultColor.tr,style: AppCss.outfitMedium16.textColor(appCtrl.appTheme.dark)),
                                                      value: "default",
                                                      groupValue:
                                                      themeConfigureCtrl
                                                          .solidOption,
                                                      activeColor: appCtrl
                                                          .appTheme.primary,
                                                      onChanged: (value) {
                                                        themeConfigureCtrl
                                                            .solidOption =
                                                        value!;
                                                        themeConfigureCtrl
                                                            .solidColor = true;
                                                        themeConfigureCtrl
                                                            .update();
                                                      },
                                                    ),
                                                  ),
                                                  Expanded(
                                                    child: RadioListTile(
                                                      contentPadding:
                                                      EdgeInsets.zero,
                                                      title:
                                                      Text(fonts.customColor.tr,style: AppCss.outfitMedium16.textColor(appCtrl.appTheme.dark)),
                                                      value: "custom",
                                                      groupValue:
                                                      themeConfigureCtrl
                                                          .solidOption,
                                                      activeColor: appCtrl
                                                          .appTheme.primary,
                                                      onChanged: (value) {
                                                        themeConfigureCtrl
                                                            .solidOption =
                                                        value!;
                                                        themeConfigureCtrl
                                                            .solidColor = false;
                                                        themeConfigureCtrl
                                                            .update();
                                                      },
                                                    ),
                                                  )
                                                ],
                                              ).marginOnly(top: Insets.i20) :Row(
                                                children: [
                                                  Expanded(
                                                    child: RadioListTile(
                                                      contentPadding:
                                                      EdgeInsets.zero,
                                                      title:  Text(
                                                        fonts.defaultGradientColor.tr,style: AppCss.outfitMedium16.textColor(appCtrl.appTheme.dark),),
                                                      value: "defaultGradient",
                                                      groupValue:
                                                      themeConfigureCtrl
                                                          .gradientOption,
                                                      activeColor: appCtrl
                                                          .appTheme.primary,
                                                      onChanged: (value) {
                                                        themeConfigureCtrl
                                                            .gradientOption =
                                                        value!;
                                                        themeConfigureCtrl
                                                            .customThemeColorVisible = true;
                                                        themeConfigureCtrl
                                                            .update();

                                                        log("themeConfigureCtrl :${themeConfigureCtrl
                                                            .gradientOption}");
                                                      },
                                                    ),
                                                  ),
                                                  Expanded(
                                                    child: RadioListTile(
                                                      contentPadding:
                                                      EdgeInsets.zero,
                                                      title:
                                                      Text(fonts.customGradientColor.tr,style: AppCss.outfitMedium16.textColor(appCtrl.appTheme.dark)),
                                                      value: "custom",
                                                      groupValue:
                                                      themeConfigureCtrl
                                                          .gradientOption,
                                                      activeColor: appCtrl
                                                          .appTheme.primary,
                                                      onChanged: (value) {
                                                        themeConfigureCtrl
                                                            .gradientOption =
                                                        value!;
                                                        themeConfigureCtrl
                                                            .customThemeColorVisible = false;
                                                        themeConfigureCtrl
                                                            .update();
                                                      },
                                                    ),
                                                  )
                                                ],
                                              ).marginOnly(top: Insets.i20),
                                              const VSpace(Sizes.s20),
                                              Divider(color: appCtrl.appTheme.lightGray,),
                                                /*  HSpace(Insets.i10),
                                          DesktopSwitchCommon(
                                              width: double.infinity,
                                              title:
                                              fonts.gradientColorVisible.tr,
                                              value: themeConfigureCtrl
                                                  .gradientColorVisible,
                                              onChanged: (val) => {
                                                themeConfigureCtrl
                                                    .commonSwitcherValueChange(
                                                    1, val),
                                                themeConfigureCtrl
                                                    .commonSwitcherValueChange(
                                                    2, false),
                                                themeConfigureCtrl
                                                    .commonSwitcherValueChange(
                                                    3, false)
                                              }),
                                          HSpace(Insets.i10),
                                          DesktopSwitchCommon(
                                              width: double.infinity,
                                              title: fonts
                                                  .customThemeColorVisible.tr,
                                              value: themeConfigureCtrl
                                                  .customThemeColorVisible,
                                              onChanged: (val) => {
                                                themeConfigureCtrl
                                                    .commonSwitcherValueChange(
                                                    2, val),
                                                themeConfigureCtrl
                                                    .commonSwitcherValueChange(
                                                    3, false),
                                                themeConfigureCtrl
                                                    .commonSwitcherValueChange(
                                                    1, false)
                                              }),
                                          HSpace(Insets.i10),
                                          DesktopSwitchCommon(
                                              width: double.infinity,
                                              title: fonts
                                                  .customGradientColorVisible.tr,
                                              value: themeConfigureCtrl
                                                  .customGradientColorVisible,
                                              onChanged: (val) => {
                                                themeConfigureCtrl
                                                    .commonSwitcherValueChange(
                                                    3, val),
                                                themeConfigureCtrl
                                                    .commonSwitcherValueChange(
                                                    2, false),
                                                themeConfigureCtrl
                                                    .commonSwitcherValueChange(
                                                    1, false)
                                              })*/
                                              ]),
                                      ),
                                  const VSpace(Sizes.s10),
                                  themeConfigureCtrl.isGradientVisible ==false
                                      ? themeConfigureCtrl.solidColor
                                          ? SolidColorDialog(
                                              themeColor: themeColor)
                                          : const CustomThemeColorDialog()
                                      : themeConfigureCtrl.customThemeColorVisible
                                      ? GradientColorLayout(
                                      gradientColor: gradientColor)
                                      : const CustomGradientColorDialog(),
                                  /*  themeConfigureCtrl.customThemeColorVisible
                                      ? const CustomThemeColorDialog()
                                      : themeConfigureCtrl
                                              .customGradientColorVisible
                                          ? const CustomGradientColorDialog()
                                          : themeConfigureCtrl
                                                  .solidColor
                                              ? GradientColorLayout(
                                                  gradientColor: gradientColor)
                                              : SolidColorDialog(
                                                  themeColor: themeColor),*/


                                      const VSpace(Sizes.s20),
                                      Divider(color: appCtrl.appTheme.lightGray,),
                                      const VSpace(Sizes.s20),
                                  CommonButton(

                                      icon: themeConfigureCtrl.isLoading
                                          ? CircularProgressIndicator(
                                              color: appCtrl.appTheme.white)
                                          : Container(),
                                      onTap: () {
                                        themeConfigureCtrl.updateThemeData();
                                        // appConfigureCtrl.uploadAppConfiguartion();
                                      },width: Sizes.s200,margin: 0,
                                      title: fonts.update.tr,
                                      style: AppCss.outfitSemiBold14
                                          .textColor(appCtrl.appTheme.white))
                                ])).marginOnly(
                                top: Insets.i70,
                                left: Insets.i30,
                                bottom: Insets.i50),

                            CommonHeading(
                                    title: fonts.themeColor.tr,
                                    style: AppCss.outfitblack20
                                        .textColor(appCtrl.appTheme.primary))
                                .paddingOnly(left: Insets.i15)
                          ])
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
