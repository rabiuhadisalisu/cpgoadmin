import '../config.dart';

class CommonHeading extends StatelessWidget {
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

  const CommonHeading(
      {Key? key,
      required this.title,
      this.padding = 15,
      this.margin = 15,
      this.radius = 8,
      this.height = 45,
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
    return InkWell(
        onTap: onTap,
        child: Container(
            alignment: Alignment.bottomLeft,
            width: width ?? MediaQuery.of(context).size.width,
            margin: EdgeInsets.symmetric(horizontal: margin),
            height: Responsive.isMobile(context) ? Sizes.s45 : height,
            child: SelectableText(title, textAlign: TextAlign.center, style: style)));
  }
}
