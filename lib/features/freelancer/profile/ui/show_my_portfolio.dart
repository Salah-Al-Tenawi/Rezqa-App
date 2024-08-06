// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:freelanc/core/constant/imageurl.dart';

import 'package:freelanc/core/functions/show_full_image.dart';
import 'package:freelanc/core/themes/color_app.dart';
import 'package:freelanc/core/themes/text_styles_app.dart';
import 'package:freelanc/core/widgets/my_button.dart';
import 'package:freelanc/features/freelancer/profile/controller/freelancer_portfolio_controller.dart';
import 'package:freelanc/features/freelancer/profile/controller/freelancer_profile_controller.dart';
import 'package:freelanc/features/freelancer/profile/data/portfolio_model.dart';
import 'package:freelanc/features/freelancer/profile/ui/widget/descrptions_protfolio.dart';
import 'package:freelanc/features/freelancer/profile/ui/widget/files_for_project_protfolio.dart';
import 'package:freelanc/features/freelancer/profile/ui/widget/name_with_icon_portfolio.dart';
import 'package:freelanc/features/freelancer/profile/ui/widget/show_skilles_for_project_portfolio.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

// ignore: must_be_immutable
class ShowMYPortfolio extends StatelessWidget {
  FreelancerPortfolioControllerIm controllerIm =
      Get.put(FreelancerPortfolioControllerIm());
  FreeProfileControllerIm controllerPro = Get.put(FreeProfileControllerIm());
  ShowMYPortfolio({
    super.key,
    // required this.freelancerPortfolioControllerIm,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Column(
          children: [
            NameWithIconPortfolio(
                name: "معرض الأعمال", icon: Icons.browse_gallery_sharp),
            MyButton(
                onPressed: () {
                  controllerPro.gotoAddPortfolio();
                },
                child: Container(
                  height: 100.h,
                  width: 200.w,
                  margin: EdgeInsets.symmetric(vertical: 40.h),
                  decoration:
                      BoxDecoration(color: MyColors.greyColor, boxShadow: [
                    BoxShadow(
                        blurRadius: 1,
                        color: MyColors.blueColor,
                        offset: const Offset(-10, 10))
                  ]),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "أضف بعض الأعمال",
                          style: font17normalblue,
                        ),
                        Icon(
                          Icons.add,
                          color: MyColors.blueColor,
                        )
                      ],
                    ),
                  ),
                )),
          ],
        ),
        FutureBuilder<List<PortfolioModel>>(
            future: controllerIm.getAllPortfolio(),
            // initialData: ,
            builder: (buildContext, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: Lottie.asset(ImagesUrl.loadingLottie2));
              } else if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                return const Center(
                    child: Text(
                  'لا يوجد أعمال',
                ));
              } else {
                return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (buildContext, index) {
                      return Container(
                          height: 100,
                          width: 100,
                          child: Column(
                            children: [
                              const Divider(
                                endIndent: 20,
                                indent: 20,
                              ),
                              const Divider(
                                endIndent: 40,
                                indent: 40,
                              ),
                              const Divider(
                                endIndent: 60,
                                indent: 60,
                              ),
                              const Divider(
                                endIndent: 80,
                                indent: 80,
                              ),
                              NameWithIconPortfolio(
                                name: snapshot.data![index].title,
                                icon: Icons.work_history_outlined,
                              ),
                              DescrptionsPortfolio(
                                  descrptions:
                                      snapshot.data![index].description),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Text(
                                    "تاريخ الانجاز",
                                    style: font16blacknormal,
                                  ),
                                  Icon(
                                    Icons.date_range_outlined,
                                    color: MyColors.blackColor,
                                    size: 27.sp,
                                  ),
                                  SizedBox(
                                    width: 10.w,
                                  ),
                                  Text(snapshot.data![index].date)
                                ],
                              ),
                              NameWithIconPortfolio(
                                  name: "صور المشروع",
                                  icon: Icons.image_outlined),
                              SizedBox(
                                height: 350.h,
                                width: 400.w,
                                child: PageView.builder(
                                    itemCount:
                                        snapshot.data?[index].images.length ??
                                            0,
                                    itemBuilder: (buildContext, index) {
                                      return InkWell(
                                        onTap: () {
                                          showFullImage(snapshot.data?[index]
                                                  .images[index].url ??
                                              "");
                                        },
                                        child: Image.network(snapshot
                                                .data?[index]
                                                .images[index]
                                                .url ??
                                            ""),
                                      );
                                    }),
                              ),
                              ShowFilesPortfolio(
                                lenghtList: snapshot.data![index].files.length,
                                files: snapshot.data![index].files,
                              ),
                              ShowSkillesProjectPortfolio(
                                data: snapshot.data![index].skills,
                                lenghtList: snapshot.data![index].skills.length,
                              )
                            ],
                          ));
                    });
              }
            }),
      ],
    )

        //     Wrap(
        //   children:
        //       List.generate(profileCont.freelnacerModel!.potrfolio.length, (index) {
        //     return Column(
        //       children: [
        //         const Divider(
        //           endIndent: 20,
        //           indent: 20,
        //         ),
        //         const Divider(
        //           endIndent: 40,
        //           indent: 40,
        //         ),
        //         const Divider(
        //           endIndent: 60,
        //           indent: 60,
        //         ),
        //         const Divider(
        //           endIndent: 80,
        //           indent: 80,
        //         ),
        //         NameWithIconPortfolio(
        //           name: profileCont.freelnacerModel!.potrfolio[index].title,
        //           icon: Icons.work_history_outlined,
        //         ),
        //         DescrptionsPortfolio(
        //             descrptions:
        //                 profileCont.freelnacerModel!.potrfolio[index].description),
        //         Row(
        //           mainAxisAlignment: MainAxisAlignment.spaceAround,
        //           children: [
        //             Text(
        //               "تاريخ الانجاز",
        //               style: font16blacknormal,
        //             ),
        //             Row(
        //               children: [
        //                 Icon(
        //                   Icons.date_range_outlined,
        //                   color: MyColors.blackColor,
        //                   size: 27.sp,
        //                 ),
        //                 SizedBox(
        //                   width: 10.w,
        //                 ),
        //                 Text(profileCont.freelnacerModel!.potrfolio[index].date)
        //               ],
        //             )
        //           ],
        //         ),
        //         NameWithIconPortfolio(
        //             name: "صور المشروع", icon: Icons.image_outlined),
        //         SizedBox(
        //           height: 350.h,
        //           width: 400.w,
        //           child: PageView.builder(
        //               itemCount: profileCont
        //                   .freelnacerModel!.potrfolio[index].images.length,
        //               itemBuilder: (buildContext, index) {
        //                 return InkWell(
        //                   onTap: () {
        //                     showFullImage(profileCont.freelnacerModel!
        //                         .potrfolio[index].images[index].url!);
        //                   },
        //                   child: Image.network(profileCont.freelnacerModel!
        //                         .potrfolio[index].images[index].url!),
        //                 );
        //               }),
        //         ),
        //         NameWithIconPortfolio(
        //             name: "ملفات مرفقة للمشروع", icon: Icons.file_copy_outlined),
        //             Wrap(
        //   children: List.generate(profileCont.freelnacerModel!.potrfolio[index].files.length, (index) {
        //     return CustomListTile(
        //       onTap: () {
        //         // print(index);
        //       },
        //       title: profileCont.freelnacerModel!.potrfolio[index].files[index].url,
        //       color: MyColors.greyColor,
        //       // padding: EdgeInsets.all(50),
        //       margin: EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),

        //       iconleading: const Icon(Icons.file_copy),
        //     );
        //   }),
        // ),
        //         // const ShowFilesPortfolio(),
        //         NameWithIconPortfolio(
        //             name: "المهارات المستعلمة ", icon: Icons.king_bed),
        //             Container(
        //   padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
        //   margin: EdgeInsets.only(top: 10.h, bottom: 200.h),
        //   decoration: BoxDecoration(boxShadow: [
        //     BoxShadow(
        //         color: MyColors.blueColor,
        //         blurRadius: 5,
        //         offset: const Offset(0, 0))
        //   ], color: MyColors.greyColor, borderRadius: BorderRadius.circular(25)),
        //   child: Wrap(
        //     spacing: 10.sp,
        //     runSpacing: 20,
        //     children: List.generate(profileCont.freelnacerModel!.potrfolio[index].skills.length, (index) {
        //       return IntrinsicWidth(
        //         child: IntrinsicHeight(
        //           child: Container(
        //             padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
        //             decoration: BoxDecoration(
        //                 borderRadius: BorderRadius.circular(10),
        //                 color: MyColors.blueColor,
        //                 boxShadow: [
        //                   BoxShadow(
        //                       color: MyColors.blackColor,
        //                       blurRadius: 6,
        //                       offset: const Offset(1, 1))
        //                 ]),
        //             child: Center(
        //               child: Text(
        //                 profileCont.freelnacerModel!.potrfolio[index].skills[index].name!
        //                 ,
        //                 style: TextStyle(color: MyColors.greyTextfildColor),
        //               ),
        //             ),
        //           ),
        //         ),
        //       );
        //     }),
        //   ),
        // )
        //         // const ShowSkillesProjectPortfolio(),
        //       ],
        //     );
        //   }),
        // )
        );
  }
}
