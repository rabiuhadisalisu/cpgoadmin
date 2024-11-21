

import '../config.dart';

class AppArray {
  //language list
  var languageList = [
    {'name': 'english', 'locale': const Locale('en', 'US')},
    {'name': 'arabic', 'locale': const Locale('ar', 'AE')},
    {'name': 'hindi', 'locale': const Locale('hi', 'IN')},
    {'name': 'korean', 'locale': const Locale('ko', 'KR')}
  ];

  //action list
  var fontSizes = [
    '8',
    '10',
    '12',
    '14',
    '16',
    '18',
    '20',
    '22',
    '24',
    '26',
    '28',
    '30'
  ];

  //action list
  var logoSizes = [
    '50',
    '60',
    '80',
    '90',
    '100',
    '120',
    '140',
    '150',
    '160',
    '180',
    '190',
    '200'
  ];

  //action list
  var actionList = [
    {'title': "english"},
    {'title': "hindi"},
    {'title': "korean"},
    {'title': "arabic"},
  ];

// Languages list
  var languagesList = [
    {"title": "english", 'locale': const Locale('en', 'US'), "code": "en"},
    {"title": "hindi", 'locale': const Locale('hi', 'IN'), "code": "hi"},
    {"title": "french", 'locale': const Locale('fr', 'CA'), "code": "fr"},
    {"title": "italian", 'locale': const Locale('it', 'IT'), "code": "it"},
    {"title": "german", 'locale': const Locale('ge', 'GE'), "code": "ge"},
    {"title": "japanese", 'locale': const Locale('ja', 'JP'), "code": "ja"},
  ];

  //Drawer list
  var drawerList = [
    {
      'icon': svgAssets.dashLine,
      'title': fonts.dashboard,
      "darkIcon": svgAssets.dashDark
    },
    {
      'icon': svgAssets.appConfigLine,
      'title': fonts.appConfiguration,
      "darkIcon": svgAssets.appConfigDark
    },
    {
      'icon': svgAssets.splashLine,
      'title': fonts.splashConfiguration,
      "darkIcon": svgAssets.splashDark
    },
    {
      'icon': svgAssets.onboardLine,
      'title': fonts.onBoardingConfiguration,
      "darkIcon": svgAssets.onboardDark
    },
    {
      'icon': svgAssets.themeLine,
      'title': fonts.themeColor,
      "darkIcon": svgAssets.themeDark
    },
    {
      'icon': svgAssets.headerLine,
      'title': fonts.headerConfig,
      "darkIcon": svgAssets.headerDark,
      "children": [
        {
          'icon': svgAssets.leftLine,
          'title': fonts.leftIcon,
          "darkIcon": svgAssets.leftDark
        },
        {
          'icon': svgAssets.rightLine,
          'title': fonts.rightIcon,
          "darkIcon": svgAssets.rightDark,
        }
      ]
    },
    {
      'icon': svgAssets.socialLine,
      'title': fonts.socialLink,
      "darkIcon": svgAssets.socialDark
    },
    {
      'icon': svgAssets.settingLine,
      'title': fonts.loader,
      "darkIcon": svgAssets.settingDark
    },
    {
      'icon': svgAssets.adLine,
      'title': fonts.adsConfiguration,
      "darkIcon": svgAssets.adDark
    },
    {
      'icon': svgAssets.exitLine,
      'title': fonts.exitPopupConfiguration,
      "darkIcon": svgAssets.exitDark
    },
    {
      'icon': svgAssets.shareLine,
      'title': fonts.shareContent,
      "darkIcon": svgAssets.shareDark
    },
    {
      'icon': svgAssets.notificationLine,
      'title': "notification",
      "darkIcon": svgAssets.notificationDark
    },
  ];
}
