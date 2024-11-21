import '../../../../config.dart';

class AppLogoDark extends StatelessWidget {
  final StateSetter? setState;
  final String? image;
  const AppLogoDark({Key? key, this.setState, this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppConfigurationController>(builder: (appConfigureCtrl) {
      return Stack(alignment: Alignment.centerLeft, children: [
        DragDropLayout(
            onCreated: (ctrl) => appConfigureCtrl.controller2 = ctrl,
            onDrop: (ev) async {
              appConfigureCtrl.imageUrl1 = ev.name;
              appConfigureCtrl.update();
              final bytes = await appConfigureCtrl.controller2!.getFileData(ev);
              appConfigureCtrl.getImage(dropImage: bytes, title: "appLogoDark");
            }),
        image!.isNotEmpty &&
            appConfigureCtrl.pickImage1 != null &&
            appConfigureCtrl.webImage1.isNotEmpty
            ? CommonDottedBorder(child: Image.memory(appConfigureCtrl.webImage1, fit: BoxFit.fill))
            .inkWell(
            onTap: () => appConfigureCtrl.getImage(
                source: ImageSource.gallery,
                context: context,
                title: "appLogoDark"))
            : image!.isNotEmpty
            ? CommonDottedBorder(child: Image.network(image!)).inkWell(
            onTap: () => appConfigureCtrl.getImage(
                source: ImageSource.gallery,
                context: context,
                title: "appLogoDark"))
            : appConfigureCtrl.pickImage1 == null
            ? const ImagePickUp().inkWell(
            onTap: () => appConfigureCtrl.onImagePickUp(
                setState, context, "appLogoDark"))
            : CommonDottedBorder(
            child: Image.memory(appConfigureCtrl.webImage1,
                fit: BoxFit.fill))
            .inkWell(
            onTap: () => appConfigureCtrl.getImage(
                source: ImageSource.gallery,
                context: context,
                title: "appLogoDark"))
      ]).height(appConfigureCtrl.isUploadSize ? Sizes.s80 : Sizes.s80);
    });
  }
}
