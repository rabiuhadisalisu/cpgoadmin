import 'dart:math' as math;
import 'package:flutter/foundation.dart';

import '../../config.dart';
import 'dart:io' as io;

class VariantController extends GetxController {
  bool isLoading = false;
  String id = "";
  Color firstColor = appCtrl.appTheme.primary;
  Color secondColor = appCtrl.appTheme.primary;
  Color titleColor = appCtrl.appTheme.primary;
  TextEditingController txtSplashTitle = TextEditingController();
  TextEditingController txtHeight = TextEditingController();
  TextEditingController txtWidth = TextEditingController();
  List<Color> currentColors = [Colors.yellow, Colors.green];
  List<Color> colorHistory = [];
  XFile? imageFile;
  bool isUploadSize = false;
  Uint8List uploadWebImage = Uint8List(8);
  io.File? pickImage;
  var random = math.Random();
  String imageName = "", imageUrl = "", initialURL = "";
  Uint8List webImage = Uint8List(8);
  late DropzoneViewController? controller1;
  String idType = "";
  String splashTitle = "";
  String firstColorTitle = "";
  String secondColorTitle = "";
  String titleColorTitle = "";
  bool titleVisible = false;
  final RegExp regexNum = RegExp(r'^[0-9]*$');

  // GET IMAGE FROM GALLERY
  Future getImage(
      {source,
      StateSetter? setState,
      dropImage,
      context,
      uploadFile,
      title}) async {
    bool isLoginTest = appCtrl.storage.read(session.isLoginTest) ?? false;
    if (isLoginTest) {
      accessDenied(fonts.modification.tr);
    } else {
      splashLogoUpload(
          setState: setState,
          source: source,
          dropImage: dropImage,
          title: title,
          context: context,
          uploadFile: uploadFile);
    }
  }

  splashLogoUpload(
      {source,
      StateSetter? setState,
      dropImage,
      context,
      uploadFile,
      title}) async {
    bool isLoginTest = appCtrl.storage.read(session.isLoginTest) ?? false;
    if (isLoginTest) {
      accessDenied(fonts.modification.tr);
    } else {
      if (dropImage != null) {
        if (imageName.contains("png") ||
            imageName.contains("jpg") ||
            imageName.contains("jpeg")) {
          var image = dropImage;
          uploadWebImage = image;
          isUploadSize = true;
          webImage = uploadWebImage;
          pickImage = io.File("a");
          uploadLogoFile(title);
          update();
        } else {
          update();
          await Future.delayed(DurationsClass.s2);
          update();
        }
      } else {
        final ImagePicker picker = ImagePicker();
        imageFile = (await picker.pickImage(source: ImageSource.gallery))!;
        if (imageFile!.name.contains("png") ||
            imageFile!.name.contains("jpg") ||
            imageFile!.name.contains("jpeg")) {
          var image = await imageFile!.readAsBytes();
          uploadWebImage = image;
          isUploadSize = true;
          webImage = uploadWebImage;
          pickImage = io.File(imageFile!.path);
          uploadLogoFile(title);
          update();
        } else {
          update();
          await Future.delayed(DurationsClass.s2);
          update();
        }
      }
    }
  }

  // UPLOAD SELECTED IMAGE TO FIREBASE
  Future uploadLogoFile(title) async {
    bool isLoginTest = appCtrl.storage.read(session.isLoginTest) ?? false;
    if (isLoginTest) {
      accessDenied(fonts.modification.tr);
    } else {
      if (pickImage != null) {
        update();
        String fileName = DateTime
            .now()
            .millisecondsSinceEpoch
            .toString();
        Reference reference = FirebaseStorage.instance.ref().child(fileName);
        UploadTask? uploadTask;
        uploadTask = reference.putData(webImage);
        uploadTask.then((res) async {
          res.ref.getDownloadURL().then((downloadUrl) async {
            imageUrl = downloadUrl;
            update();
            await Future.delayed(DurationsClass.s3);
            splashTitle = title;
          }, onError: (err) {
            update();
          });
        });
      }
    }
    //   }
    // }
  }

  commonSwitcherValueChange(index, value) async {
    if (index == 1) {
      titleVisible = await value;
    } else {
      txtSplashTitle.text = await value;
    }
    update();
  }

  setColor(index, title, color) async {
    if (index == 1) {
      firstColor = await color;
      firstColorTitle = await title;
    } else if (index == 2) {
      secondColor = await color;
      secondColorTitle = await title;
    } else {
      titleColor = await color;
      titleColorTitle = await title;
    }
    update();
  }

  //on click Image
  onImagePickUp(setState, context, title) {
    if (kIsWeb) {
      getImage(source: ImageSource.gallery, context: context, title: title);
    } else {
      imagePickerOption(
          setState: setState,
          cameraTap: () {
            getImage(
                source: ImageSource.camera,
                setState: setState,
                context: context,
                title: title);
            Get.back();
          },
          galleryTap: () {
            getImage(
                source: ImageSource.gallery,
                setState: setState,
                context: context,
                title: title);
            Get.back();
          });
    }
  }

  colorToHexString(Color color) {
    return '#${color.value.toRadixString(16).substring(2, 8)}';
  }

  hexStringToColor(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF$hexColor";
    }
    return Color(int.parse(hexColor, radix: 16));
  }

  getData() {
    FirebaseFirestore.instance
        .collection(collectionName.splashConfiguration)
        .get()
        .then((value) {
      value.docs.asMap().entries.forEach((element) async {
        if (value.docs.isNotEmpty) {
          id = value.docs[0].id;
          var splashColor = value.docs[0].data();
          if (value.docs.isNotEmpty) {
            firstColor = await hexStringToColor(splashColor['firstColor']);
            secondColor = await hexStringToColor(splashColor['secondColor']);
            splashTitle = fonts.splashLogo;
            firstColorTitle = fonts.firstColor;
            secondColorTitle = fonts.secondColor;
            titleColorTitle = fonts.splashTitleColor;
            titleColor =
                await hexStringToColor(splashColor['splashTitleColor']);
            titleVisible = await splashColor['splashTitleVisible'];
            txtSplashTitle.text = await splashColor['splashTitle'];
            txtHeight.text = await splashColor['splashLogoHeight'];
            txtWidth.text = await splashColor['splashLogoWeight'];
            initialURL = await splashColor['splashLogo'];
            update();
          }
        }
      });
      update();
    });
  }

  setFontSize(value, index) async {
    index == 1 ? txtHeight.text = await value : txtWidth.text = await value;
    update();
  }

  uploadSplashdata() async {
    bool isLoginTest = appCtrl.storage.read(session.isLoginTest) ?? false;
    if (isLoginTest) {
      accessDenied(fonts.modification.tr);
    } else {
      isLoading = true;
      update();
      await FirebaseFirestore.instance
          .collection(collectionName.splashConfiguration)
          .doc(id)
          .update({
        splashTitle: imageUrl == "" ? initialURL : imageUrl,
        firstColorTitle: colorToHexString(firstColor),
        secondColorTitle: colorToHexString(secondColor),
        titleColorTitle: colorToHexString(titleColor),
        fonts.splashTitleVisible: titleVisible,
        fonts.splashTitle: txtSplashTitle.text,
        fonts.splashLogoHeight: txtHeight.text,
        fonts.splashLogoWeight: txtWidth.text
      });
      isLoading = false;
      update();
    }
  }

  @override
  void onInit() {
    // TODO: implement onInit
    update();
    getData();
    super.onInit();
  }
}
