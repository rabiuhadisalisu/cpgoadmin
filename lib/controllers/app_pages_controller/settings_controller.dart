import 'dart:math';
import '../../config.dart';

class SettingController extends GetxController {
  String idType = "", productIdType = "";
  bool isLoading = false,showLoading=true;
  var random = Random();
  String id = "";
  TextEditingController fontSizeCtrl = TextEditingController();
  Color loaderColor = appCtrl.appTheme.primary;
  List<Color> colorHistory = [];
  String loaderName = "";
  TextEditingController txtFontSize = TextEditingController();

  setFontSize(value) async {
    txtFontSize = await value;
    update();
  }

  setColor(color) async {
    bool isLoginTest = appCtrl.storage.read(session.isLoginTest) ?? false;
    if (isLoginTest) {
      accessDenied(fonts.modification.tr);
    } else {
      loaderColor = await color;
      update();
    }
  }

  saveBanner(titleId) async {
    loaderName = titleId;
    update();
  }

  colorToHexString(Color color) {
    return '#${color.value.toRadixString(16).substring(2, 8)}';
  }

  hexStringToColor(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF$hexColor";
    }
    return Color(int.parse(hexColor, radix: 16));
  }

  getData() {
    // idType = [];
    FirebaseFirestore.instance
        .collection(collectionName.config)
        .get()
        .then((value) {
      value.docs.asMap().entries.forEach((element) {
        if (value.docs.isNotEmpty) {
          id = value.docs[0].id;
          var settingCtrl = value.docs[0].data();
          txtFontSize.text = settingCtrl["fontSize"] ?? "";
          loaderColor = hexStringToColor(settingCtrl["loaderColor"]) ??
              appCtrl.appTheme.primary;
          idType = settingCtrl["loaderStyle"] ?? "";
          showLoading = settingCtrl["showLoader"] ?? true;
        }
      });
    });
    update();
    // return banner;
  }


  commonSwitcherValueChange(value,) async {
    bool isLoginTest = appCtrl.storage.read(session.isLoginTest) ?? false;
    if (isLoginTest) {
      accessDenied(fonts.modification.tr);
    } else {
      showLoading = value;
      update();
      isLoading = true;
      await FirebaseFirestore.instance
          .collection(collectionName.config)
          .doc(id)
          .update({
        "showLoader": value,
      }).then((value) {
        isLoading = false;
        update();
        getData();
      });
      update();
    }
  }


  updateSettingData() async {
    bool isLoginTest = appCtrl.storage.read(session.isLoginTest) ?? false;
    if (isLoginTest) {
      accessDenied(fonts.modification.tr);
    } else {
      isLoading = true;
      await FirebaseFirestore.instance
          .collection(collectionName.config)
          .doc(id)
          .update({
        fonts.fontSize: txtFontSize.text,
        fonts.loaderColor: colorToHexString(loaderColor),
        fonts.loaderStyle: idType
      }).then((value) {
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
