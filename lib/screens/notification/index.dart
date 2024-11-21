import 'package:intl/intl.dart';

import '../../config.dart';

class NotificationPage extends StatelessWidget {
  final notificationCtrl = Get.put(NotificationController());

  NotificationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<NotificationController>(builder: (_) {
      return IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Container(

                  decoration: BoxDecoration(
                      color: appCtrl.appTheme.whiteColor,
                      boxShadow:  [BoxShadow(blurRadius: 10,color: appCtrl.appTheme.gray.withOpacity(.5),spreadRadius: 2)],
                      borderRadius: BorderRadius.circular(20)
                  ),

                child: const DesktopNotificationLayout()

              )

            ),
            const HSpace(Sizes.s20),
            Expanded(child: Container(

             decoration: BoxDecoration(
                 color: appCtrl.appTheme.whiteColor,
                 boxShadow:  [BoxShadow(blurRadius: 10,color: appCtrl.appTheme.gray.withOpacity(.5),spreadRadius: 2)],
               borderRadius: BorderRadius.circular(10)
             ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(fonts.notificationList.tr,style: AppCss.outfitBold16.textColor(appCtrl.appTheme.dark),),
                  const VSpace(Sizes.s20),
                  StreamBuilder(
                      stream:
                      FirebaseFirestore.instance.collection("notification").snapshots(),
                      builder: (context, snap) {
                        if (snap.hasData) {
                          if (snap.data!.docs.isNotEmpty) {
                            return Column(
                              children: [
                                ...snap.data!.docs.asMap().entries.map((element) {
                                  return Card(
                                      color: appCtrl.appTheme.white,
                                      child: Row(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Expanded(
                                            child: Row(
                                              children: [
                                                if(element.value['image'] != null && element.value['image'] != "")
                                                  Image.network(element.value.data()['image'],height: Sizes.s50,width: Sizes.s50,),
                                                Expanded(
                                                  child: Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                    children: [
                                                      Text(element.value['title'],style: AppCss.outfitBold16.textColor(appCtrl.appTheme.dark)),
                                                      const VSpace(Sizes.s5),
                                                      Text(element.value['des'],style: AppCss.outfitMedium16.textColor(appCtrl.appTheme.gray)),
                                                                                              
                                                                                              
                                                                                              
                                                    ],
                                                  ).paddingSymmetric(horizontal: Insets.i20,vertical: Insets.i10),
                                                ),
                                              ],
                                            ),
                                          ),
                                          if(element.value['createdDate'] != null && element.value['createdDate'] != "")
                                          Text(  DateFormat('hh:mm a').format(
                                              DateTime
                                                  .fromMillisecondsSinceEpoch(
                                                  int.parse(element.value["createdDate"].toString()
                                                      .toString()))),style: AppCss.outfitMedium14.textColor(appCtrl.appTheme.gray),),
                                        ],
                                      ).paddingSymmetric(horizontal: Insets.i20,vertical: Insets.i10),
                                  ).paddingSymmetric(vertical: Insets.i5);
                                })
                              ],
                            );
                          } else {
                            return Container();
                          }
                        } else {
                          return Container();
                        }
                      })
                      .paddingSymmetric(vertical: Insets.i20)
                ]
              ).paddingAll( Insets.i20)
            ))
          ]
        )
      );
    });
  }
}
