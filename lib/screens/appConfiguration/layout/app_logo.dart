import '../../../../config.dart';

class AppLogo extends StatelessWidget {
  final StateSetter? setState;
  final String? image;
  const AppLogo({Key? key, this.setState, this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppConfigurationController>(builder: (appConfigureCtrl) {
      return Stack(alignment: Alignment.centerLeft, children: [
        DragDropLayout(
            onCreated: (ctrl) => appConfigureCtrl.controller1 = ctrl,
            onDrop: (ev) async {
              appConfigureCtrl.imageUrl = ev.name;
              appConfigureCtrl.update();
              final bytes = await appConfigureCtrl.controller1!.getFileData(ev);
              appConfigureCtrl.getImage(dropImage: bytes, title: "appLogo");
            }),
        image!.isNotEmpty &&
                appConfigureCtrl.pickImage != null &&
                appConfigureCtrl.webImage.isNotEmpty
            ? CommonDottedBorder(child: Image.memory(appConfigureCtrl.webImage, fit: BoxFit.fill))
                .inkWell(
                    onTap: () => appConfigureCtrl.getImage(
                        source: ImageSource.gallery,
                        context: context,
                        title: "appLogo"))
            : image!.isNotEmpty
                ? CommonDottedBorder(child: Image.network(image!)).inkWell(
                    onTap: () => appConfigureCtrl.getImage(
                        source: ImageSource.gallery,
                        context: context,
                        title: "appLogo"))
                : appConfigureCtrl.pickImage == null
                    ? const ImagePickUp().inkWell(
                        onTap: () => appConfigureCtrl.onImagePickUp(
                            setState, context, "appLogo"))
                    : CommonDottedBorder(
                            child: Image.memory(appConfigureCtrl.webImage,
                                fit: BoxFit.fill))
                        .inkWell(
                            onTap: () => appConfigureCtrl.getImage(
                                source: ImageSource.gallery,
                                context: context,
                                title: "appLogo"))
      ]).height(appConfigureCtrl.isUploadSize ? Sizes.s80 : Sizes.s80);
    });
  }
}
