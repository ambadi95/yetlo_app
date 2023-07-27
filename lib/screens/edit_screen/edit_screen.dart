import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:path_provider/path_provider.dart';
import 'package:screenshot/screenshot.dart';
import 'package:toast/toast.dart';
import 'package:yetlo_app/utils/Colors.dart';
import 'package:yetlo_app/widgets/app_bar.dart';
import 'package:yetlo_app/widgets/common_button.dart';
import 'package:yetlo_app/widgets/normal_text.dart';
import '../home_screen/model.dart' as a;
import 'edit_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';

class EditScreen extends StatelessWidget {
  a.Re res;
  EditScreen({super.key, required this.res});

  CarouselController buttonCarouselController = CarouselController();

  Uint8List? _imageFile;

  //Create an instance of ScreenshotController
  ScreenshotController screenshotController = ScreenshotController();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<EditController>(
        didChangeDependencies: (data) async {
          await data.controller?.getFrameList(context);
          await data.controller?.getProfile(context);
        },
        builder: (controller) => Scaffold(
          backgroundColor: SECONDARYCOLOR,
          bottomNavigationBar: SizedBox(
            height: 80,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: FloatingActionButton(
                    backgroundColor: PRIMARY_COLOR,
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(30.0))
                    ),
                    child: const Icon(Icons.download_outlined,
                      color: Colors.black,
                    ),
                    onPressed: () async{
                      screenshotController.capture().then((Uint8List? image){
                        _imageFile = image;
                      }).catchError((onError){
                        print(onError);
                      });
                      await screenshotController.capture(delay: const Duration(milliseconds: 10)).then((Uint8List? image) async {
                        if (image != null) {
                          final directory = await getApplicationDocumentsDirectory();
                          final imagePath = await File('${directory.path}/image.png').create();
                          await imagePath.writeAsBytes(image);
                          print(imagePath);
                          /// Share Plugin
                          final result = await ImageGallerySaver.saveImage(image, name: 'image');
                          print(result);
                          if(result['isSuccess'] == true){
                            Toast.show('Downloaded to Gallery',
                                duration: Toast.lengthShort,
                                gravity: Toast.top,
                                backgroundColor: GREEN);
                          }
                        }
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
              appBar: CustomAppBar(
                appBarTitle: 'Edit Now ',
                actions: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                        onTap: () async {
                          await controller.getFrameList(context);
                        },
                        child: const Icon(
                          Icons.replay,
                          size: 30,
                        )),
                  )
                ],
              ),
              body: controller.frameListResponse == null ? const SizedBox() :
                  controller.profileResponse == null ? const SizedBox():
              SingleChildScrollView(
                child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      color: SECONDARYCOLOR,
                      child: Column(
                        children: [
                          Screenshot(
                            controller: screenshotController,
                            child: Stack(
                              children: [

                                Container(
                                  color: Colors.white,
                                  child: CarouselSlider.builder(
                                    itemCount:
                                        controller.frameListResponse?.res?.length,
                                    itemBuilder: (BuildContext context, int itemIndex,
                                            int pageViewIndex) =>
                                        SizedBox(
                                      width: double.infinity,
                                      child: Image.network(
                                        controller
                                            .frameListResponse!.res![itemIndex].img!,
                                        height: 600,
                                        width: 600,
                                        errorBuilder: (BuildContext context,
                                            Object exception,
                                            StackTrace? stackTrace) {
                                          return const Center(
                                              child: Text('Cannot Load Image!'));
                                        },
                                      ),
                                    ),
                                    carouselController: buttonCarouselController,
                                    options: CarouselOptions(
                                      height: 400,
                                      viewportFraction: 1,
                                      aspectRatio: 16 / 9,
                                      initialPage: 0,
                                      reverse: false,
                                      autoPlay: false,
                                      enlargeCenterPage: true,
                                      enlargeFactor: 0.5,
                                      scrollDirection: Axis.horizontal,
                                    ),
                                  ),
                                ),
                                Positioned(
                                  top: 40,
                                  child: Image.network(
                                    res.image!,
                                    height: 300,
                                    width: 400,
                                    errorBuilder: (BuildContext context,
                                        Object exception, StackTrace? stackTrace) {
                                      return const Center(
                                          child: Text('Cannot Load Image!'));
                                    },
                                  ),
                                ),
                                Positioned(
                                    top: 338,
                                    left: 20,
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            Image.network(
                                              'https://yetlosocial.yetloapps.com/icon/mobile.png',
                                              scale: 2.5,
                                              color: SECONDARYCOLOR,
                                            ),
                                            const SizedBox(
                                              width: 5,
                                            ),
                                            NormalText(
                                              text: controller
                                                  .profileResponse!.res![0].phone,
                                              fontcolor: SECONDARYCOLOR,
                                              fontSize: 10,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ],
                                        ),
                                        _sizedBox(17),
                                        Row(
                                          children: [
                                            Image.network(
                                              'https://yetlosocial.yetloapps.com/icon/website.png',
                                              scale: 2.5,
                                              color: SECONDARYCOLOR,
                                            ),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            NormalText(
                                              text: controller
                                                  .profileResponse!.res![0].website,
                                              fontcolor: SECONDARYCOLOR,
                                              fontSize: 10,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ],
                                        ),
                                      ],
                                    )),
                                Positioned(
                                    top: 338,
                                    right: 20,
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            const Icon(
                                              Icons.mail,
                                              color: SECONDARYCOLOR,
                                              size: 14,
                                            ),
                                            const SizedBox(
                                              width: 5,
                                            ),
                                            NormalText(
                                              text: controller
                                                  .profileResponse!.res![0].email,
                                              fontcolor: SECONDARYCOLOR,
                                              textAlign: TextAlign.end,
                                              fontSize: 10,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ],
                                        ),
                                        _sizedBox(17),
                                        Row(
                                          children: [
                                            const Icon(
                                              Icons.add_location,
                                              color: SECONDARYCOLOR,
                                              size: 14,
                                            ),
                                            const SizedBox(
                                              width: 5,
                                            ),
                                            NormalText(
                                              text: controller.profileResponse!
                                                  .res![0].whatsapp,
                                              fontcolor: SECONDARYCOLOR,
                                              textAlign: TextAlign.end,
                                              fontSize: 10,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ],
                                        ),
                                      ],
                                    )),

                              ],
                            ),
                          ),
                          _sizedBox(50),
                          Row(
                            children: [
                              CommonButton(
                                label: 'BackGround Color',
                                width: 200,
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              NormalText(
                                text: 'Template Color',
                                fontWeight: FontWeight.w500,
                                fontSize: 20,
                                fontcolor: PRIMARY_COLOR,
                              )
                            ],
                          ),

                        ],
                      ),
                    )),
              ),
            ));
  }

  Widget _sizedBox(double height) {
    return SizedBox(
      height: height,
    );
  }
}
