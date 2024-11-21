import 'dart:developer';
import 'package:goapp_admin/screens/auth_screen/login_screen/login_screen.dart';
import '../../../config.dart';
import 'package:universal_html/html.dart' as html;

class DrawerList extends StatelessWidget {
  final bool? value;
  final GlobalKey<ScaffoldState>? scaffoldKey;

  const DrawerList({Key? key, this.value, this.scaffoldKey}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<IndexController>(builder: (indexCtrl) {
      return Column(children: [
        ...appArray.drawerList.asMap().entries.map<Widget>((e) {
          if (e.value['children'] == null) {
            return MouseRegion(
                onHover: (val) {
                  indexCtrl.isHover = true;
                  indexCtrl.isSelectedHover = e.key;
                  indexCtrl.update();
                },
                onExit: (exit) {
                  indexCtrl.isHover = false;
                  indexCtrl.update();
                },
                child: Container(
                        alignment: Alignment.center,
                        padding: EdgeInsets.symmetric(
                            horizontal:
                                Responsive.isDesktop(context) && value == false
                                    ? 0
                                    : Insets.i15,
                            vertical: Insets.i8),
                        width: double.infinity,
                        child: Responsive.isDesktop(context) && value == false
                            ? Tooltip(
                                message: e.value["title"] != null
                                    ? e.value["title"].toString().tr
                                    : "",
                                child: SvgPicture.asset(
                                    e.value["icon"].toString()))
                            : Row(children: [
                                indexCtrl.isHover &&
                                        indexCtrl.isSelectedHover == e.key
                                    ? SvgPicture.asset(
                                        e.value["darkIcon"]!.toString(),
                                        height: Sizes.s18,
                                      )
                                    : SvgPicture.asset(
                                        indexCtrl.selectedIndex == e.key
                                            ? e.value["darkIcon"]!.toString()
                                            : appCtrl.isTheme
                                                ? e.value["darkIcon"]!
                                                    .toString()
                                                : e.value["icon"]!.toString(),
                                        colorFilter: ColorFilter.mode(
                                            appCtrl.appTheme.white,
                                            BlendMode.srcIn),
                                        height: Sizes.s18,
                                      ),
                                // SvgPicture.asset(appCtrl.isTheme
                                //     ? e.value["darkIcon"]!.toString()
                                //     : e.value["icon"]!.toString()),
                                const HSpace(Sizes.s20),
                                Responsive.isDesktop(context) && value == false
                                    ? Container()
                                    : Expanded(
                                        child: Text(
                                            e.value["title"] != null
                                                ? e.value["title"].toString().tr
                                                : "",
                                            style: AppCss.outfitMedium13
                                                .textColor(
                                                    appCtrl.appTheme.white)
                                                .letterSpace(.8)),
                                      )
                              ]))
                    .inkWell(onTap: () {
                      indexCtrl.pageName = e.value["title"]!.toString();
                      indexCtrl.subSelectIndex = null;
                      indexCtrl.selectedIndex = e.key;
                      if (!Responsive.isDesktop(context)) {
                        Get.back();
                      }
                      if (e.value["title"] == "logout") {
                        FirebaseAuth.instance.signOut();
                        indexCtrl.selectedIndex = 0;
                        html.window.localStorage[session.isLogin] = "false";
                        appCtrl.isLogged = false;
                        appCtrl.storage.remove("isSignIn");
                        appCtrl.storage.remove(session.isDarkMode);
                        appCtrl.storage.remove(session.languageCode);
                        log("index: ${indexCtrl.selectedIndex}");
                        Get.offAll(() => LoginScreen());
                      }
                      indexCtrl.update();
                    })
                    .decorated(
                        borderRadius: const BorderRadius.all(
                            Radius.circular(AppRadius.r6)),
                        color: Responsive.isDesktop(context) && value == false
                            ? appCtrl.appTheme.transparentColor
                            : indexCtrl.selectedIndex == e.key
                                ? appCtrl.appTheme.primary
                                : indexCtrl.isHover &&
                                        indexCtrl.isSelectedHover == e.key
                                    ? appCtrl.appTheme.primary
                                    : appCtrl.appTheme.secondary1)
                    .paddingSymmetric(
                        horizontal: Insets.i15, vertical: Insets.i10));
          } else {
            List children = e.value["children"]! as List;
            return MouseRegion(
              onHover: (val) {
                indexCtrl.isHover = true;
                indexCtrl.isSelectedHover = e.key;
                indexCtrl.update();
              },
              onExit: (exit) {
                indexCtrl.isHover = false;
                indexCtrl.update();
              },
              child: Card(
                  color: indexCtrl.isSelectedHover == e.key
                      ? appCtrl.appTheme.primary
                      : appCtrl.appTheme.secondary1,
                  elevation: 0.0,
                  margin: EdgeInsets.symmetric(
                      horizontal:
                          Responsive.isDesktop(context) && value == false
                              ? 0
                              : Insets.i15,
                      vertical: Insets.i5),
                  clipBehavior: Clip.antiAlias,
                  child: ExpansionTile(
                    collapsedIconColor: appCtrl.appTheme.white,
                    textColor: appCtrl.appTheme.white,
                    collapsedTextColor: appCtrl.appTheme.txt,
                    iconColor: appCtrl.appTheme.drawerTextColor,
                    backgroundColor: appCtrl.appTheme.secondary1,
                    childrenPadding: EdgeInsets.zero,
                    title: Responsive.isDesktop(context) && value == false
                        ? SvgPicture.asset(e.value["icon"]!.toString())
                        : Row(children: [
                            indexCtrl.isHover &&
                                    indexCtrl.isSelectedHover == e.key
                                ? SvgPicture.asset(
                                    e.value["darkIcon"]!.toString(),
                                    height: Sizes.s18,
                                  )
                                : SvgPicture.asset(
                                    appCtrl.isTheme
                                        ? e.value["darkIcon"]!.toString()
                                        : e.value["icon"]!.toString(),
                                    height: Sizes.s22,
                                    colorFilter: ColorFilter.mode(
                                        appCtrl.appTheme.white,
                                        BlendMode.srcIn),
                                  ),
                            const HSpace(Sizes.s20),
                            Responsive.isDesktop(context) && value == false
                                ? Container()
                                : Expanded(
                                    child: Text(
                                        e.value["title"] != null
                                            ? e.value["title"].toString().tr
                                            : "",
                                        style: AppCss.outfitMedium13
                                            .textColor(appCtrl.appTheme.white)
                                            .letterSpace(.8)),
                                  )
                          ]),
                    children: children.asMap().entries.map<Widget>((childMenu) {
                      return Card(
                        color: Colors.transparent,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(AppRadius.r8)),
                        elevation: 0.0,
                        margin:
                            const EdgeInsets.symmetric(horizontal: Insets.i20),
                        clipBehavior: Clip.antiAlias,
                        child: ListTile(
                          dense: true,
                          contentPadding: EdgeInsets.symmetric(
                              horizontal:
                                  Responsive.isDesktop(context) && value == true
                                      ? Insets.i15
                                      : 0),
                          title: Row(children: [
                            SvgPicture.asset(
                              appCtrl.isTheme
                                  ? childMenu.value["darkIcon"]!.toString()
                                  : childMenu.value["icon"]!.toString(),
                              height: Sizes.s22,
                            ),
                            if (Responsive.isDesktop(context) && value == true)
                              const HSpace(Sizes.s20),
                            Responsive.isDesktop(context) && value == false
                                ? Container()
                                : Expanded(
                                    child: Text(
                                        childMenu.value["title"] != null
                                            ? childMenu.value["title"]
                                                .toString()
                                                .tr
                                            : "",
                                        style: indexCtrl.subSelectIndex ==
                                                childMenu.key
                                            ? AppCss.outfitMedium13.textColor(
                                                appCtrl.appTheme.white)
                                            : AppCss.outfitMedium13
                                                .textColor(appCtrl
                                                    .appTheme.drawerTextColor)
                                                .letterSpace(.8)),
                                  )
                          ]),
                          onTap: () {
                            indexCtrl.pageName = e.value["title"]!.toString();
                            indexCtrl.selectedIndex = e.key;
                            if (childMenu.key == 0) {
                              indexCtrl.subSelectIndex = childMenu.key;
                            } else {
                              indexCtrl.subSelectIndex = childMenu.key;
                            }
                            if (!Responsive.isDesktop(context)) {
                              Get.back();
                            }
                            indexCtrl.update();
                          },
                          selected: indexCtrl.subSelectIndex == childMenu.key,
                          textColor: appCtrl.appTheme.white,
                          hoverColor: appCtrl.appTheme.primaryLight,
                        )
                            .decorated(
                                color: indexCtrl.subSelectIndex == childMenu.key
                                    ? appCtrl.appTheme.primary
                                    : appCtrl.appTheme.secondary1)
                            .paddingSymmetric(vertical: Sizes.s5),
                      );
                    }).toList(growable: false),
                    onExpansionChanged: (bool expanded) {},
                  )),
            );
          }
        }).toList()
      ]);
    });
  }
}
