import '../../../../config.dart';

class OnBoardingImage extends StatelessWidget {
  final StateSetter? setState;
  final String? image;
  final String? title;
  const OnBoardingImage({Key? key, this.setState, this.image, this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<VariantOnBoardingController>(
        builder: (variantOnBoardingCtrl) {
      return Stack(alignment: Alignment.centerLeft, children: [
        DragDropLayout(
            onCreated: (ctrl) => variantOnBoardingCtrl.controller1 = ctrl,
            onDrop: (ev) async {
              variantOnBoardingCtrl.imageUrl = ev.name;
              variantOnBoardingCtrl.update();
              final bytes =
                  await variantOnBoardingCtrl.controller1!.getFileData(ev);
              variantOnBoardingCtrl.getImage(dropImage: bytes, title: title);
            }),
        image!.isNotEmpty &&
                variantOnBoardingCtrl.pickImage != null &&
                variantOnBoardingCtrl.webImage.isNotEmpty
            ? CommonDottedBorder(child: Image.memory(variantOnBoardingCtrl.webImage, fit: BoxFit.fill))
                .inkWell(
                    onTap: () => variantOnBoardingCtrl.getImage(
                        source: ImageSource.gallery,
                        context: context,
                        title: title))
            : image!.isNotEmpty
                ? CommonDottedBorder(child: Image.network(image!)).inkWell(
                    onTap: () => variantOnBoardingCtrl.getImage(
                        source: ImageSource.gallery,
                        context: context,
                        title: title))
                : variantOnBoardingCtrl.pickImage == null
                    ? const ImagePickUp().inkWell(
                        onTap: () => variantOnBoardingCtrl.onImagePickUp(
                            setState, context, title))
                    : CommonDottedBorder(
                            child: Image.memory(variantOnBoardingCtrl.webImage,
                                fit: BoxFit.fill))
                        .inkWell(
                            onTap: () => variantOnBoardingCtrl.getImage(
                                source: ImageSource.gallery,
                                context: context,
                                title: title))
      ]).height(variantOnBoardingCtrl.isUploadSize ? Sizes.s50 : Sizes.s50);
    });
  }
}
