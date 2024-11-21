
import 'package:goapp_admin/config.dart';

class ShareContentController extends GetxController {
  String idType = "";
  String imageName = "";
  bool isLoading = false;
  late DropzoneViewController? controller1;
  TextEditingController txtText = TextEditingController();
  String id = "";
  dynamic usageCtrl;

  //get data from firebase
  getData() async {
    await FirebaseFirestore.instance
        .collection(collectionName.config)
        .get()
        .then((value) {
      if (value.docs.isNotEmpty) {
        id = value.docs[0].id;
        usageCtrl = value.docs[0].data();
        txtText.text = usageCtrl["shareContentTitle"] ?? "";
      }
    });
    update();
  }

  shareContentConfiguartion() async {
    bool isLoginTest = appCtrl.storage.read(session.isLoginTest) ?? false;
    if (isLoginTest) {
      accessDenied(fonts.modification.tr);
    } else {
      isLoading = true;
      update();
      await FirebaseFirestore.instance
          .collection(collectionName.config)
          .doc(id)
          .update({
        fonts.shareContentTitle: txtText.text,
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
