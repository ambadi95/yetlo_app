import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:yetlo_app/utils/common.dart';
import 'package:yetlo_app/widgets/app_bar.dart';
import 'home_controller.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
        didChangeDependencies: (data) async{
          await data.controller?.getSubCategories(context);
        },
        builder: (controller) => Scaffold(
          appBar: CustomAppBar(
            appBarTitle: 'Home ',
            actions: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: ()async{
                  await controller.getSubCategories(context);
                  },
                    child: const Icon(Icons.replay, size: 30,)),
              )
            ],
          ),
              body: controller.subCategoryResponse == null ? const SizedBox() :  Padding(
                padding: const EdgeInsets.all(8.0),
                child: GridView.builder(
                    gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                        maxCrossAxisExtent: 200,
                        childAspectRatio: 3 / 2,
                        crossAxisSpacing: 20,
                        mainAxisSpacing: 20),
                    itemCount: controller.subCategoryResponse?.res?.length,
                    itemBuilder: (BuildContext context, index) {
                      return InkWell(
                        onTap: (){
                        controller.navigateToEditScreen(controller.subCategoryResponse?.res?[index]);
                        },
                        child: Container(
                          height: 70,
                          width: 70,
                          decoration: BoxDecoration(
                            color: dynamicColor(controller.subCategoryResponse!.res![index].backgroundColor!),
                            borderRadius: BorderRadius.circular(10)
                          ),
                          child: Image.network(
                              controller.subCategoryResponse!.res![index].image!,
                            height: 60,
                            width: 60,
                            errorBuilder: (BuildContext context, Object exception,
                                StackTrace? stackTrace) {
                              return const Center(child:  Text('Cannot Load Image!'));
                            },
                          ),
                        ),
                      );
                    }),
              ),
            ));
  }

  Widget _sizedBox(double height) {
    return SizedBox(
      height: height,
    );
  }
}
