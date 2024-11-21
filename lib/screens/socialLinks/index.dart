import '../../config.dart';

class SocialLinks extends StatelessWidget {
  final socialLinkCtrl = Get.put(SocialLinkController());

  SocialLinks({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SocialLinkController>(builder: (_) {

        return Stack(alignment: Alignment.center, children: [
          Form(
              key: socialLinkCtrl.formKey,
              child: StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection(collectionName.socialConfig)
                      .snapshots(),
                  builder: (context, snapShot) {
                    if (snapShot.hasData) {
                      return Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                            CommonHeading(
                                    title: fonts.socialLink.tr,
                                    style: AppCss.outfitblack20
                                        .textColor(appCtrl.appTheme.primary))
                                .paddingOnly(left: Insets.i15),
                            SizedBox(
                                child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                  Expanded(
                                      child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                        SocialTextField(
                                            title1: fonts.youtubeLink.tr,
                                            controller1:
                                                socialLinkCtrl.txtYoutubeLink,
                                            title2: fonts.facebookLink.tr,
                                            controller2:
                                                socialLinkCtrl.txtFacebookLink),
                                        const VSpace(Sizes.s30),
                                        SocialTextField(
                                            title1: fonts.instagramLink.tr,
                                            title2: fonts.twitterLink.tr,
                                            controller1:
                                                socialLinkCtrl.txtInstagramLink,
                                            controller2:
                                                socialLinkCtrl.txtTwitterLink),
                                        const VSpace(Sizes.s30),
                                        SocialTextField(
                                            title1: fonts.messengerLink.tr,
                                            title2: fonts.whatsappLink.tr,
                                            controller1:
                                                socialLinkCtrl.txtMessangerLink,
                                            controller2:
                                                socialLinkCtrl.txtWhatsappLink),
                                        const VSpace(Sizes.s30),
                                        SocialTextField(
                                            title1: fonts.skypeLink.tr,
                                            title2: fonts.telegramLink.tr,
                                            controller1:
                                                socialLinkCtrl.txtSkypeLink,
                                            controller2:
                                                socialLinkCtrl.txtTelegramLink),
                                        const VSpace(Sizes.s30),
                                        SocialTextField(
                                            title1: fonts.linkdinLink.tr,
                                            title2: fonts.snapChatLink.tr,
                                            controller1:
                                                socialLinkCtrl.txtLinkdinLink,
                                            controller2:
                                                socialLinkCtrl.txtSnapChatLink),
                                            const VSpace(Sizes.s30),
                                        SocialTextField(
                                            title1: fonts.copyRight.tr,
                                            title2: fonts.desc.tr,
                                            controller1:
                                                socialLinkCtrl.txtCopyRightLink,
                                            controller2:
                                                socialLinkCtrl.txtDescLink),
                                        const VSpace(Sizes.s30),
                                        CommonButton(
                                          width: Sizes.s200,
                                            margin: 0,

                                            icon: socialLinkCtrl.isLoading
                                                ? CircularProgressIndicator(
                                                    color:
                                                        appCtrl.appTheme.white)
                                                :null,
                                            onTap: () {
                                              socialLinkCtrl.updateData();
                                            },
                                            title: fonts.update.tr,
                                            style: AppCss.outfitSemiBold14
                                                .textColor(
                                                    appCtrl.appTheme.white))
                                      ]))
                                ]).paddingAll(Insets.i30))
                          ])
                          .paddingSymmetric(
                              horizontal: Insets.i20, vertical: Insets.i10)
                          .boxExtension();
                   /*   return   GridView.builder(
                          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisSpacing: Sizes.s30,
                            mainAxisSpacing: Sizes.s30,
                            mainAxisExtent: Sizes.s80,
                            crossAxisCount: 2,
                          ),
                          itemCount: snapShot.data!.docs.length,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            return  DesktopTextFieldCommon(
                                title: snapShot.data!.docs[index].data()['title'],
                                controller: socialLinkCtrl.setVal(snapShot.data!.docs[index].data()['title'], snapShot.data!.docs[index].data()['url']));
                          });*/
                    } else {
                      return Container();
                    }
                  }))
        ]);

    });
  }
}
