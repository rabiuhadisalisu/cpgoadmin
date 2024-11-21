import 'package:goapp_admin/screens/headerConfig/leftIcon_Layout/index.dart';
import 'package:goapp_admin/screens/headerConfig/rightIcon_Layout/index.dart';
import '../../../config.dart';

class SelectedIndexBodyLayout extends StatelessWidget {
  const SelectedIndexBodyLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<IndexController>(builder: (indexCtrl) {
      return Expanded(
          child: SelectionArea(
              child: CustomScrollView(
                  shrinkWrap: true,
                  controller: indexCtrl.scrollController,
                  slivers: [
            SliverList(
                delegate: SliverChildListDelegate([
              Container(
                  color: appCtrl.appTheme.bg1,
                  padding: const EdgeInsets.symmetric(horizontal: Insets.i24),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        if (Responsive.isDesktop(context))
                          Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      if (indexCtrl.subSelectIndex == null)
                                        SelectableText(indexCtrl.pageName.tr,
                                            style: AppCss.outfitMedium18
                                                .textColor(appCtrl
                                                    .appTheme.blackColor)),
                                      if (indexCtrl.subSelectIndex != null)
                                        SelectableText(fonts.headerConfig.tr,
                                            style: AppCss.outfitMedium18
                                                .textColor(appCtrl
                                                    .appTheme.blackColor)),
                                      const VSpace(Sizes.s8),
                                      Row(children: [
                                        InkWell(
                                            mouseCursor:
                                                SystemMouseCursors.click,
                                            child: SelectableText(fonts.admin.tr,
                                                style: AppCss.outfitMedium14
                                                    .textColor( appCtrl
                                                        .appTheme.blackColor))),
                                        SelectableText('  /  ',
                                            style: AppCss.outfitMedium14
                                                .textColor(appCtrl
                                                    .appTheme.blackColor)),
                                        if (indexCtrl.subSelectIndex == null)
                                          SelectableText(
                                            indexCtrl.pageName.tr,
                                            style: AppCss.outfitMedium14
                                                .textColor(appCtrl
                                                    .appTheme.blackColor),
                                          ),
                                        if (indexCtrl.subSelectIndex != null)
                                          Row(
                                            children: [
                                              InkWell(
                                                  mouseCursor:
                                                      SystemMouseCursors.click,
                                                  child: SelectableText(
                                                      fonts.headerConfig.tr,
                                                      style: AppCss
                                                          .outfitMedium14
                                                          .textColor(appCtrl
                                                              .appTheme
                                                              .secondary1))),
                                              SelectableText('  /  ',
                                                  style: AppCss.outfitMedium14
                                                      .textColor(appCtrl
                                                          .appTheme
                                                          .blackColor)),
                                              SelectableText(
                                                indexCtrl.subSelectIndex == 0
                                                    ? fonts.leftIcon.tr
                                                    : fonts.rightIcon.tr,
                                                style: AppCss.outfitMedium14
                                                    .textColor(appCtrl
                                                        .appTheme.blackColor),
                                              )
                                            ],
                                          )
                                      ])
                                    ]),
                                GetBuilder<AppController>(builder: (context) {
                                  return CustomSnackBar(
                                      isAlert: appCtrl.isAlert);
                                })
                              ]).marginOnly(top: Insets.i20),
                        const VSpace(Sizes.s20),
                        if (indexCtrl.subSelectIndex == null)
                          indexCtrl.widgetOptions
                              .elementAt(indexCtrl.selectedIndex),
                        if (indexCtrl.subSelectIndex != null)
                          indexCtrl.subSelectIndex == 0
                              ? HeaderLeftIconConfig()
                              : HeaderRightIconConfig()
                      ]))
            ])),
            SliverFillRemaining(
                hasScrollBody: false,
                fillOverscroll: true,
                child: const Column(children: <Widget>[
                  Expanded(child: SizedBox.shrink())
                ]).backgroundColor(appCtrl.appTheme.bg1))
          ])));
    });
  }
}
