import 'package:goapp_admin/config.dart';

class SocialTextField extends StatelessWidget {
  final String? title1;
  final String? title2;
  final TextEditingController? controller1;
  final TextEditingController? controller2;

  const SocialTextField(
      {Key? key, this.title1, this.title2, this.controller1, this.controller2})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Responsive.isDesktop(context)?Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: DesktopTextFieldCommon(
              validator: (number) => Validation().statusValidation(number),
              title: title1,
              controller: controller1),
        ),
        const HSpace(Sizes.s30),
        title2 != null
            ? Expanded(
                child: DesktopTextFieldCommon(
                    validator: (number) =>
                        Validation().statusValidation(number),
                    title: title2,
                    controller: controller2),
              )
            : Container()
      ],
    ): Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        DesktopTextFieldCommon(
            validator: (number) => Validation().statusValidation(number),
            title: title1,
            controller: controller1),
        const VSpace(Sizes.s30),
        title2 != null
            ? DesktopTextFieldCommon(
                validator: (number) =>
                    Validation().statusValidation(number),
                title: title2,
                controller: controller2)
            : Container()
      ],
    );
  }
}
