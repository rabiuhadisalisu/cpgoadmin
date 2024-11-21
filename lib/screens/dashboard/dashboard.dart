import 'dart:developer';

import 'package:goapp_admin/config.dart';

class Dashboard extends StatelessWidget {
  final dashboardCtrl = Get.put(DashboardController());
  Dashboard({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<DashboardController>(builder: (_) {
      log("MediaQuery.of(context).size.width :${MediaQuery.of(context).size.width}");
      return SizedBox(
          width: MediaQuery.of(context).size.width,
          child:
          GridView.builder(
              gridDelegate: Responsive.isMobile(context)
                  ? const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
                mainAxisExtent: 150,
              )
                  : MediaQuery.of(context).size.width < 1500
                  ? const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
                mainAxisExtent: 120,
              )
                  : const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 20,
                mainAxisSpacing: 10,
                mainAxisExtent: 120,
              ),
              itemCount: dashboardCtrl.listItem.length,
              shrinkWrap: true,
              padding: EdgeInsets.zero,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return DashboardBoxLayout(index: index).inkWell(
                  onTap: (){
                    final indexCtrl = Get.isRegistered<IndexController>()
                        ? Get.find<IndexController>()
                        : Get.put(IndexController());
                    if(index == 0){

                      indexCtrl.selectedIndex =7;
                      indexCtrl.pageName = fonts.loaderStyle.tr;
                      indexCtrl.update();
                    }else if(index ==1){
                      indexCtrl.selectedIndex =5;
                      indexCtrl.subSelectIndex = 0;
                      indexCtrl.pageName = fonts.leftIcon.tr;
                      indexCtrl.controller!.expand();
                      indexCtrl.update();
                    }else if(index ==2){
                      indexCtrl.selectedIndex =5;
                      indexCtrl.subSelectIndex = 1;
                      indexCtrl.pageName = fonts.rightIcon.tr;
                      indexCtrl.controller!.expand();
                      indexCtrl.update();

                    }
                  }
                );
              }));
    });
  }
}
