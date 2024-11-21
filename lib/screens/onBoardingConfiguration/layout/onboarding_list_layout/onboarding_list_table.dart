import '../../../../config.dart';

class OnBoardingListTable extends StatelessWidget {
  final List<TableRow>? children;

  const OnBoardingListTable({Key? key, this.children}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
        borderRadius: BorderRadius.circular(AppRadius.r6),
        child: Table(
                defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                columnWidths: const <int, TableColumnWidth>{
                  1: FlexColumnWidth(),
                  2: FlexColumnWidth(),
                  3: FlexColumnWidth()
                },
                children: children!)
            .decorated(
                border: Border.all(color: appCtrl.appTheme.primary),
                borderRadius: BorderRadius.circular(AppRadius.r6)));
  }
}
