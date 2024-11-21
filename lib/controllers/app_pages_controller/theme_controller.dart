import 'dart:math';
import '../../config.dart';

class ThemeColorController extends GetxController {
  String idType1 = "", idType2 = "",solidOption ="default",gradientOption ="defaultGradient";
  bool isLoading = false;
  var random = Random();
  String id = "";
  Color primaryLightColor = appCtrl.appTheme.primary;
  Color gradientColor1 = appCtrl.appTheme.primary;
  Color gradientColor2 = appCtrl.appTheme.primary;
  List<Color> currentColors = [Colors.yellow, Colors.green];
  List<Color> colorHistory = [];
  bool isGradientVisible = false;
  bool solidColor = true,customThemeColorVisible = true;

  bool
      customGradientColorVisible = false,
      solidGradientColor = false;

  setColor(index, color) async {
    if (index == 1) {
      primaryLightColor = await color;
    } else if (index == 2) {
      gradientColor1 = await color;
    } else {
      gradientColor2 = await color;
    }
    update();
  }

  colorToHexString(Color color) {
    return '#${color.value.toRadixString(16).substring(2, 8)}';
  }

  commonSwitcherValueChange( value,title) async {
    /*  if (index == 1) {
      gradientColorVisible = value;
    } else if (index == 2) {
      customThemeColorVisible = value;
    } else if (index == 3) {
      customGradientColorVisible = value;
    }*/
title = value;
    update();
  }


  isGradientSwitch( value) async {

    isGradientVisible = value;
    if(isGradientVisible == true){
      gradientOption = "defaultGradient";
      update();
    }else{
      solidOption = "default";
    }
    update();

    Get.forceAppUpdate();


  }

  getData() {
    FirebaseFirestore.instance
        .collection(collectionName.themeColor)
        .get()
        .then((value) {
      value.docs.asMap().entries.forEach((element) async {
        id = value.docs[0].id;
        var themeColor = value.docs[0].data();
        if (value.docs.isNotEmpty) {
          primaryLightColor =
              hexStringToColor(themeColor['selectedThemeColor']);
          gradientColor1 =
              await hexStringToColor(themeColor['selectedGradientColor1']);
          gradientColor2 =
              await hexStringToColor(themeColor['selectedGradientColor2']);
          isGradientVisible = themeColor['isGradientVisible'];
        /*  customThemeColorVisible = themeColor['customThemeColorVisible'];
          customGradientColorVisible = themeColor['customGradientColorVisible'];*/
          update();
        }
      });
    });
    update();
  }

  hexStringToColor(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF$hexColor";
    }
    return Color(int.parse(hexColor, radix: 16));
  }

  updateThemeData() async {
    bool isLoginTest = appCtrl.storage.read(session.isLoginTest) ?? false;
    if (isLoginTest) {
      accessDenied(fonts.modification.tr);
    } else {
      isLoading = true;
      await FirebaseFirestore.instance
          .collection(collectionName.themeColor)
          .doc(id)
          .update({
        fonts.customGradientColorVisible: customGradientColorVisible,
        fonts.customThemeColorVisible: customThemeColorVisible,
        fonts.gradientColorVisible: solidColor,
        fonts.selectedThemeColor: colorToHexString(primaryLightColor),
        fonts.selectedGradientColor1: colorToHexString(gradientColor1),
        fonts.selectedGradientColor2: colorToHexString(gradientColor2),
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
