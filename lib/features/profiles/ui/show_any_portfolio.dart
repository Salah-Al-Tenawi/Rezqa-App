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
import 'package:freelanc/features/profiles/controller/any_profile_controlelr.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

// ignore: must_be_immutable
class ShowAnyPortfolio extends StatelessWidget {
  AnyProfileControllerIm controllerIm =
      Get.put(AnyProfileControllerIm());
  FreeProfileControllerIm controllerPro = Get.put(FreeProfileControllerIm());

  ShowAnyPortfolio({
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
           
          ],
        ),
        FutureBuilder<List<PortfolioModel>>(
            future: controllerIm.getPortfolios(1),
            // initialData: ,
            builder: (buildContext, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: Lottie.asset(ImagesUrl.loadingLottie2));
              } else if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              }
               else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                return const Center(
                    child: Text(
                  'لا يوجد أعمال',
                ));
              }
              else {
                print("===========================else${snapshot.data}");
                return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (buildContext, index) {
                      final portfolio = snapshot.data![index];

                      return Text(portfolio.title);
                      //                   Column(
                      //                     children: [
                      //                       const Divider(
                      //                         endIndent: 20,
                      //                         indent: 20,
                      //                       ),
                      //                       const Divider(
                      //                         endIndent: 40,
                      //                         indent: 40,
                      //                       ),
                      //                       const Divider(
                      //                         endIndent: 60,
                      //                         indent: 60,
                      //                       ),
                      //                       const Divider(
                      //                         endIndent: 80,
                      //                         indent: 80,
                      //                       ),
                      //                       NameWithIconPortfolio(
                      //                         name: portfolio.title,
                      //                         icon: Icons.work_history_outlined,
                      //                       ),
                      //                       DescrptionsPortfolio(
                      //                           descrptions: portfolio.description),
                      //                       Row(
                      //                         mainAxisAlignment: MainAxisAlignment.spaceAround,
                      //                         children: [
                      //                           Text(
                      //                             "تاريخ الانجاز",
                      //                             style: font16blacknormal,
                      //                           ),
                      //                           Icon(
                      //                             Icons.date_range_outlined,
                      //                             color: MyColors.blackColor,
                      //                             size: 27.sp,
                      //                           ),
                      //                           SizedBox(
                      //                             width: 10.w,
                      //                           ),
                      //                           Text(portfolio.date)
                      //                         ],
                      //                       ),
                      //                       NameWithIconPortfolio(
                      //                           name: "صور المشروع", icon: Icons.image_outlined),
                      //                       SizedBox(
                      //                         height: 350.h,
                      //                         width: 400.w,
                      //                         child: PageView.builder(
                      //                             itemCount: portfolio.images.length ?? 0,
                      //                             itemBuilder: (buildContext, index) {
                      //                               return InkWell(
                      //                                 onTap: () {
                      //                                   showFullImage(
                      //                                       portfolio.images[index].url ?? "");
                      //                                 },
                      //                                 child: Image.network(
                      //                                     portfolio.images[index].url!),
                      //                               );
                      //                             }),
                      //                       ),
                      //                       ShowFilesPortfolio(
                      //                         lenghtList: portfolio.files.length,
                      //                         files: portfolio.files,
                      //                       ),
                      //                       ShowSkillesProjectPortfolio(
                      //                         data: portfolio.skills,
                      //                         lenghtList: portfolio.skills.length,
                      //                       )
                      //                     ],
                      //                   );
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
