import 'dart:async';
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:goapp_admin/config.dart';
import 'dart:io' as io;
import 'dart:math' as math;

class NotificationController extends GetxController {
  String idType = "";
  String imageName = "";
  late DropzoneViewController? controller1;
  TextEditingController txtTitle = TextEditingController();
  TextEditingController txtText = TextEditingController();
  bool isImageShow = false;
  XFile? imageFile;
  bool isUploadSize = false;
  Uint8List uploadWebImage = Uint8List(8);
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  io.File? pickImage;
  bool isLoading = false;
  var random = math.Random();
  String imageUrl = "", initialUrl = "";
  Uint8List webImage = Uint8List(8);
  String id = "";

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

          update();
        } else {
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
  Future uploadprintoFile(context) async {
    bool isLoginTest = appCtrl.storage.read(session.isLoginTest) ?? false;
    if (isLoginTest) {
      accessDenied(fonts.modification.tr);
    } else {
      if (formKey.currentState!.validate()) {
        isLoading = true;
        update();
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
              sendNotification(context);
            }, onError: (err) {
              update();
            });
          });
        } else {
          sendNotification(context);
        }
      }
    }
  }

  //send notification
  Future<void> sendNotification(context) async {

    FirebaseFirestore.instance.collection(collectionName.notification).add({
      "des": txtText.text,
      "title": txtTitle.text,
      "image": imageUrl,
      "createdDate": DateTime.now().millisecondsSinceEpoch
    });

    FirebaseFirestore.instance
        .collection(collectionName.users)
        .get()
        .then((value) {
      value.docs.asMap().entries.forEach((element) async {
        final data = {
          "notification": {"body": txtText.text, "title": txtTitle.text},
          "priority": "high",
          "data": {
            "click_action": "FLUTTER_NOTIFICATION_CLICK",
            "alertMessage": 'true',
            "title": txtTitle.text,
            "image": imageUrl
          },
          "to": element.value.data()["pushToken"]
        };

        final headers = {
          'content-type': 'application/json',
          'Authorization':
              'key=AAAAHIKYM9E:APA91bFuY6tqpBGAyI9I6YvLfbb3U-_JVJibUZYJrIs_M4V8J-Ex2JJrENftzOUAnU3l3XKrmlLUarT6cJ8uVDhnrD2yOcprGEaNuqpLVL0eE9IQtm-wREKkS5GV13Nterj6AhvxUvrC'
        };

        BaseOptions options = BaseOptions(
          connectTimeout: 5000,
          receiveTimeout: 3000,
          headers: headers,
        );

        try {
          final response = await Dio(options)
              .post('https://fcm.googleapis.com/fcm/send', data: data);

          if (response.statusCode == 200) {
            txtTitle.text = "";
            txtText.text = "";
            idType = "";
            imageUrl = "";
            imageFile = null;
            webImage = Uint8List(8);

          } else {
            isLoading = false;
            update();
            // on failure do sth
          }
        } catch (e) {
          isLoading = false;
          update();
          log('exception $e');
        }
      });
      isLoading = false;
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Notification Send Successfully')));
      update();
    });
  }
// }
}
