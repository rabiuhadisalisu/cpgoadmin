import '../../../config.dart';

class DesktopSwitchCommon extends StatelessWidget {
  final String? title;
  final bool? value;
  final ValueChanged<bool>? onChanged;
  final bool? isDivider;
  final double? width;
  const DesktopSwitchCommon(
      {Key? key,
      this.value,
      this.title,
      this.onChanged,
      this.isDivider,
      this.width})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: width ?? Sizes.s500,
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Expanded(
                  child: Text(
                    title!.tr,
                    overflow: TextOverflow.ellipsis,
                    style: AppCss.outfitMedium18.textColor(appCtrl.appTheme.dark),
                  ),
                ),
                Switch(
                    activeColor: appCtrl.appTheme.primary,
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    value: value!,
                    onChanged: onChanged)
              ]),
              if (isDivider != true)
                Divider(color: appCtrl.appTheme.primary.withOpacity(0.1))
            ]));
  }
}
