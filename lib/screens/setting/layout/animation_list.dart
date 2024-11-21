import 'package:goapp_admin/config.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class AppBody {
  final String title;
  final Widget widget;
  AppBody(
    this.title,
    this.widget,
  );
}

final settingsCtrl = Get.put(SettingController());

class AnimationLayout {
  final listOfAnimations = <AppBody>[
    AppBody(
      'fallingDot',
      LoadingAnimationWidget.fallingDot(
        color: settingsCtrl.loaderColor,
        size: Sizes.s40,
      ),
    ),
    AppBody(
      'fourRotatingDots',
      LoadingAnimationWidget.fourRotatingDots(
        color: settingsCtrl.loaderColor,
        size: Sizes.s40,
      ),
    ),
    AppBody(
      'threeArchedCircle',
      LoadingAnimationWidget.threeArchedCircle(
        color: settingsCtrl.loaderColor,
        size: Sizes.s40,
      ),
    ),
    AppBody(
      'inkDrop',
      LoadingAnimationWidget.inkDrop(
        color: settingsCtrl.loaderColor,
        size: Sizes.s40,
      ),
    ),
    AppBody(
      'hexagonDots',
      LoadingAnimationWidget.hexagonDots(
        color: settingsCtrl.loaderColor,
        size: Sizes.s40,
      ),
    ),
    AppBody(
      'dotsTriangle',
      LoadingAnimationWidget.dotsTriangle(
        color: settingsCtrl.loaderColor,
        size: Sizes.s40,
      ),
    ),
    AppBody(
      'horizontalRotatingDots',
      LoadingAnimationWidget.horizontalRotatingDots(
        color: settingsCtrl.loaderColor,
        size: Sizes.s40,
      ),
    ),
    AppBody(
      'staggeredDotsWave',
      LoadingAnimationWidget.staggeredDotsWave(
        color: settingsCtrl.loaderColor,
        size: Sizes.s40,
      ),
    ),
    AppBody(
      'discreteCircle',
      LoadingAnimationWidget.discreteCircle(
        color: settingsCtrl.loaderColor,
        size: Sizes.s40,
      ),
    ),
  ];
}
