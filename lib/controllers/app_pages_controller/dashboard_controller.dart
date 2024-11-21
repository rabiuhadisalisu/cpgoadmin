import 'dart:async';
import 'dart:developer';

import '../../config.dart';

class DashboardController extends GetxController {
  int totalUser = 0;

  int totalUserSubscribe = 0;
  int totalCharacter = 0;
  int audioCall = 0;

  @override
  void onReady() async {

    FirebaseFirestore.instance.collection("loaderConfig").get().then((value) {
      log("DATA : ${value.docs.length}");
      totalUser = value.docs.length;
      update();
    });

    FirebaseFirestore.instance.collection("headerConfig").get().then((value) {
      log("DATA : ${value.docs.length}");
      totalUserSubscribe = value.docs.length;
      update();
    });

    FirebaseFirestore.instance.collection("headerRightIconConfig").get().then((value) {
      log("DATA : ${value.docs.length}");
      totalCharacter = value.docs.length;
      update();
    });

    const oneSec = Duration(seconds: 1);
    Timer.periodic(oneSec, (Timer t) async {
      progressValue += 0.1;
      // we "finish" downloading here
      if (progressValue.toStringAsFixed(1) == '1.0') {
        loading = false;
        t.cancel();
        return;
      }
    });

    update();

    // TODO: implement onReady
    super.onReady();
  }

  bool loading = true;
  double progressValue = 0;

  final List<Map<String, dynamic>> listItem = [
    {'title': "progressStyle", 'icon': svgAssets.people},
    {'title': 'totalLeftIcon', 'icon': svgAssets.crown},
    {'title': 'totalRightIcon', 'icon': svgAssets.android},
  ];
}
