import 'dart:developer';
import 'dart:math' as math;
import 'package:flutter/foundation.dart';
import 'package:goapp_admin/config.dart';
import 'dart:io' as io;

class AppConfigurationController extends GetxController {
  dynamic usageCtrl;
  bool isLoading = false;
  bool isAlert = false;
  String id = "";
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late DropzoneViewController? controller1;
  late DropzoneViewController? controller2;
  TextEditingController txtappName = TextEditingController();
  String idType = "";
  int onBoardingVariant = 1;
  bool isSplashVisible = false,
      isOnboardingVisible = false,
      pullToRefresh = false,
      clearCookies = false,
      footerVisible = false,
      headerVisible = false;
  XFile? imageFile, imageFile1;
  bool isUploadSize = false;
  Uint8List uploadWebImage = Uint8List(8);
  io.File? pickImage;
  io.File? pickImage1;
  var random = math.Random();
  String imageName = "", imageUrl = "",imageUrl1 = "", initialUrl = "",initialUrl1 = "";
  Uint8List webImage = Uint8List(8);
  Uint8List webImage1 = Uint8List(8);

  commonSwitcherValueChange(index, value) async {
    if (index == 2) {
      isSplashVisible = value;
    } else if (index == 3) {
      isOnboardingVisible = value;
    } else if (index == 4) {
      pullToRefresh = value;
    } else if (index == 5) {
      clearCookies = value;
    } else if (index == 6) {
      footerVisible = value;
    } else if (index == 7) {
      headerVisible = value;
    }
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
      appLogoUpload(
          setState: setState,
          source: source,
          dropImage: dropImage,
          title: title,
          context: context,
          uploadFile: uploadFile);
    }
  }

  appLogoUpload(
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
        log("uploadWebImage : $uploadWebImage");
        Image image1 = Image.memory(uploadWebImage);
        log("image1 : $image1");
        isUploadSize = true;
        if (title == "appLogo") {
          webImage = uploadWebImage;
          pickImage = io.File("a");
        } else {
          webImage1 = uploadWebImage;
          pickImage1 = io.File("a");
        }

        uploadLogoFile(title);
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
      log("imageFile : $imageFile");

      if (imageFile!.name.contains("png") ||
          imageFile!.name.contains("jpg") ||
          imageFile!.name.contains("jpeg")) {
        var image = await imageFile!.readAsBytes();
        uploadWebImage = image;
        Image image1 = Image.memory(uploadWebImage);
        log("image1 : $image1");
        isUploadSize = true;
        if (title == "appLogo") {
          webImage = uploadWebImage;
          pickImage = io.File("a");
        } else {
          webImage1 = uploadWebImage;
          pickImage1 = io.File("a");
        }

        uploadLogoFile(title);
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
  Future uploadLogoFile(title) async {
    bool isLoginTest = appCtrl.storage.read(session.isLoginTest) ?? false;
    if (isLoginTest) {
      accessDenied(fonts.modification.tr);
    } else {
      if (pickImage != null) {
        update();
        String fileName = DateTime.now().millisecondsSinceEpoch.toString();
        Reference reference = FirebaseStorage.instance.ref().child(fileName);
        UploadTask? uploadTask;
        uploadTask = reference.putData(webImage);
        uploadTask.then((res) async {
          log(uploadTask.toString());
          log("res : $res");
          res.ref.getDownloadURL().then((downloadUrl) async {
            imageUrl = downloadUrl;

            update();
            await Future.delayed(DurationsClass.s3);
          }, onError: (err) {
            update();
          });
        });
      }
      if (pickImage1 != null) {
        update();
        String fileName = DateTime.now().millisecondsSinceEpoch.toString();
        Reference reference = FirebaseStorage.instance.ref().child(fileName);
        UploadTask? uploadTask;
        uploadTask = reference.putData(webImage1);
        uploadTask.then((res) async {
          log(uploadTask.toString());

          res.ref.getDownloadURL().then((downloadUrl) async {
            log("imageUrl1 : $downloadUrl");
            imageUrl1 = downloadUrl;
            update();
            await Future.delayed(DurationsClass.s3);
          }, onError: (err) {
            update();
          });
        });
      }
    }
  }

  saveBanner(title, titleId) async {
    onBoardingVariant = titleId;
    update();
  }

  //get data from firebase
  getData() async {
    await FirebaseFirestore.instance
        .collection(collectionName.config)
        .get()
        .then((value) {
      if (value.docs.isNotEmpty) {
        log("VALUE : ${value.docs.length}");
        id = value.docs[0].id;
        usageCtrl = value.docs[0].data();
        initialUrl = usageCtrl["appLogo"] ?? "";
        initialUrl1 = usageCtrl["appLogoDark"] ?? "";

        txtappName.text = usageCtrl["appName"] ?? "";
        isSplashVisible = usageCtrl["isSplashVisible"] ?? false;
        isOnboardingVisible = usageCtrl["isOnboardingVisible"] ?? false;
        pullToRefresh = usageCtrl["pullToRefresh"] ?? false;
        clearCookies = usageCtrl["clearCookies"] ?? false;
        footerVisible = usageCtrl["footerVisible"] ?? false;
        headerVisible = usageCtrl["headerVisible"] ?? false;
        onBoardingVariant = usageCtrl["onBoardingVariant"] ?? 1;
        onBoardingVariant = usageCtrl["onBoardingVariant"] ?? 1;
      }
    });
    update();
  }

  uploadAppConfiguartion() async {
    bool isLoginTest = appCtrl.storage.read(session.isLoginTest) ?? false;
    if (isLoginTest) {
      accessDenied(fonts.modification.tr);
    } else {
      isLoading = true;
      log("CHECKK :$imageUrl1");
      update();
      await FirebaseFirestore.instance
          .collection(collectionName.config)
          .doc(id)
          .update({
        fonts.appLogo: pickImage == null ? initialUrl : imageUrl,
        fonts.appLogoDark: pickImage1 == null ? initialUrl1 : imageUrl1,
        fonts.appName: txtappName.text,
        fonts.isSplashVisible: isSplashVisible,
        fonts.isOnboardingVisible: isOnboardingVisible,
        fonts.pullToRefresh: pullToRefresh,
        fonts.clearCookies: clearCookies,
        fonts.footerVisible: footerVisible,
        fonts.headerVisible: headerVisible,
        fonts.onBoardingVariant: onBoardingVariant
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
