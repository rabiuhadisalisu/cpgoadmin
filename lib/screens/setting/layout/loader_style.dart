import 'dart:developer';

import '../../../config.dart';

class LoaderStyleDialog extends StatelessWidget {
  const LoaderStyleDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SettingController>(
      builder: (settingsCtrl) {
        return StreamBuilder(
          stream: FirebaseFirestore.instance.collection("loaderConfig").snapshots(),
          builder: (context,snap) {
            if(snap.hasData){
              if(snap.data != null && snap.data!.docs.isNotEmpty){
                return LayoutBuilder(
                  builder: (context, constraints) {
                    if (Responsive.isDesktop(context)) {
                      return GridView.builder(
                        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                          maxCrossAxisExtent: Sizes.s300,
                          crossAxisSpacing: Sizes.s30,
                          mainAxisSpacing: Sizes.s30,
                          mainAxisExtent: Sizes.s160,
                        ),
                        itemCount: snap.data!.docs.length,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () => {
                              settingsCtrl.idType = snap.data!.docs[index].data()['gif'],
                              settingsCtrl.update()
                             /* settingsCtrl.idType =
                                  AnimationLayout().listOfAnimations[index].title,
                              settingsCtrl.saveBanner(
                                  AnimationLayout().listOfAnimations[index].title),
                              settingsCtrl.update()*/
                            },
                            child: Container(
                              padding: const EdgeInsets.all(Insets.i10),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(8),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.3),
                                    blurRadius: 10,
                                    offset: const Offset(1, 1), // Shadow position
                                  ),
                                ],
                              ),
                              child: Stack(
                                alignment: Alignment.topCenter,
                                children: [
                                  RadioListTile(
                                    contentPadding: EdgeInsets.zero,

                                    value:
                                    snap.data!.docs[index].data()['gif'],
                                    groupValue: settingsCtrl.idType,
                                    activeColor: appCtrl.appTheme.primary,
                                    onChanged: (value) {
                                      settingsCtrl.idType = value;
                                      settingsCtrl.update();
                                      log("SJHDG :${settingsCtrl.idType}");
                                     /* settingsCtrl.idType = value!;
                                      settingsCtrl.saveBanner(AnimationLayout()
                                          .listOfAnimations[index]
                                          .title);
                                      settingsCtrl.update();*/
                                    },
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Expanded(
                                        child: Center(
                                          child: Image.network(snap.data!.docs[index].data()['gif'],color: settingsCtrl.loaderColor,height: Sizes.s60,fit: BoxFit.cover,),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    } else {
                      return GridView.builder(
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisSpacing: Sizes.s30,
                          mainAxisSpacing: Sizes.s30,
                          mainAxisExtent: Sizes.s160,
                          crossAxisCount: 1,
                        ),
                        itemCount: snap.data!.docs.length,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () => {

                            },
                            child: Container(
                              padding: const EdgeInsets.all(Insets.i10),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(8),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.3),
                                    blurRadius: 10,
                                    offset: const Offset(1, 1), // Shadow position
                                  ),
                                ],
                              ),
                              child: Stack(
                                alignment: Alignment.topCenter,
                                children: [
                                  RadioListTile(
                                    contentPadding: EdgeInsets.zero,
                                    value:
                                    snap.data!.docs[index].data()['gif'],
                                    groupValue: settingsCtrl.loaderName,
                                    activeColor: appCtrl.appTheme.primary,
                                    onChanged: (value) {
                                      settingsCtrl.idType = snap.data!.docs[index].data()['gif'];
                                      settingsCtrl.update();
                                    },
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Center(
                                        child: Image.network(snap.data!.docs[index].data()['gif'],color: settingsCtrl.loaderColor,height: Sizes.s60,fit: BoxFit.cover,),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    }
                  },
                );

              /*  return LayoutBuilder(
                  builder: (context, constraints) {
                    if (Responsive.isDesktop(context)) {
                      return GridView.builder(
                        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                          maxCrossAxisExtent: Sizes.s300,
                          crossAxisSpacing: Sizes.s30,
                          mainAxisSpacing: Sizes.s30,
                          mainAxisExtent: Sizes.s160,
                        ),
                        itemCount: snap.data!.docs.length,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () => {
                              settingsCtrl.idType =
                              snap.data!.docs[index].data()['title'],
                              settingsCtrl.saveBanner(
                                  snap.data!.docs[index].data()['title']),
                              settingsCtrl.update()
                            },
                            child: Container(
                              padding: const EdgeInsets.all(Insets.i10),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(8),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.3),
                                    blurRadius: 10,
                                    offset: const Offset(1, 1), // Shadow position
                                  ),
                                ],
                              ),
                              child: Stack(
                                alignment: Alignment.topCenter,
                                children: [
                                  RadioListTile(
                                    contentPadding: EdgeInsets.zero,
                                    value:
                                    snap.data!.docs[index].data()['title'],
                                    groupValue: settingsCtrl.loaderName,
                                    activeColor: appCtrl.appTheme.primary,
                                    onChanged: (value) {
                                      settingsCtrl.idType = value!;
                                      snap.data!.docs[index].data()['title'];
                                      settingsCtrl.update();
                                    },
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        snap.data!.docs[index].data()['title'],
                                        style: const TextStyle(
                                          fontSize: FontSizes.f18,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ).marginOnly(top: Sizes.s12),
                                      Expanded(
                                        child: Center(
                                            child: Image.network(Image.network(snap.data!.docs[index].data()['gif'],color: settingsCtrl.loaderColor,height: Sizes.s60,width: Sizes.s80,fit: BoxFit.fill,),heightidth: Sizes.cover0,)
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    } else {
                      return GridView.builder(
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisSpacing: Sizes.s30,
                          mainAxisSpacing: Sizes.s30,
                          mainAxisExtent: Sizes.s160,
                          crossAxisCount: 1,
                        ),
                        itemCount: snap.data!.docs.length,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () => {
                              settingsCtrl.idType =
                              snap.data!.docs[index].data()['title'],
                              settingsCtrl.saveBanner(
                                  snap.data!.docs[index].data()['title']),
                              settingsCtrl.update()
                            },
                            child: Container(
                              padding: const EdgeInsets.all(Insets.i10),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(8),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.3),
                                    blurRadius: 10,
                                    offset: const Offset(1, 1), // Shadow position
                                  ),
                                ],
                              ),
                              child: Stack(
                                alignment: Alignment.topCenter,
                                children: [
                                  RadioListTile(
                                    contentPadding: EdgeInsets.zero,
                                    value:
                                    snap.data!.docs[index].data()['title'],
                                    groupValue: settingsCtrl.loaderName,
                                    activeColor: appCtrl.appTheme.primary,
                                    onChanged: (value) {
                                      settingsCtrl.idType = value!;
                                      settingsCtrl.saveBanner(snap.data!.docs[index].data()['title']);
                                      settingsCtrl.update();
                                    },
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        snap.data!.docs[index].data()['title'],
                                        style: const TextStyle(
                                          fontSize: FontSizes.f18,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ).marginOnly(top: Sizes.s12),
                                      Center(
                                        child: Image.network(Image.network(snap.data!.docs[index].data()['gif'],color: settingsCtrl.loaderColor,height: Sizes.s60,width:  BoxFit.fillcover)),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    }
                  },
                );*/
              }else{
                return Container();
              }
            }else{
              return Container();
            }

          }
        );
      },
    );
  }
}
