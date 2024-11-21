import '../../../../config.dart';

class OnBoardingListVariant extends StatelessWidget {
  const OnBoardingListVariant({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<VariantOnBoardingController>(
        builder: (variantOnBoardingCtrl) {
      return Stack(alignment: Alignment.center, children: [
        StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection(collectionName.onBoardScreenConfiguration)
                .snapshots(),
            builder: (context, AsyncSnapshot snapShot) {
              if (snapShot.hasData) {
                var data = snapShot.data!;
                return Column(children: [
                  GestureDetector(
                      onTap: () {
                        variantOnBoardingCtrl.isListLayout = false;
                        variantOnBoardingCtrl.update();
                      },
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Icon(Icons.add, color: appCtrl.appTheme.primary),
                            Text(fonts.addNew.tr,
                                    style: AppCss.outfitMedium18.textColor(
                                        appCtrl.isTheme
                                            ? appCtrl.appTheme.white
                                            : appCtrl.appTheme.primary))
                                .marginOnly(right: Insets.i50)
                          ])),
                  const VSpace(Sizes.s20),
                  Responsive.isDesktop(context)
                      ? OnBoardingListTable(children: [
                          OnBoardingWidgetClass().tableWidget(),
                          for (var i = 0; i < data.docs.length; i++)
                            TableRow(
                                decoration: BoxDecoration(
                                    border: Border(
                                        bottom: BorderSide(
                                            color: appCtrl.appTheme.primary))),
                                children: [
                                  Image.network(
                                    data.docs[i]["logo"]!,
                                    width: Sizes.s140,
                                    height: Sizes.s140,
                                  ).paddingAll(Responsive.isDesktop(context)
                                      ? Insets.i20
                                      : Insets.i1),
                                  CommonWidgetClass().commonTitleTextLayout(
                                      data.docs[i]["title"], context),
                                  CommonWidgetClass().commonTitleTextLayout(
                                      data.docs[i]["description"], context)
                                ])
                        ])
                      : SizedBox(
                          width: double.infinity,
                          height: MediaQuery.of(context).size.height,
                          child: ListView.builder(
                              itemCount: data.docs.length,
                              itemBuilder: (context, index) {
                                return Container(
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: appCtrl.appTheme.primary),
                                        borderRadius: BorderRadius.vertical(
                                            top: Radius.circular(
                                                index == 0 ? 8 : 0),
                                            bottom: Radius.circular(
                                                index == data.docs.length - 1
                                                    ? 8
                                                    : 0))),
                                    child: Row(children: [
                                      SizedBox(
                                          width: Sizes.s140,
                                          height: Sizes.s140,
                                          child: Image.network(
                                                  data.docs[index]["logo"]!,
                                                  width: Sizes.s140,
                                                  height: Sizes.s140)
                                              .paddingAll(
                                                  Responsive.isDesktop(context)
                                                      ? Insets.i20
                                                      : Insets.i1)),
                                      Expanded(
                                        child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              CommonWidgetClass()
                                                  .commonTitleTextLayout(
                                                      data.docs[index]
                                                          ["title"],
                                                      context),
                                              const VSpace(Insets.i10),
                                              CommonWidgetClass()
                                                  .commonTitleTextLayout(
                                                      data.docs[index]
                                                          ["description"],
                                                      context)
                                            ]),
                                      )
                                    ]));
                              }))
                ]);
              } else {
                return Container();
              }
            })
      ]);
    });
  }
}
