import '../config.dart';

class ColorLayout extends StatelessWidget {
  final String title;
  final double padding;
  final double margin;
  final double radius;
  final double height;
  final double fontSize;
  final GestureTapCallback? onTap;
  final TextStyle? style;
  final Color? color;
  final Color? fontColor;
  final Widget? icon;
  final double? width;
  final Border? border;
  final FontWeight? fontWeight;

  const ColorLayout(
      {Key? key,
      required this.title,
      this.padding = 15,
      this.margin = 15,
      this.radius = 8,
      this.height = 25,
      this.fontSize = 14,
      this.onTap,
      this.style,
      this.color,
      this.fontColor,
      this.icon,
      this.width,
      this.border,
      this.fontWeight = FontWeight.w700})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(title.tr,
          style: AppCss.outfitMedium18
              .textColor(appCtrl.appTheme.dark)
              .textHeight(1.5)),
      const VSpace(Sizes.s8),
      InkWell(
          onTap: onTap,
          child: Container(
            width: width ?? MediaQuery.of(context).size.width,
            height: Responsive.isMobile(context) ? Sizes.s15 : height,
            decoration: BoxDecoration(
                color: color ?? appCtrl.appTheme.primary,
                border: border,
                borderRadius:
                    radius > 0 ? BorderRadius.circular(radius) : null),
          ))
    ]);
  }
}
