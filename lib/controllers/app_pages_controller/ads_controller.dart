import '../../config.dart';

class AdsController extends GetxController {
  bool isLoading = false;
  String id = "";
  bool noAdsVisible = true,
      googleAdsVisible = false,
      facebookAdsVisible = false;

  TextEditingController txtAdsBannerAndroid = TextEditingController();
  TextEditingController txtAdsBannerIos = TextEditingController();
  TextEditingController txtAdsInterstitialAndroid = TextEditingController();
  TextEditingController txtAdsInterstitialIos = TextEditingController();

  TextEditingController txtFacebookBannerAndroid = TextEditingController();
  TextEditingController txtFacebookBannerIos = TextEditingController();
  TextEditingController txtFacebookInterstitialAndroid =
      TextEditingController();
  TextEditingController txtFacebookInterstitialIos = TextEditingController();

  commonSwitcherValueChange(value, {font}) async {
    /*  if (index == 1) {
      noAdsVisible = value;
    } else if (index == 2) {
      googleAdsVisible = value;
    } else if (index == 3) {
      facebookAdsVisible = value;
    }*/
    bool isLoginTest = appCtrl.storage.read(session.isLoginTest) ?? false;
    if (isLoginTest) {
      accessDenied(fonts.modification.tr);
    } else {
      isLoading = true;
      await FirebaseFirestore.instance
          .collection(collectionName.adsConfiguration)
          .doc(id)
          .update({
        font: value,
        if (font == fonts.isAdVisible)
          if (value == false) fonts.googleAdsVisible: false,
        if (font == fonts.isAdVisible)
          if (value == false) fonts.facebookAdsVisible: false,
        if (font == fonts.googleAdsVisible)
          if (facebookAdsVisible == true) fonts.facebookAdsVisible: false,
        if (font == fonts.facebookAdsVisible)
          if (googleAdsVisible == true) fonts.googleAdsVisible: false,
      }).then((value) {
        isLoading = false;
        update();
        getData();
      });
      update();
    }
  }

  getData() {
    FirebaseFirestore.instance
        .collection(collectionName.adsConfiguration)
        .get()
        .then((value) {
      value.docs.asMap().entries.forEach((element) {
        if (value.docs.isNotEmpty) {
          id = value.docs[0].id;
          var adsCtrl = value.docs[0].data();
          googleAdsVisible = adsCtrl["googleAdsVisible"] ?? "";
          facebookAdsVisible = adsCtrl["facebookAdsVisible"] ?? "";
          txtAdsBannerAndroid.text = adsCtrl["adMobBannerAndroid"] ?? "";
          txtAdsBannerIos.text = adsCtrl["adMobBanneriOS"] ?? "";
          txtAdsInterstitialAndroid.text =
              adsCtrl["admobInterstitialAndroid"] ?? "";
          txtAdsInterstitialIos.text = adsCtrl["admobInterstitialiOS"] ?? "";
          txtFacebookBannerAndroid.text =
              adsCtrl["facebookAdBannerAndroid"] ?? "";
          txtFacebookBannerIos.text = adsCtrl["facebookAdBanneriOS"] ?? "";
          txtFacebookInterstitialAndroid.text =
              adsCtrl["facebookAdInterstitialAndroid"] ?? "";
          txtFacebookInterstitialIos.text =
              adsCtrl["facebookAdInterstitialiOS"] ?? "";
          noAdsVisible = adsCtrl['isAdVisible'] ?? true;

          /*if (googleAdsVisible == true) {
            noAdsVisible = false;
          } else if (facebookAdsVisible == true) {
            noAdsVisible = false;
          } else {
            noAdsVisible = true;
          }*/
          update();
        }
      });
    });
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
          .update({
        fonts.googleAdsVisible: googleAdsVisible,
        fonts.facebookAdsVisible: facebookAdsVisible,
        fonts.adMobBannerAndroid: txtAdsBannerAndroid.text,
        fonts.adMobBanneriOS: txtAdsBannerIos.text,
        fonts.admobInterstitialAndroid: txtAdsInterstitialAndroid.text,
        fonts.admobInterstitialiOS: txtAdsInterstitialIos.text,
        fonts.facebookAdBannerAndroid: txtFacebookBannerAndroid.text,
        fonts.facebookAdBanneriOS: txtFacebookBannerIos.text,
        fonts.facebookAdInterstitialAndroid:
        txtFacebookInterstitialAndroid.text,
        fonts.facebookAdInterstitialiOS: txtFacebookInterstitialIos.text,
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
