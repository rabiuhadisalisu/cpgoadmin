import '../../../../config.dart';

class OnBoardingWidgetClass {
  //table title
  TableRow tableWidget() => TableRow(
          decoration: BoxDecoration(
            color: appCtrl.appTheme.tableTitleColor,
          ),
          children: [
            CommonWidgetClass().commonTitleText(fonts.onBoardingLogo),
            CommonWidgetClass().commonTitleText(fonts.onBoardingTitle),
            CommonWidgetClass().commonTitleText(fonts.onBoardingDescription)
          ]);
}
