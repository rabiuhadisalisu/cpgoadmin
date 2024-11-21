import 'package:goapp_admin/config.dart';
import 'package:goapp_admin/screens/adsConfiguration/index.dart';
import 'package:goapp_admin/screens/exitPopupConfiguration/index.dart';
import 'package:goapp_admin/screens/shareContent/index.dart';
import 'package:goapp_admin/screens/socialLinks/index.dart';
import 'package:goapp_admin/screens/appConfiguration/index.dart';

class IndexController extends GetxController {
  ValueNotifier<bool> isOpen = ValueNotifier(true);
  GlobalKey<ScaffoldState>? scaffoldDrawerKey;
  GlobalKey<ScaffoldState>? scaffoldKey;
  int selectedIndex = 0;
  int? subSelectIndex;
  String pageName = fonts.dashboard.tr;
  bool isHover = false;
  int isSelectedHover = 0;

  bool isDrawerOpen = false;
  double size = 250.0;
  bool large = true;
  ExpansionTileController? controller = ExpansionTileController();


  final ScrollController scrollController = ScrollController();

  //list of bottommost page
  List<Widget> widgetOptions = <Widget>[
    Dashboard(),
    AppConfiguration(),
    SplashConfiguration(),
    OnBoardingConfiguration(),
    ThemeColor(),
    Container(),
    SocialLinks(),
    SettingScreen(),
    AdsConfiguration(),
    ExitPopupConfiguration(),
    ShareContentConfiguration(),
    NotificationPage(),
    // const Text("LOGOUT")
  ];

  @override
  void onReady() {
    // TODO: implement onReady
    appCtrl.getStorageData();
    super.onReady();
  }
}
