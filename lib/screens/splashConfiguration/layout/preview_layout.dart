import '../../../config.dart';

class PreviewLayout extends StatelessWidget {
  const PreviewLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<VariantController>(builder: (variantCtrl) {
      return Stack(alignment: Alignment.center, children: [
        Form(
            child: StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection(collectionName.splashConfiguration)
                    .snapshots(),
                builder: (context, snapShot) {
                  if (snapShot.hasData) {
                    FirebaseConfigModel config = FirebaseConfigModel.fromJson(
                        snapShot.data!.docs[0].data());
                    return Container(
                      height: MediaQuery.of(context).size.height / 1.6,
                      width: Sizes.s350,
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              colors: [
                            variantCtrl.firstColor,
                            variantCtrl.secondColor,
                          ],
                              stops: const [
                            0.0,
                            1.0
                          ],
                              begin: FractionalOffset.topCenter,
                              end: FractionalOffset.bottomCenter,
                              tileMode: TileMode.repeated)),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            variantCtrl.imageUrl != ""
                                ? Image.memory(variantCtrl.webImage,
                                    width: double.tryParse(
                                            variantCtrl.txtHeight.text) ??
                                        Sizes.s50,
                                    height: double.tryParse(
                                            variantCtrl.txtWidth.text) ??
                                        Sizes.s50)
                                : Image.network(
                                    config.splashLogo!,
                                    width: double.tryParse(
                                            variantCtrl.txtHeight.text) ??
                                        Sizes.s50,
                                    height: double.tryParse(
                                            variantCtrl.txtWidth.text) ??
                                        Sizes.s50,
                                  ),
                            variantCtrl.titleVisible
                                ? Text(variantCtrl.txtSplashTitle.text,
                                    style: AppCss.outfitMedium20
                                        .textColor(variantCtrl.titleColor))
                                : Container()
                          ]),
                    );
                  } else {
                    return Container();
                  }
                }))
      ]);
    });
  }
}
