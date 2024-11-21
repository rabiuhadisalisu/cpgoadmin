import '../../../config.dart';

class HeaderRightIconConfig extends StatelessWidget {
  final headerConfigCtrl = Get.put(HeaderConfigController());

  HeaderRightIconConfig({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HeaderConfigController>(builder: (_) {
      return Stack(alignment: Alignment.center, children: [
        Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Stack(children: [
                SizedBox(
                    child: Column(
                        crossAxisAlignment:
                        CrossAxisAlignment.start,
                        children: [
                          HeaderConfigListTable(children: [
                            HeaderConfigWidgetClass().tableWidget(),
                            ...headerConfigCtrl.rightIconList
                                .asMap()
                                .entries
                                .map((e) {
                              var id = e.value.id;
                              return TableRow(
                                  decoration: BoxDecoration(
                                      border: Border(
                                          left: BorderSide(
                                              color: appCtrl
                                                  .appTheme.primary),
                                          bottom: BorderSide(
                                              color: appCtrl
                                                  .appTheme.primary))),
                                  children: [
                                    CommonWidgetClass()
                                        .commonTableIconTitleTextLayout(
                                        e.value.data()["title"],context),
                                    Image.network(
                                      e.value.data()["Image"]!,
                                      color: Colors.amber,
                                      width: Sizes.s140,
                                      height: Sizes.s100,
                                    ),
                                    Center(
                                        child: Switch(
                                            activeColor: appCtrl
                                                .appTheme.primary,
                                            materialTapTargetSize:
                                            MaterialTapTargetSize
                                                .shrinkWrap,
                                            value: e.value
                                                .data()["Action"],
                                            onChanged: (val) =>
                                                headerConfigCtrl.setRightIconData(
                                                    id,
                                                    true,e.key)).marginOnly(
                                            top: Insets.i20))
                                  ]);
                            }).toList()
                          ]),
                        ])).marginOnly(
                    top: Insets.i70,
                    left: Insets.i30,
                    bottom: Insets.i50),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SelectableText(fonts.rightIcon.tr,
                        textAlign: TextAlign.center,
                        style: AppCss.outfitblack20
                            .textColor(appCtrl.appTheme.primary)),
                    CommonButton(title: fonts.save.tr,
                      icon: headerConfigCtrl.isLoading
                          ? CircularProgressIndicator(
                          color: appCtrl.appTheme.white)
                          : null,
                      style: AppCss.outfitMedium14.textColor(
                          appCtrl.appTheme.white),
                      width: Sizes.s80,
                      onTap: () => headerConfigCtrl.rightClick(),)
                  ],
                ).padding(horizontal: Insets.i35,top: Insets.i20)

              ])
            ])
            .paddingSymmetric(
            horizontal: Insets.i20, vertical: Insets.i10)
            .boxExtension()
      ]);
    });
  }
}