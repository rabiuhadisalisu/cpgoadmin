import '../../../../config.dart';

class PopupImage extends StatelessWidget {
  final StateSetter? setState;
  final String? image;
  const PopupImage({Key? key, this.setState, this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ExitPopupController>(builder: (exitPopupCtrl) {
      return Stack(alignment: Alignment.centerLeft, children: [
        DragDropLayout(
            onCreated: (ctrl) => exitPopupCtrl.controller1 = ctrl,
            onDrop: (ev) async {
              exitPopupCtrl.imageUrl = ev.name;
              exitPopupCtrl.update();
              final bytes = await exitPopupCtrl.controller1!.getFileData(ev);
              exitPopupCtrl.getImage(dropImage: bytes, title: "image");
            }),
        image!.isNotEmpty &&
                exitPopupCtrl.pickImage != null &&
                exitPopupCtrl.webImage.isNotEmpty
            ? CommonDottedBorder(child: Image.memory(exitPopupCtrl.webImage, fit: BoxFit.fill))
                .inkWell(
                    onTap: () => exitPopupCtrl.getImage(
                        source: ImageSource.gallery,
                        context: context,
                        title: "image"))
            : image!.isNotEmpty
                ? CommonDottedBorder(child: Image.network(image!)).inkWell(
                    onTap: () => exitPopupCtrl.getImage(
                        source: ImageSource.gallery,
                        context: context,
                        title: "image"))
                : exitPopupCtrl.pickImage == null
                    ? const ImagePickUp().inkWell(
                        onTap: () => exitPopupCtrl.onImagePickUp(
                            setState, context, "image"))
                    : CommonDottedBorder(
                            child: Image.memory(exitPopupCtrl.webImage,
                                fit: BoxFit.fill))
                        .inkWell(
                            onTap: () => exitPopupCtrl.getImage(
                                source: ImageSource.gallery,
                                context: context,
                                title: "image"))
      ]).height(exitPopupCtrl.isUploadSize ? Sizes.s80 : Sizes.s80);
    });
  }
}
