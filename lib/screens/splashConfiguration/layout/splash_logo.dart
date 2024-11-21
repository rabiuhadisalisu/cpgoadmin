import '../../../config.dart';

class SplashLogo extends StatelessWidget {
  final StateSetter? setState;
  final String? image;
  final String? title;
  const SplashLogo({Key? key, this.setState, this.image, this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<VariantController>(builder: (variantCtrl) {
      return Stack(alignment: Alignment.centerLeft, children: [
        DragDropLayout(
            onCreated: (ctrl) => variantCtrl.controller1 = ctrl,
            onDrop: (ev) async {
              variantCtrl.imageUrl = ev.name;
              variantCtrl.update();
              final bytes = await variantCtrl.controller1!.getFileData(ev);
              variantCtrl.getImage(dropImage: bytes, title: title);
            }),
        image!.isNotEmpty &&
                variantCtrl.pickImage != null &&
                variantCtrl.webImage.isNotEmpty
            ? CommonDottedBorder(
                    child: Image.memory(variantCtrl.webImage, fit: BoxFit.fill))
                .inkWell(
                    onTap: () => variantCtrl.getImage(
                        source: ImageSource.gallery,
                        context: context,
                        title: title))
            : image!.isNotEmpty
                ? CommonDottedBorder(child: Image.network(image!)).inkWell(
                    onTap: () => variantCtrl.getImage(
                        source: ImageSource.gallery,
                        context: context,
                        title: title))
                : variantCtrl.pickImage == null
                    ? const ImagePickUp().inkWell(
                        onTap: () =>
                            variantCtrl.onImagePickUp(setState, context, title))
                    : CommonDottedBorder(
                            child: Image.memory(variantCtrl.webImage,
                                fit: BoxFit.fill))
                        .inkWell(
                            onTap: () => variantCtrl.getImage(
                                source: ImageSource.gallery,
                                context: context,
                                title: title))
      ]).height(variantCtrl.isUploadSize ? Sizes.s50 : Sizes.s50);
    });
  }
}
