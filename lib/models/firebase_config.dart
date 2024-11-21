class FirebaseConfigModel {
  String? bannerAddId,
      primaryLightColor,
      primaryDarkColor,
      gradientColor1,
      gradientColor2,
      razorPaySecret,
      chatGPTKey,
      interstitialAdIdAndroid,
      interstitialAdIdIOS,
      payPalClientId,
      payPalSecret,
      stripeKey,
      stripePublishKey,
      privacyPolicyLink,
      rateAppAndroidId,
      rateAppIOSId,
      refundLink,
      facebookAddAndroidId,
      facebookInterstitialAd,
      facebookRewardAd,
      facebookAddIOSId,
      facebookInterstitialIOSAd,
      facebookRewardIOSAd,
      appLogo,
  appLogoDark,
      image,
      splashLogo,
      onBoardingLogo,
      flutterWavePublicKey,
      paystackPublicKey;
  bool? isSplashVisible, pullToRefresh, isOnboardingVisible, clearCookies;
  bool? headerVisible,
      footerVisible,
      splashTitleVisible,
      gradientColorVisible,
      customThemeColorVisible,
      customGradientColorVisible;
  bool? isTheme, isRTL;
  bool? isAddShow,
      isRazorPay,
      isStripe,
      isPaypal,
      isInApp,
      isChatHistory,
      isGuestLoginEnable,
      isFacebookAdEnable,
      isGoogleAdmobEnable,
      isFlutterWave,
      isPaystack;

  FirebaseConfigModel({
    this.bannerAddId,
    this.primaryLightColor,
    this.chatGPTKey,
    this.interstitialAdIdAndroid,
    this.interstitialAdIdIOS,
    this.payPalClientId,
    this.payPalSecret,
    this.stripeKey,
    this.stripePublishKey,
    this.privacyPolicyLink,
    this.refundLink,
    this.rateAppAndroidId,
    this.rateAppIOSId,
    this.isSplashVisible,
    this.headerVisible,
    this.footerVisible,
    this.splashTitleVisible,
    this.gradientColorVisible,
    this.customThemeColorVisible,
    this.customGradientColorVisible,
    this.primaryDarkColor,
    this.gradientColor1,
    this.isFacebookAdEnable,
    this.gradientColor2,
    this.razorPaySecret,
    this.facebookAddAndroidId,
    this.facebookInterstitialAd,
    this.facebookRewardAd,
    this.facebookAddIOSId,
    this.facebookInterstitialIOSAd,
    this.facebookRewardIOSAd,
    this.appLogo,
    this.appLogoDark,
    this.image,
    this.splashLogo,
    this.onBoardingLogo,
    this.isAddShow,
    this.isPaypal,
    this.isRTL,
    this.pullToRefresh,
    this.isOnboardingVisible,
    this.clearCookies,
    this.isInApp,
    this.isRazorPay,
    this.isStripe,
    this.isTheme,
    this.isChatHistory,
    this.isGuestLoginEnable,
    this.isGoogleAdmobEnable,
    this.flutterWavePublicKey,
    this.isFlutterWave,
    this.isPaystack,
    this.paystackPublicKey,
  });

  FirebaseConfigModel.fromJson(Map<String, dynamic> json) {
    bannerAddId = json['bannerAddId'] ?? "";
    primaryLightColor = json['primaryLightColor'] ?? "";
    primaryDarkColor = json['primaryDarkColor'] ?? "true";
    gradientColor1 = json['gradientColor1'] ?? "";
    chatGPTKey = json['chatGPTKey'];
    interstitialAdIdAndroid = json['interstitialAdIdAndroid'] ?? "";
    interstitialAdIdIOS = json['interstitialAdIdIOS'] ?? "";
    payPalClientId = json['payPalClientId'] ?? "";
    payPalSecret = json['payPalSecret'] ?? "";
    stripeKey = json['stripeKey'] ?? "";
    stripePublishKey = json['stripePublishKey'] ?? "";
    privacyPolicyLink = json['privacyPolicyLink'] ?? "";
    refundLink = json['refundLink'] ?? "";
    rateAppAndroidId = json['rateAppAndroidId'] ?? "";
    rateAppIOSId = json['rateAppIOSId'] ?? "";
    facebookAddAndroidId = json['facebookAddAndroidId'] ?? "";
    facebookInterstitialAd = json['facebookInterstitialAd'] ?? "";
    facebookRewardAd = json['facebookRewardAd'] ?? "";
    facebookAddIOSId = json['facebookAddIOSId'] ?? "";
    facebookInterstitialIOSAd = json['facebookInterstitialIOSAd'] ?? "";
    facebookRewardIOSAd = json['facebookRewardIOSAd'] ?? "";
    appLogo = json['appLogo'] ?? "";
    appLogoDark = json['appLogoDark'] ?? "";
    image = json['image'] ?? "";
    splashLogo = json['splashLogo'] ?? "";
    onBoardingLogo = json['onBoardingLogo'] ?? "";
    isSplashVisible = json['isSplashVisible'] ?? true;
    headerVisible = json['headerVisible'] ?? true;
    footerVisible = json['footerVisible'] ?? true;
    splashTitleVisible = json['splashTitleVisible'] ?? true;
    gradientColorVisible = json['gradientColorVisible'] ?? true;
    customThemeColorVisible = json['customThemeColorVisible'] ?? true;
    customGradientColorVisible = json['customGradientColorVisible'] ?? true;
    isFacebookAdEnable = isFacebookAdEnable == true ? false : true;
    pullToRefresh = json['pullToRefresh'] ?? true;
    isOnboardingVisible = json['isOnboardingVisible'] ?? true;
    clearCookies = json['clearCookies'] ?? true;
    isRTL = json['isRTL'] ?? false;
    isChatHistory = json['isChatHistory'] ?? true;
    isAddShow = json['isAddShow'] ?? true;
    isRazorPay = json['isRazorPay'] ?? true;
    isPaypal = json['isPayPal'] ?? true;
    isStripe = json['isStripe'] ?? true;
    isInApp = json['isInApp'] ?? true;
    isTheme = json['isTheme'] ?? false;
    isGuestLoginEnable = json['isGuestLoginEnable'] ?? true;
    isGoogleAdmobEnable = json['isGoogleAdmobEnable'] ?? true;
    gradientColor2 = json['gradientColor2'] ?? "";
    razorPaySecret = json['razorPaySecret'] ?? "";
    paystackPublicKey = json['paystackPublicKey'] ?? "";
    isPaystack = json['isPaystack'] ?? true;
    isFlutterWave = json['isFlutterWave'] ?? true;
    flutterWavePublicKey = json['flutterWavePublicKey'] ?? "";
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['bannerAddId'] = bannerAddId;
    data['primaryLightColor'] = primaryLightColor;
    data['chatGPTKey'] = chatGPTKey;
    data['interstitialAdIdAndroid'] = interstitialAdIdAndroid;
    data['interstitialAdIdIOS'] = interstitialAdIdIOS;
    data['payPalClientId'] = payPalClientId;
    data['payPalSecret'] = payPalSecret;
    data['stripeKey'] = stripeKey;
    data['stripePublishKey'] = stripePublishKey;
    data['privacyPolicyLink'] = privacyPolicyLink;
    data['refundLink'] = refundLink;
    data['rateAppAndroidId'] = rateAppAndroidId;
    data['rateAppIOSId'] = rateAppIOSId;
    data['facebookAddAndroidId'] = facebookAddAndroidId;
    data['facebookInterstitialAd'] = facebookInterstitialAd;
    data['facebookRewardAd'] = facebookRewardAd;
    data['facebookAddIOSId'] = facebookAddIOSId;
    data['facebookInterstitialIOSAd'] = facebookInterstitialIOSAd;
    data['facebookRewardIOSAd'] = facebookRewardIOSAd;
    data['appLogo'] = appLogo;
    data['appLogoDark'] = appLogoDark;
    data['image'] = image;
    data['splashLogo'] = splashLogo;
    data['onBoardingLogo'] = onBoardingLogo;
    data['isSplashVisible'] = isSplashVisible;
    data['headerVisible'] = headerVisible;
    data['footerVisible'] = footerVisible;
    data['splashTitleVisible'] = splashTitleVisible;
    data['gradientColorVisible'] = gradientColorVisible;
    data['customThemeColorVisible'] = customThemeColorVisible;
    data['customGradientColorVisible'] = customGradientColorVisible;
    data['pullToRefresh'] = pullToRefresh;
    data['isOnboardingVisible'] = isOnboardingVisible;
    data['clearCookies'] = clearCookies;
    data['isFacebookAdEnable'] = isFacebookAdEnable;
    data['isAddShow'] = isAddShow;
    data['isStripe'] = isStripe;
    data['isPayPal'] = isPaypal;
    data['isRazorPay'] = isRazorPay;
    data['gradientColor1'] = gradientColor1;
    data['primaryDarkColor'] = primaryDarkColor;
    data['gradientColor2'] = gradientColor2;
    data['razorPaySecret'] = razorPaySecret;
    data['isChatHistory'] = isChatHistory;
    data['isInApp'] = isInApp;
    data['isGuestLoginEnable'] = isGuestLoginEnable;
    data['isGoogleAdmobEnable'] = isGoogleAdmobEnable;
    data['flutterWavePublicKey'] = flutterWavePublicKey;
    data['isFlutterWave'] = isFlutterWave;
    data['isPaystack'] = isPaystack;
    data['paystackPublicKey'] = paystackPublicKey;
    return data;
  }
}
