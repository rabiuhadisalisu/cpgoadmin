import 'dart:math' as math;
import 'package:flutter/foundation.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../config.dart';
import 'dart:io' as io;

class VariantOnBoardingController extends GetxController {
  bool isLoading = false;
  String id = "";
  bool isListLayout = true;

  TextEditingController txtOnBoardingTitle = TextEditingController();
  TextEditingController txtOnBoardingDescription = TextEditingController();

  XFile? imageFile;
  bool isUploadSize = false;
  Uint8List uploadWebImage = Uint8List(8);
  io.File? pickImage;
  var random = math.Random();
  String imageName = "", imageUrl = "";
  Uint8List webImage = Uint8List(8);
  late DropzoneViewController? controller1;

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
      onBoardingLogoUpload(
          setState: setState,
          source: source,
          dropImage: dropImage,
          title: title,
          context: context,
          uploadFile: uploadFile);
    }
  }

  onBoardingLogoUpload(
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
    // bool isLoginTest = appCtrl.storage.read(session.isLoginTest);
    // if (isLoginTest) {
    //   accessDenied(fonts.modification.tr);
    // } else {
    //   bool isLoginTest = appCtrl.storage.read(session.isLoginTest);
    //   if (isLoginTest) {
    //     accessDenied(fonts.modification.tr);
    //   } else {

    // isLoading = true;
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
            // uploadImage(title, imageUrl);
          }, onError: (err) {
            update();
          });
        });
      }
    }
    //   }
    // }
  }

  getData() {
    FirebaseFirestore.instance
        .collection(collectionName.onBoardScreenConfiguration)
        .get()
        .then((value) {
      value.docs.asMap().entries.forEach((element) async {
        if (value.docs.isNotEmpty) {
          id = value.docs[0].id;
          if (value.docs.isNotEmpty) {
            // idType = hexStringToColor(splashColor['firstColor']);
            update();
          }
        }
      });
    });
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


  commonValueChange() async {
    bool isLoginTest = appCtrl.storage.read(session.isLoginTest) ?? false;
    if (isLoginTest) {
      accessDenied(fonts.modification.tr);
    } else {
      if (txtOnBoardingTitle.text
          .trim()
          .isNotEmpty &&
          txtOnBoardingDescription.text
              .trim()
              .isNotEmpty &&
          imageUrl.isNotEmpty) {
        isLoading = true;
        update();

        await FirebaseFirestore.instance
            .collection(collectionName.onBoardScreenConfiguration)
            .add({
          "logo": imageUrl,
          "title": txtOnBoardingTitle.text,
          "description": txtOnBoardingDescription.text,
        });

        isLoading = false;

        isListLayout = true;
        update();
      } else {
        Fluttertoast.showToast(
          msg: "Title, Description, or Image is blank.",
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 5,
          backgroundColor: Colors.white,
          textColor: Colors.black,
          fontSize: 16.0,
        );
      }
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
