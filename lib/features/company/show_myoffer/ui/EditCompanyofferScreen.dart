
import 'package:flutter/material.dart';
import 'package:freelanc/features/company/addoffercompany/controller/CombanyAddofferController.dart';
import 'package:freelanc/features/company/addoffercompany/ui/widget/custom_AgeRange_Section.dart';
import 'package:freelanc/features/company/addoffercompany/ui/widget/custom_Category_Section.dart';
import 'package:freelanc/features/company/addoffercompany/ui/widget/custom_Gender_Section.dart';
import 'package:freelanc/features/company/addoffercompany/ui/widget/custom_Health_Section.dart';
import 'package:freelanc/features/company/addoffercompany/ui/widget/custom_attendencetype_section.dart';
import 'package:freelanc/features/company/addoffercompany/ui/widget/custom_Military_Section.dart';
import 'package:freelanc/features/company/addoffercompany/ui/widget/custom_Salary_Section.dart';
import 'package:freelanc/features/company/addoffercompany/ui/widget/custom_Skills_Section.dart';
import 'package:freelanc/features/company/addoffercompany/ui/widget/custom_SubmitButton.dart';
import 'package:freelanc/features/company/addoffercompany/ui/widget/custom_Transport_Section.dart';
import 'package:freelanc/features/company/addoffercompany/ui/widget/customLocation.dart';
import 'package:freelanc/features/company/addoffercompany/ui/widget/custom_buildEssentialSkillsSection.dart';
import 'package:freelanc/features/company/addoffercompany/ui/widget/custom_jobrole_section.dart';
import 'package:freelanc/features/company/addoffercompany/ui/widget/customwidgetTextfild.dart';
import 'package:freelanc/features/company/show_myoffer/model/Model_for_companyofferonly.dart';
import 'package:get/get.dart';

class EditCompanyOfferScreen extends StatelessWidget {
  final CompanyOfferController companyOfferController = Get.put(CompanyOfferController());
  final JobOffer_ForcompanyOnly job;

 EditCompanyOfferScreen({Key? key, required this.job}) : super(key: key) {
  
}




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 232, 236, 240),
      appBar: AppBar(
        backgroundColor: const Color(0XFF2A547C),
        centerTitle: true,
        title: const Text(
          'تعديل عرض شركة',
          style: TextStyle(fontSize: 30, color: Colors.white),
        ),
      ),
      body: Obx(
        () => ListView(
          padding: const EdgeInsets.all(10),
          children: [
           const SizedBox(
              height: 30,
            ),
            buildJobRoleSection(
              companyOfferController: companyOfferController,
            ),
            const Divider(),
            buildlocationtypeSection(companyOfferController: companyOfferController,),
            const Divider(),
            buildattendencetypeSection(companyOfferController: companyOfferController,),
            const Divider(),
            buildSalarySection(companyOfferController: companyOfferController,),
            const Divider(),
            buildTransportSection(companyOfferController: companyOfferController,),
            const Divider(),
            buildHealthInsuranceSection(companyOfferController: companyOfferController,),
            const Divider(),
            CustomTextField(
              label: "وصف العرض",
              maxLines: 6,
              controller: companyOfferController.offerDesController,
              onChanged: companyOfferController.onOfferDesChanged,
            ),
            const Divider(),
            buildAgeRangeSection(companyOfferController: companyOfferController,),
            const Divider(),
            buildMilitaryServiceSection(companyOfferController: companyOfferController,),
            const Divider(),
            buildGenderSection(companyOfferController: companyOfferController,),
            const Divider(),
            buildCategorySection(companyOfferController: companyOfferController,),
            const Divider(),
        //    buildSkillsSection(companyOfferController: companyOfferController,),
            const Divider(),
        //    buildEssentialSkillsSection(),
            const Divider(),
            buildSubmitButton(companyOfferController: companyOfferController,),
          ],
        ),
      ),
    );
  }
}
