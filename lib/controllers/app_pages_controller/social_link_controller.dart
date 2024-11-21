import 'dart:developer';

import '../../config.dart';

class SocialLinkController extends GetxController {
  dynamic usageCtrl;
  bool isLoading = false;
  String id = "";
  TextEditingController txtPrivacyPolicyLink = TextEditingController();
  TextEditingController txtFacebookLink = TextEditingController();
  TextEditingController txtLinkdinLink = TextEditingController();
  TextEditingController txtTwitterLink = TextEditingController();
  TextEditingController txtInstagramLink = TextEditingController();
  TextEditingController txtSnapChatLink = TextEditingController();
  TextEditingController txtSkypeLink = TextEditingController();
  TextEditingController txtYoutubeLink = TextEditingController();
  TextEditingController txtTelegramLink = TextEditingController();
  TextEditingController txtMessangerLink = TextEditingController();
  TextEditingController txtWhatsappLink = TextEditingController();
  TextEditingController txtCopyRightLink = TextEditingController();
  TextEditingController txtDescLink = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

//get data from firebase
  getData() async {
    await FirebaseFirestore.instance
        .collection(collectionName.socialConfig)
        .get()
        .then((value) {
      if (value.docs.isNotEmpty) {
        /*id = value.docs[0].id;
        usageCtrl = value.docs[0].data();
        txtYoutubeLink.text = usageCtrl["youtubeLink"];
        txtFacebookLink.text = usageCtrl["facebookLink"];
        txtInstagramLink.text = usageCtrl["instagramLink"];
        txtTwitterLink.text = usageCtrl["twitterLink"];
        txtMessangerLink.text = usageCtrl["messengerLink"];
        txtWhatsappLink.text = usageCtrl["whatsappLink"];
        txtSkypeLink.text = usageCtrl["skypeLink"];
        txtTelegramLink.text = usageCtrl["telegramLink"];
        txtLinkdinLink.text = usageCtrl["linkdinLink"];
        txtSnapChatLink.text = usageCtrl["snapChatLink"];*/

        value.docs.asMap().entries.forEach((element) {
          if (element.value.data()['title'] == fonts.youtubeLink) {
            txtYoutubeLink.text = element.value.data()["url"];
          }
          if (element.value.data()['title'] == fonts.facebookLink) {
            txtFacebookLink.text = element.value.data()["url"];
          }
          if (element.value.data()['title'] == fonts.instagramLink) {
            txtInstagramLink.text = element.value.data()["url"];
          }
          if (element.value.data()['title'] == fonts.twitterLink) {
            txtTwitterLink.text = element.value.data()["url"];
          }
          if (element.value.data()['title'] == fonts.messengerLink) {
            txtMessangerLink.text = element.value.data()["url"];
          }
          if (element.value.data()['title'] == fonts.messengerLink) {
            txtMessangerLink.text = element.value.data()["url"];
          }
          if (element.value.data()['title'] == fonts.whatsappLink) {
            txtWhatsappLink.text = element.value.data()["url"];
          }
          if (element.value.data()['title'] == fonts.whatsappLink) {
            txtWhatsappLink.text = element.value.data()["url"];
          }
          if (element.value.data()['title'] == fonts.telegramLink) {
            txtTelegramLink.text = element.value.data()["url"];
          }
          if (element.value.data()['title'] == fonts.skypeLink) {
            txtSkypeLink.text = element.value.data()["url"];
          }
          if (element.value.data()['title'] == fonts.linkdinLink) {
            txtLinkdinLink.text = element.value.data()["url"];
          }
          if (element.value.data()['title'] == fonts.snapChatLink) {
            txtSnapChatLink.text = element.value.data()["url"];
          }
          if (element.value.data()['title'] == fonts.desc) {
            txtDescLink.text = element.value.data()["url"];
          }
          if (element.value.data()['title'] == fonts.copyRight) {
            txtCopyRightLink.text = element.value.data()["url"];
          }
        });
      }
    });
    update();
  }

  updateData() {
    bool isLoginTest = appCtrl.storage.read(session.isLoginTest) ?? false;
    if (isLoginTest) {
      accessDenied(fonts.modification.tr);
    } else {
      isLoading = true;
      update();
      FirebaseFirestore.instance
          .collection(collectionName.socialConfig)
          .get()
          .then((value) async {
        if (value.docs.isNotEmpty) {
          log("value.docs :${value.docs.length}");
          /*  await FirebaseFirestore.instance
            .collection(collectionName.config)
            .doc(id)
            .update({
          "youtubeLink": txtYoutubeLink.text,
          "facebookLink": txtFacebookLink.text,
          "instagramLink": txtInstagramLink.text,
          "twitterLink": txtTwitterLink.text,
          "messengerLink": txtMessangerLink.text,
          "whatsappLink": txtWhatsappLink.text,
          "skypeLink": txtSkypeLink.text,
          "telegramLink": txtTelegramLink.text,
          "linkdinLink": txtLinkdinLink.text,
          "snapChatLink": txtSnapChatLink.text,
        });*/

          value.docs
              .asMap()
              .entries
              .forEach((element) async {
            String url = "";
            if (element.value.data()['title'] == fonts.youtubeLink) {
              url = txtYoutubeLink.text;
            }
            if (element.value.data()['title'] == fonts.facebookLink) {
              url = txtFacebookLink.text;
            }
            if (element.value.data()['title'] == fonts.instagramLink) {
              url = txtInstagramLink.text;
            }
            if (element.value.data()['title'] == fonts.twitterLink) {
              url = txtTwitterLink.text;
            }
            if (element.value.data()['title'] == fonts.messengerLink) {
              url = txtMessangerLink.text;
            }
            if (element.value.data()['title'] == fonts.messengerLink) {
              url = txtMessangerLink.text;
            }
            if (element.value.data()['title'] == fonts.whatsappLink) {
              url = txtWhatsappLink.text;
            }
            if (element.value.data()['title'] == fonts.whatsappLink) {
              url = txtWhatsappLink.text;
            }
            if (element.value.data()['title'] == fonts.telegramLink) {
              url = txtTelegramLink.text;
            }
            if (element.value.data()['title'] == fonts.skypeLink) {
              url = txtSkypeLink.text;
            }
            if (element.value.data()['title'] == fonts.linkdinLink) {
              url = txtLinkdinLink.text;
            }
            if (element.value.data()['title'] == fonts.snapChatLink) {
              url = txtSnapChatLink.text;
            }
            if (element.value.data()['title'] == fonts.desc) {
              url = txtDescLink.text;
            }
            if (element.value.data()['title'] == fonts.copyRight) {
              url = txtCopyRightLink.text;
            }
            log("url :$url");
            await FirebaseFirestore.instance
                .collection(collectionName.socialConfig)
                .doc(element.value.id)
                .update({"url": url});
          });
          isLoading = false;
          update();
        }
        getData();
      });
    }
  }

  setVal(title, value) {
    log("title == fonts.youtubeLink :${title == fonts.youtubeLink}");
    TextEditingController controller = TextEditingController();
    if (title == fonts.youtubeLink) {
      controller = txtYoutubeLink;
      controller.text = value;
    }
    if (title == fonts.facebookLink) {
      controller = txtFacebookLink;
      controller.text = value;
    }
    if (title == fonts.snapChatLink) {
      controller = txtSnapChatLink;
      controller.text = value;
    }
    if (title == fonts.whatsappLink) {
      controller = txtWhatsappLink;
      controller.text = value;
    }
    if (title == fonts.skypeLink) {
      controller = txtSkypeLink;
      controller.text = value;
    }
    if (title == fonts.instagramLink) {
      controller = txtInstagramLink;
      controller.text = value;
    }
    if (title == fonts.messengerLink) {
      controller = txtMessangerLink;
      controller.text = value;
    }
    if (title == fonts.twitterLink) {
      controller = txtTwitterLink;
      controller.text = value;
    }
    if (title == fonts.linkdinLink) {
      controller = txtLinkdinLink;
      controller.text = value;
    }
    if (title == fonts.telegramLink) {
      controller = txtTelegramLink;
      controller.text = value;
    }
    if (title == fonts.copyRight) {
      controller = txtCopyRightLink;
      controller.text = value;
    }
    if (title == fonts.desc) {
      controller = txtDescLink;
      controller.text = value;
    }
    log("title :$controller");
    return controller;
  }

  @override
  void onInit() {
    // TODO: implement onInit
    update();
    getData();
    super.onInit();
  }
}
