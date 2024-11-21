import 'package:goapp_admin/config.dart';
import 'dart:io' as io;
import 'dart:math' as math;
import 'package:flutter/foundation.dart';

class ExitPopupController extends GetxController {
  dynamic usageCtrl;
  String idType = "";
  late DropzoneViewController? controller1;
  TextEditingController txtText = TextEditingController();
  TextEditingController txtPositiveText = TextEditingController();
  TextEditingController txtNegativeText = TextEditingController();
  TextEditingController txtDescText = TextEditingController();
  bool isAlert = false;
  bool isImageShow = false;
  XFile? imageFile;
  bool isUploadSize = false;
  Uint8List uploadWebImage = Uint8List(8);
  io.File? pickImage;
  bool isLoading = false;
  var random = math.Random();
  String imageName = "", imageUrl = "", initialUrl = "";
  Uint8List webImage = Uint8List(8);
  String id = "";

  //get data from firebase
  getData() async {
    await FirebaseFirestore.instance
        .collection(collectionName.exitPopupConfiguration)
        .get()
        .then((value) {
      if (value.docs.isNotEmpty) {
        id = value.docs[0].id;
        usageCtrl = value.docs[0].data();
        initialUrl = usageCtrl["image"] ?? "";
        txtText.text = usageCtrl["title"] ?? "";
        txtDescText.text = usageCtrl["desc"] ?? "";
        txtPositiveText.text = usageCtrl["positiveText"] ?? "";
        txtNegativeText.text = usageCtrl["negativeText"] ?? "";
        isImageShow = usageCtrl["showImage"] ?? true;
      }
    });
    update();
  }

  commonSwitcherValueChange(value) async {
    isImageShow = value;
    update();
  }

//on click Image
  onImagePickUp(setState, context, title) {
    bool isLoginTest = appCtrl.storage.read(session.isLoginTest) ?? false;
    if (isLoginTest) {
      accessDenied(fonts.modification.tr);
    } else {
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
  }

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
      applogoUpload(
          setState: setState,
          source: source,
          dropImage: dropImage,
          title: title,
          context: context,
          uploadFile: uploadFile);
    }
  }

  applogoUpload(
      {source,
      StateSetter? setState,
      dropImage,
      context,
      uploadFile,
      title}) async {
    if (dropImage != null) {
      if (imageName.contains("png") ||
          imageName.contains("jpg") ||
          imageName.contains("jpeg")) {
        var image = dropImage;
        uploadWebImage = image;
        isUploadSize = true;
        webImage = uploadWebImage;
        pickImage = io.File("a");
        uploadprintoFile(title);
        isAlert = false;
        update();
      } else {
        isAlert = true;
        update();
        await Future.delayed(DurationsClass.s2);
        isAlert = false;
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
        uploadprintoFile(title);
        isAlert = false;
        update();
      } else {
        isAlert = true;
        update();
        await Future.delayed(DurationsClass.s2);
        isAlert = false;
        update();
      }
    }
  }

// UPLOAD SELECTED IMAGE TO FIREBASE
  Future uploadprintoFile(title) async {
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
          }, onError: (err) {
            update();
          });
        });
      }
    }
  }

  uploadExitPopupConfiguartion() async {
    bool isLoginTest = appCtrl.storage.read(session.isLoginTest) ?? false;
    if (isLoginTest) {
      accessDenied(fonts.modification.tr);
    } else {
      isLoading = true;
      update();
      await FirebaseFirestore.instance
          .collection(collectionName.exitPopupConfiguration)
          .doc(id)
          .update({
        fonts.image: imageUrl == "" ? initialUrl : imageUrl,
        fonts.title: txtText.text,
        fonts.positiveText: txtPositiveText.text,
        fonts.negativeText: txtNegativeText.text,
        fonts.showImage: isImageShow,
        fonts.desc: txtDescText.text,
      });
      isLoading = false;
      update();
    }
  }

  @override
  void onReady() {
    getData();
    // TODO: implement onReady
    super.onReady();
  }
}
  // }
