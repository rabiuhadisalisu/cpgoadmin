import '../../../../../config.dart';

class HeaderConfigListTable extends StatelessWidget {
  final List<TableRow>? children;
  const HeaderConfigListTable({Key? key, this.children}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(AppRadius.r6),
      child: Table(
        columnWidths: const <int, TableColumnWidth>{
          1: FlexColumnWidth(),
          2: FlexColumnWidth(),
          3: FlexColumnWidth(),
          4: FlexColumnWidth(),
          5: FlexColumnWidth(),
        },
        children: children!,
      ).decorated(
          border: Border.all(color: appCtrl.appTheme.primary),
          borderRadius: BorderRadius.circular(AppRadius.r6)),
    );
  }
}
