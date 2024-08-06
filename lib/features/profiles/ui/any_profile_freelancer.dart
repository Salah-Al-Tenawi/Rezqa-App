import 'package:flutter/material.dart';



import 'package:freelanc/features/profiles/controller/any_profile_controlelr.dart';
import 'package:freelanc/features/profiles/ui/widget/details_any_profile_freelancer.dart';
import 'package:freelanc/features/profiles/ui/widget/image_any_profile_freelancer.dart';
import 'package:freelanc/features/profiles/ui/widget/name_any_profile_freelancer.dart';
import 'package:freelanc/features/profiles/ui/widget/skilles_any_profile_freelancer.dart';
import 'package:get/get.dart';

class AnyProfileFreelnacer extends StatelessWidget {
  const AnyProfileFreelnacer({super.key});

  @override
  Widget build(BuildContext context) {
    AnyProfileControllerIm controllerIm = Get.put(AnyProfileControllerIm());

    return Scaffold(
        body: RefreshIndicator(
      onRefresh: () async {
        await controllerIm.getfreelancer();
      },
      child: CustomScrollView(
        slivers: [
          ImagesAnyProfileFreelancer(controllerIm: controllerIm,),
         
          NameAnyprofileFree(
            controllerIm: controllerIm,
          ),
          DetailsAnyProfileFree(
            controllerIm: controllerIm,
          ),
          SkillesAnyFree(
            controllerIm: controllerIm,
          ),
          // GoShowMyProtfolio(
          //   controllerIm: controllerIm,
          // ),
          
         
        ],
      ),
    ));
  }
}
