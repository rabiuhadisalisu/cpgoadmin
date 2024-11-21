import '../../../../../config.dart';

class HeaderConfigWidgetClass {
  //table title
  TableRow tableWidget() => TableRow(
          decoration: BoxDecoration(
            color: appCtrl.appTheme.tableTitleColor,
          ),
          children: [
            CommonWidgetClass().commonTitleText(fonts.title),
            CommonWidgetClass().commonTitleText(fonts.image),
            CommonWidgetClass().commonTitleText(fonts.action)
          ]);
}
