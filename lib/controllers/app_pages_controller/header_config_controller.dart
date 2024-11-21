import 'dart:developer';

import '../../config.dart';

enum BestTutorSite { javatpoint, w3schools }

class HeaderConfigController extends GetxController {
  var idType = "Left Icon", idType2 = "Right Icon";
  bool isLoading = false;
  String id = "";
  String selectedId = "",docId="";
  String selectedRightIcon = "";
  bool noAdsVisible = true;
  String selectedconfig = "LeftIcon";
  BestTutorSite site = BestTutorSite.javatpoint;
  List<QueryDocumentSnapshot<dynamic>> leftIconList = [],rightIconList =[];

  commonSwitcherValueChange(value) async {
    site = await value!;
    update();
  }

  getData() {
    FirebaseFirestore.instance
        .collection(collectionName.headerConfig)
        .snapshots()
        .listen((value) {
      value.docs.asMap().entries.forEach((element) {
        if (element.value.data()['Action']) {
          selectedId = value.docs[element.key].id;
        }
      });
      leftIconList = value.docs;
      update();
    });

    FirebaseFirestore.instance
        .collection(collectionName.headerRightIconConfig)
        .snapshots()
        .listen((value) {
      value.docs.asMap().entries.forEach((element) {
        if (element.value.data()['Action']) {
          selectedRightIcon = value.docs[element.key].id;
        }
      });
      rightIconList = value.docs;
    });
    update();
  }

  setData(id, value, index) async {
    bool isLoginTest = appCtrl.storage.read(session.isLoginTest) ?? false;
    if (isLoginTest) {
      accessDenied(fonts.modification.tr);
    } else {
    if (selectedId != "") {
      if (selectedId != id) {
        await FirebaseFirestore.instance
            .collection(collectionName.headerConfig)
            .doc(selectedId)
            .update({"Action": false, "Status": false}).then((value) {
          isLoading = false;
          update();
        });
      }
    }

    }
    await FirebaseFirestore.instance
        .collection(collectionName.headerConfig)
        .doc(id)
        .update({"Action": value, "Status": value}).then((value) async {
      selectedId = await id;
      update();
    });
    docId =id;
    update();

  }

  saveClick() async {
    bool isLoginTest = appCtrl.storage.read(session.isLoginTest) ?? false;
    if (isLoginTest) {
      accessDenied(fonts.modification.tr);
    } else {
      isLoading = true;
      update();
      await FirebaseFirestore.instance
          .collection(collectionName.headerConfig)
          .doc(docId)
          .update({"Action": true, "Status": true}).then((value) {
        isLoading = false;
        update();
      });
      getData();
    }
  }

  rightClick() async {
    bool isLoginTest = appCtrl.storage.read(session.isLoginTest) ?? false;
    if (isLoginTest) {
      accessDenied(fonts.modification.tr);
    } else {
      isLoading = true;
      update();
      await FirebaseFirestore.instance
          .collection(collectionName.headerRightIconConfig)
          .doc(docId)
          .update({"Action": true, "Status": true}).then((value) {
        isLoading = false;
        update();
      });
      getData();
    }
  }

  setRightIconData(id, value, index) async {
    bool isLoginTest = appCtrl.storage.read(session.isLoginTest) ?? false;
    if (isLoginTest) {
      accessDenied(fonts.modification.tr);
    } else {
      log("selectedRightIcon :$selectedRightIcon");
      if (selectedRightIcon != "") {
        if (selectedRightIcon != id) {
          await FirebaseFirestore.instance
              .collection(collectionName.headerRightIconConfig)
              .doc(selectedRightIcon)
              .update({"Action": false, "Status": false}).then((value) {
            isLoading = false;
            update();
          });
        }
        await FirebaseFirestore.instance
            .collection(collectionName.headerRightIconConfig)
            .doc(id)
            .update({"Action": value, "Status": value}).then((value) async {
          selectedRightIcon = id;
          update();
        });
        docId = id;
        update();
      }
    }

  }

  setColor(index, value) async {
    if (index == 1) {
      idType = await value;
    } else {
      idType2 = await value;
    }
    selectedconfig = await value;
    update();
  }

  updateAdsData() async {
    bool isLoginTest = appCtrl.storage.read(session.isLoginTest) ?? false;
    if (isLoginTest) {
      accessDenied(fonts.modification.tr);
    } else {
      isLoading = true;
      await FirebaseFirestore.instance
          .collection(collectionName.adsConfiguration)
          .doc(id)
          .update({}).then((value) {
        isLoading = false;
        update();
      });
    }
  }

  @override
  void onInit() {
    // TODO: implement onInit
    update();
    getData();
    super.onInit();
  }
}
